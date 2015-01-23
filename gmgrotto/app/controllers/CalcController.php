<?php

class CalcController extends BaseController {
    public function clearComb(){
        Session::forget('combRes');
        return Redirect::action('HomeController@display');    
    }
        
    public function display($uid){
        $charName = DB::select('select * from users where id=');
        $attackName = Input::get('attackName');
        $enemyName = Input::get('enemyName');
        $attackScore = Input::get('attackScore');
        $defenseScore = Input::get('defenseScore');
        $enemyToughness = Input::get('toughSave');
        
        
    }    

    public function fight() {
        Session::forget('combRes');
        
        // Input Variables
        $charName = Input::get('charName');
        $attackName = Input::get('attackName');
        $enemyName = Input::get('enemyName');
        $attackScore = Input::get('attackScore');
        $defenseScore = Input::get('defenseScore');
        $enemyToughness = Input::get('toughSave');
          
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
        // Save complete message to session
        Session::put('combRes', $combRes);
        return Redirect::action('HomeController@display');  
    }
    
    

}
