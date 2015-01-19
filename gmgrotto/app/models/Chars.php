<?php  
class Chars extends Eloquent {
    protected $table = 'charList';
      
    static public function getAttacks($uid){
        $start = DB::select('SELECT * FROM charList INNER JOIN char_comb ON charList.charId=char_comb.charId WHERE userId = ?', array($uid));
        
        foreach($start as $char){
            // Get Their Attacks
            $attacks = DB::select('SELECT attack_name, attack_score FROM char_attacks WHERE charId = ?', array($char->charId));
         
            // Push attacks to char array
            $char->attacks = $attacks;  
            // Calculate Initiative
            $i = $char -> initiative;
            $roll = User::rollDice(1,20);
            $ooi = $i + $roll;
            $char->order = $ooi;
        }        
        return $start;
    }
             
    static public function fight(){
        $uid = Session::get('uid');
        $charList = DB::select('SELECT charList.charId, userId, charName, defense, gen_attack, melee, ranged, tough, attack_name, attack_score FROM charList INNER JOIN char_comb ON charList.charId=char_comb.charId INNER JOIN char_attacks ON charList.charId=char_attacks.charId WHERE userId = ?', array($uid));
        $list = DB::select('SELECT charName FROM charList WHERE userId = ?', array($uid));
        
        function getInputs($input, $charList){
            $inputValues = "";
            foreach($charList as $char){
                $inputName = $char->charId . "_" . $input;
                $result = Input::get($inputName);
                $inputValues = array_add($inputValues, $char->charName, $result);
            }       
            return $inputValues;             
        }
        
        function getAttackScores($attackNames, $charList){
            $start = "";
            foreach($charList as $char){
                $charId = $char->charId;
                $charName = $char->charName;
                $attackName = $attackNames[$charName];
                $results = ""; 
                if($attackName == 'melee'){
                    $results = DB::table('char_comb')->where('charId', $charId)->pluck('melee');    
                }elseif($attackName == 'ranged'){
                    $results = DB::table('char_comb')->where('charId', $charId)->pluck('ranged');    
                }elseif($attackName == 'gen_attack'){
                    $results = DB::table('char_comb')->where('charId', $charId)->pluck('gen_attack');    
                }else{
                    $score = DB::select('SELECT attack_score FROM char_attacks WHERE charId = ? AND attack_name = ?', array($charId, $attackName));
                    foreach($score as $s){
                        $results = $s->attack_score;    
                    }
                }                
                $start = array_add($start, $charName, $results);                                                          
            }
            return $start;      
        }
        
        // Input Variables
        $attackNames = getInputs('attackName', $charList);
        $enemyNames = getInputs('enemyName', $charList);
        $attackScores = getAttackScores($attackNames, $charList);
        $defenseScores = getInputs('defenseScore', $charList);
        $toughnessScores = getInputs('toughSave', $charList);
        
        // Save old Inputs to Session        
        $oldValues = ['enemyNames' => $enemyNames, 'defenseScores' => $defenseScores, 'toughnessScores' => $toughnessScores];
        Session::put('oldInput', $oldValues);
        
        function attackResults($as, $ds, $uid, $list){
            $attack = $as;
            $defense = $ds;
            $start = array();
            foreach($list as $char){
                $charName = $char->charName;
                $roll = User::rollDice(1,20);
                // If they roll a 1 on attack, critical failure
                    if($roll == 1){
                        $result = array('res' => 'fails.', 'roll' => $roll);
                    }elseif($roll == 20){
                        // If they roll a 20 on attack, critical success
                        $result = array('res' => 'succeeds!', 'roll' => $roll);
                    }else{                            
                        // Check Results otherwise
                        $resultScore = ($attack[$charName] + $roll) - $defense[$charName];                    
                        // Result Arrays
                        if($resultScore >= 0 ){// Array for Successful attack
                            $result = array('res' => 'succeeds!', 'roll' => $roll);
                        } else{ // Array for failed attack
                            $result = array('res' => 'fails.', 'roll' => $roll);   
                        }                      
                    }
                 $start = array_add($start, $charName, $result);
            }       
            // Return Arrays
            return $start;
        }

    
        function calcDamage($as, $et, $oldRoll){
            // Set variables for ease of reading
            $attackScore = $as;
            $enemyToughness = $et;
            $attackDamage = $attackScore + 15;
            
            if($oldRoll == 20){ // If they rolled a critical success, damage addition is 20
                $attackDamage += 5;    
            }
            
            // Roll the dice for defense
            $roll = User::rollDice(1,20);
                            
            // Calculate attack math
            $results = $attackDamage - ($enemyToughness + $roll);
            
           // Resulting Arrays
            if($results <= 0){
                $m = "not damaged"; 
            }elseif ($results <= 4 && $results >=1 ){
                $m =   "bruised.";
            }elseif ($results <= 9 && $results >=5 ){
                $m =  "stunned and bruised.";
            }elseif ($results <= 14 && $results <=10 ){
                $m =  "staggered and bruised.";
            }else {
                $m =  "unconcious.";
            }
            $message = ["ad" => $attackDamage, "dRoll" => $roll, 'res' => $m];
            return $message;
        } 
       
        // Calculate Attack
        $attackResults = attackResults($attackScores, $defenseScores, $uid, $list);        

        
        $mess = "<p class='bold text-center'>Round</p>";         
        
        foreach($list as $char){                                
            $charName = $char->charName;
            $arCall = $attackResults[$charName];
            if($attackNames[$charName] == "gen_attack"){
                $attackNames[$charName] = "a general attack" ;   
            }
            $mess .= "<p>". $charName . " used " . $attackNames[$charName] .  " against " . $enemyNames[$charName] . " and " . $arCall['res'];  
            $mess .= "<span> Attack: {$attackScores[$charName]}  Attack Roll: {$arCall['roll']} |  VS  | Defense Results: {$defenseScores[$charName]}</span></p>"; 
            if($arCall['res'] == 'succeeds!'){
                $calcDamage = calcDamage($attackScores[$charName], $toughnessScores[$charName], $arCall['roll']); 
                $mess .= "<p class='indent'>". $enemyNames[$charName] . " is " . $calcDamage['res'];
                $mess .= "<span>Attack Damage: {$calcDamage['ad']}  |   VS | Enemy Toughness: {$toughnessScores[$charName]} Defense Roll: {$calcDamage['dRoll']}<span></p><hr/>";                       
            }
        } 
        if(!empty(Session::get('combRes'))){
            $oldMess = Session::get('combRes');
            $mess .= $oldMess;
        } 
       
        // Save complete message to session
        return  $mess; 
    }
}  










