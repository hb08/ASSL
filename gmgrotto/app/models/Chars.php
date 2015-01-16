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
                $score = DB::select('SELECT attack_score FROM char_attacks WHERE charId = ? AND attack_name = ?', array($charId, $attackName));
                $results = "";
                foreach($score as $s){
                    $results = $s->attack_score;    
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
                
        $combRes = array('attackNames' => $attackNames, 'attackScores' => $attackScores, 'enemyNames' => $enemyNames,  'defenseScores' => $defenseScores, 'toughnessScores' => $toughnessScores);  
/*         
        function attackResults($as, $ds){
            $attack = $as;
            $defense = $ds;
            $roll = User::rollDice(1,20);
            // If they roll a 1 on attack, critical failure
                if($roll == 1){
                     $result = array('res' => 'fails.', 'roll' => $roll);
                }elseif($roll == 20){
                    // If they roll a 20 on attack, critical success
                    $result = array('res' => 'succeeds!', 'roll' => $roll);
                }    
                
            // Check Results otherwise
            $resultScore = ($attack + $roll) - $defense; 
            
            // Result Arrays
            if($resultScore >= 0 ){// Array for Successful attack
                $result = array('res' => 'succeeds!', 'roll' => $roll);
            } else{ // Array for failed attack
                $result = array('res' => 'fails.', 'roll' => $roll);   
            }
            // Return Arrays
            return $result;
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
        $attackResults = attackResults($attackScore, $defenseScore);
        
         // Base Starter Message
        $combRes = "<p>" . $charName . " used " . $attackName .  " against " . $enemyName . " and " . $attackResults['res']; 
        $combRes .= "<span> Attack: {$attackScore}  Attack Roll: {$attackResults['roll']} |  VS  | Defense Results: {$defenseScore}</span></p>";
        
        
       // If Successful
        if($attackResults['res'] == 'succeeds!'){ 
            $calcDamage = calcDamage($attackScore, $enemyToughness, $attackResults['roll']);
            $combRes .= "<p>". $enemyName . " is " . $calcDamage['res'];
            $combRes .= "<span>Attack Damage: {$calcDamage['ad']}  |   VS | Enemy Toughness: {$enemyToughness} Defense Roll: {$calcDamage['dRoll']}<span></p><hr/>";
        }
 * 
 */
        // Save complete message to session
        return  $combRes; 
    }
}  