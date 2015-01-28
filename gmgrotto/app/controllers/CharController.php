<?php

class CharController extends Controller {
    public function ran(){
        // Get desired power level
        $pl = Input::get('pl');
     
        // PowerPoints Min
        $min = $pl * 15;
        // PowerPoints Max
        $max = (($pl + 1) * 15)-1;
        // Random from middle
        $pp = User::rollDice($min, $max);
      
echo "POWER POINTS: " . $pp . "<br/>";        
        // Functions
            // Check Max Range
        function checkMax($type, $check, $pl){
            $max = 0;
            $m = "";
echo "TYPE: " . $type . " CHECK: " . $check . " POWER LEVEL: " . $pl . "<br/>";
            if($type == 'attack' || $type == 'defense' || $type == 'tough'){
                $max = $pl;
            }
            if($type == 'comb/save' || $type == 'skills' || $type == 'abil'){
                $max = $pl + 5;
            }
            if($check <= $max){
                $m = "Pass";    
            }else {
                $m = "Fail";
            }
echo "CHECK RESULTS: " . $max . " for ". $m . "<br/>";
            return $m;  
        }  
         
        // Get breakdown of how points will be spent. 
        function breakDown($type, $pp, $catList, $pl){
                // Get initial count from list length
                $cat = count($catList);
echo "STARTING BREAKDOWN <br/> CatList: <pre>";
print_r($catList) ;
echo "</pre><br/>";                  
                // Divvy up a percentage to each category initially
                if($type == 'base'){
                    $base = ceil($pp/10);
echo "ABILITY BASE: " . $base . "<br/>";
                }else{
                    $base = 0;
                }                
                $currentPP = $pp - ($base * $cat);
                $resultsArray = array();
echo "Current PP: " . $currentPP . "<br/>";                 
                // For the remaining 50% of the points, loop once per 10%
                for($i = 0; $i < $currentPP; $i++ ){
                    // If it's a combat/save type                       
                    if($type == 'comb/save'){
echo "COMB/SAVE " . $i . "<br/>" ;
                       // Check how many points are left
                       $enough = $currentPP - $i;
                       // If there are 2+ points left
                       if($enough >= 2){
echo "Double Point Possible because enough is" . $enough . "<br/>"; 
                           // Roll the full range                    
                            $roll = User::rollDice(0, ($cat-1));
                            // If you roll a 0 or 1
echo "&nbsp; Rolled: " . $roll . "<br/>";
                            if($roll <2){
                                // Add an extra point to the i counter
                                $i += 1;                                
                            } 
                        // If there are less than 2 points
                       }else{
                           // Only roll for 2+ 
                           $roll = User::rollDice(2, ($cat-1));
                       }
echo "*I now is " . $i . "<br/>";  
                    // If not combat   
                    }else{
                        // Roll full range
                        $roll = User::rollDice(0, ($cat-1));
                    }
                    $result = $catList[$roll];
echo "&nbsp; &nbsp; Roll " . $i . " for " . $roll . "  " . $result . "<br/>";  
                    array_push($resultsArray, $result);
                } 
                
                // Array to hold final breakdown
                $m = array();
echo "<br/>RESULTS ARRAY<br/>" ;
echo "<pre>";
print_r($resultsArray);
echo "<pre>";    
                $reRoll = 0;
                $exceptions = array();           
                // Cycle through list of categories, assigning points appropriately
                foreach($catList as $c){
echo "In CLIST: " . $c . "<br/>";
                    $basePoints = $base;
                    $newPoints = 0; 
                    $mArray = array();                  
//echo "Base Points: " . $basePoints . "<br/>"; 
                    // Cycle through results array to give new points. 
                    foreach($resultsArray as $r){
//echo "In Results Array: " . $r . "<br/>";
                        // if result is the same as this category, and new points will not be over the max,
                        if($r == $c){                            
                           $newPoints +=1;
                        }                                                                              
                    } 
                    // Get new Total
                        $newTotal =  $newPoints + $basePoints; 
                        
echo "&nbsp; Type: " . $type. "<br/> New Total: " . $newTotal . "<br/>";
                          if($type == 'abil' || $c == 'defense'){
                                $fullTotal = 10 + $newTotal;
                               $m = array_add($m, $c, $fullTotal);
echo "&nbsp;&nbsp; Adding to M: " . $c . " for ". $fullTotal . "<br/>";    
                           }elseif($type != 'base' && $newTotal > 0){                              
echo "&nbsp; NewTotal: " . $newTotal . " > 0<br/>";
                                // Check to see if this exceeds max                  
                               if(checkMax($type, $newTotal, $pl) == 'Pass'){
                                   // If it does, add 10 for ability, add it to the array
                                   if($type == 'abil'){
                                        $fullTotal = 10 + $newTotal;
                                       $m = array_add($m, $c, $fullTotal);
    echo "&nbsp;&nbsp; Adding to M: " . $c . " for ". $fullTotal . "<br/>";
                                    // Otherwise times by 4 for skills    
                                    }elseif($type == 'skills'){
                                        $total = $newTotal * 4;
                                        $m = array_add($m, $c, $total);
                                    // Otherwise add to array as is    
                                    }else{// If it does, add it to the array
                                        $m = array_add($m, $c, $newTotal);
    echo "&nbsp;&nbsp; Adding to M: " . $c . " for ". $newTotal . "<br/>"; 
                                    }     
                               }else {
                               // If not, add to reRoll counter and create exception for this one
                                    $reRoll +=1;
                                    array_push($exceptions, $c);       
                               }
                       }else{
                           if($newTotal > 1){  
                           $m = array_add($m, $c, $newTotal); 
echo "&nbsp;&nbsp; Adding to M: " . $c . " for ". $newTotal . "<br/>";
                           }
                        }                                                                                                
                }
echo "<br/>M<br/>" ;
echo "<pre>";
print_r($m);
echo "<pre>";
                for($i = 0; $i < $reRoll; $i++ ){
                    $roll = User::rollDice(0,4);
                    $result = $catList[$roll];
echo "REROLL:<br/> Result: " . $result . "<br/>";

                    function checkTrue($check, $against){
                        if($check == $against){
                            return True;
                        }else { return False; }                            
                    }
                    foreach($exceptions as $e){
                        if(checkTrue($result, $e)){
echo "TRUE!";
                            $i = $i-1;       
                        }else{
echo "FALSE!";
                           array_push($resultsArray, $result);     
                        }   
                    } 
                    
                }     
            return $m;
        }
        // List of things to go through
        $breakList = ['abil', 'comb/save', 'skills', 'feats', 'powers'];        
        // Breakdown overarching pointspread
        $pointSpread = breakDown('base', $pp, $breakList, $pl);  
echo "<br/>POINTS SPREAD<br/>";     
echo "<pre>";
print_r($pointSpread);
echo "</pre>"; 
        // Hold returned details
        $details = array();
        // Spend points in pointspread
        foreach($pointSpread as $key => $value){
            if($key == 'abil'){
                $abilList = ['str', 'dex', 'con', 'int', 'wis', 'cha'];    
                $abilBreakdown = breakDown('abil', $value, $abilList, $pl);
                $details = array_add($details, 'abil' , $abilBreakdown);
            }
            if($key == 'comb/save'){
                $combList = ['gen_attack', 'defense', 'will', 'fort', 'ref' ];
                $combBreakdown = breakdown('comb/save',$value, $combList, $pl);
                $details = array_add($details, 'comb/save', $combBreakdown);
            }
            if($key == 'skills'){
                $skillList = DB::table('skillsList')->lists('skill_name');
                $skillBreakdown = breakdown('skills', $value, $skillList, $pl);
                $details = array_add($details, 'skills', $skillBreakdown);
            }
        }
echo "<br/>DETAILS<br/>";     
echo "<pre>";
print_r($details);
echo "</pre>"; 
    }
 
           
        function editChar($charId){
        // Gather All inputs into one variable
        $input = Input::all();    
        $uid = Session::get('uid');
        
        // Update CharList
            DB::table('charList')->where('charId', $charId)
                ->update(array('charName' => $input['altId']));
 
        // Update Char Basics
            DB::table('char_basic')->where('charId', $charId)
                ->update( array(
                'charId' => $charId, 
                'real_name' => $input['realName'], 
                'power_level' => $input['pl'], 
                'power_points' => $input['pps'], 
                'affiliation' => $input['affi'], 
                'ff' => $input['ff'], 
                'hero_total' => $input['hpt'], 
                'hero_current' => $input['hpc'], 
                'height' => $input['height'], 
                'weight' => $input['weight'], 
                'age' => $input['age']
                )
            );
        
        // Update Char Abilities
            DB::table('char_abilities')->where('char_id', $charId)
                ->update( array(
                'char_Id' => $charId, 
                'str_rank' => $input['strRank'], 
                'str_mod' => $input['strMod'], 
                'dex_rank' => $input['dexRank'], 
                'dex_mod' => $input['dexMod'], 
                'con_rank' => $input['conRank'], 
                'con_mod' => $input['conMod'], 
                'int_rank' => $input['intRank'], 
                'int_mod' => $input['intMod'], 
                'wis_rank' => $input['wisRank'], 
                'wis_mod' => $input['wisMod'], 
                'cha_rank' => $input['chaRank'], 
                'cha_mod' => $input['chaMod']  
                )
            );
        
        // Update Char Combat
            DB::table('char_comb')->where('charId', $charId)
                ->update( array(
                    'charId' => $charId, 
                    'initiative' => $input['initiative'],
                    'gen_attack' => $input['attack'], 
                    'knockback' => $input['knockback'], 
                    'tough' => $input['toughMod'], 
                    'defense' => $input['defense'], 
                    'grapple' => $input['grapple'], 
                    'melee' => $input['attack'], 
                    'ranged' => $input['attack'], 
                    'will' => $input['will'], 
                    'fort' => $input['fort'], 
                    'ref' => $input['reflex'] 
                    )
                );
     
         // Update Char Attacks If they exist
            // Remove old 
               DB::table('char_attacks')->where('charId', $charId)->delete();
                if(!empty($input['aa1_name']) && !empty($input['aa1_score'])){
                    DB::table('char_attacks')->insert( array(
                        'charId' => $charId, 
                        'attack_name' => $input['aa1_name'],
                        'attack_score' => $input['aa1_score']
                        )
                    );
                }
                if(!empty($input['aa2_name']) && !empty($input['aa2_score'])){
                    DB::table('char_attacks')->insert( array(
                        'charId' => $charId, 
                        'attack_name' => $input['aa2_name'],
                        'attack_score' => $input['aa2_score']
                        )
                    );
                }
                if(!empty($input['aa3_name']) && !empty($input['aa3_score'])){
                    DB::table('char_attacks')->insert( array(
                        'charId' => $charId, 
                        'attack_name' => $input['aa3_name'],
                        'attack_score' => $input['aa3_score']
                        )
                    );
                }
                if(!empty($input['aa4_name']) && !empty($input['aa4_score'])){
                    DB::table('char_attacks')->insert( array(
                        'charId' => $charId, 
                        'attack_name' => $input['aa4_name'],
                        'attack_score' => $input['aa4_score']
                        )
                    );
                }
  
        // Update Skills If They Exist
            // Remove old 
               DB::table('char_skills')->where('charId', $charId)->delete();
           // Put in new List
               for($i = 1; $i <= 15; $i++){
                  $skillNumber = "skill" . $i;
                  $skillRank = 'skillRank' . $i;
                  $skillAbil = 'skillAbil' . $i;
                  
                  if($input[$skillNumber] != ""){
                    $skillId = DB::table('skillsList')->where('skill_name', $input[$skillNumber])->pluck('skill_id'); 
                    DB::table('char_skills')->insert(array(
                        'charId' => $charId,
                        'skill_id' => $skillId,
                        'skill_total' => $input[$skillRank] + $input[$skillAbil],              
                        'skill_ranks' => $input[$skillRank],
                        'skill_abil' =>  $input[$skillAbil]           
                    ));    
                  } 
               }
   
         // Update Feats If They Exist
             // Remove old 
                   DB::table('char_feats')->where('char_id', $charId)->delete();
           // Put in new List
               for($i = 1; $i <= 12; $i++){
                  $featNumber = "feat" . $i;
                  $featScore = $featNumber . "score";
                  if($input[$featNumber] != ""){
                    $featId = DB::table('featsList')->where('feat_name', $input[$featNumber])->pluck('feat_id'); 
                    DB::table('char_feats')->insert(array(
                        'char_id' => $charId,
                        'feat_id' => $featId,
                        'feat_ranks' => $input[$featScore]               
                    ));    
                  } 
               }
        // Update Powers
           // Remove old 
               DB::table('char_powers')->where('char_id', $charId)->delete();
               // Put in new List
               for($i = 1; $i <= 6; $i++){
                  $powerNumber = "power" . $i;
                  $powerRank = "powerRank" . $i;
                  $powerNote = "powerNote" . $i;
                  if($input[$powerNumber] != ""){
                    $powerId = DB::table('powersList')->where('power_name', $input[$powerNumber])->pluck('power_id'); 
                    DB::table('char_powers')->insert(array(
                        'char_id' => $charId,
                        'power_id' => $powerId,
                        'power_ranks' => $input[$powerRank], 
                        'notes' => $input[$powerNote]              
                    ));    
                  } 
               }              
           // Update Drawbacks
               // Remove old 
               DB::table('char_drawbacks')->where('char_id', $charId)->delete();
               // Put in new List
               if(!empty($input['db1'])){
                    DB::table('char_drawbacks')->insert( array(
                            'char_id' => $charId, 
                            'drawback' => $input['db1'],
                            'db_cost' => $input['db1cost']
                            )
                        );    
               } 
               if(!empty($input['db2'])){
                    DB::table('char_drawbacks')->insert( array(
                            'char_id' => $charId, 
                            'drawback' => $input['db1'],
                            'db_cost' => $input['db1cost']
                            )
                        );    
               }
     
           Session::forget('charShow');
           return Redirect::to('/');
    }
       
	    function addChar() {
	    // Gather all inputs into one variable
        $input = Input::all();
        $uid = Session::get('uid');
       
        
      // Add To CharList
        DB::table('charList')->insert(
            array('userid' => $uid, 'charName' => $input['altId'])
        );
        
      // Get Char ID for this new character
        $charId = DB::table('charList')->where('charName', $input['altId'])->pluck('charId');
           
      // Add To Char Basics
        DB::table('char_basic')->insert( array(
            'charId' => $charId, 
            'real_name' => $input['realName'], 
            'power_level' => $input['pl'], 
            'power_points' => $input['pps'], 
            'affiliation' => $input['affi'], 
            'ff' => $input['ff'], 
            'hero_total' => $input['hpt'], 
            'hero_current' => $input['hpc'], 
            'height' => $input['height'], 
            'weight' => $input['weight'], 
            'age' => $input['age']
            )
        );
          
      // Add To Char Abilities
        DB::table('char_abilities')->insert( array(
            'char_Id' => $charId, 
            'str_rank' => $input['strRank'], 
            'str_mod' => $input['strMod'], 
            'dex_rank' => $input['dexRank'], 
            'dex_mod' => $input['dexMod'], 
            'con_rank' => $input['conRank'], 
            'con_mod' => $input['conMod'], 
            'int_rank' => $input['intRank'], 
            'int_mod' => $input['intMod'], 
            'wis_rank' => $input['wisRank'], 
            'wis_mod' => $input['wisMod'], 
            'cha_rank' => $input['chaRank'], 
            'cha_mod' => $input['chaMod']  
            )
        );
        
      // Add To Char Combat
        DB::table('char_comb')->insert( array(
            'charId' => $charId, 
            'initiative' => $input['initiative'],
            'gen_attack' => $input['attack'], 
            'knockback' => $input['knockback'], 
            'tough' => $input['toughMod'], 
            'defense' => $input['defense'], 
            'grapple' => $input['grapple'], 
            'melee' => $input['attack'], 
            'ranged' => $input['attack'], 
            'will' => $input['will'], 
            'fort' => $input['fort'], 
            'ref' => $input['reflex'] 
            )
        );
        
     // Add To Char Attacks If they exist
            if(!empty($input['aa1_name']) && !empty($input['aa1_score'])){
                DB::table('char_attacks')->insert( array(
                    'charId' => $charId, 
                    'attack_name' => $input['aa1_name'],
                    'attack_score' => $input['aa1_score']
                    )
                );
            }
            if(!empty($input['aa2_name']) && !empty($input['aa2_score'])){
                DB::table('char_attacks')->insert( array(
                    'charId' => $charId, 
                    'attack_name' => $input['aa2_name'],
                    'attack_score' => $input['aa2_score']
                    )
                );
            }
            if(!empty($input['aa3_name']) && !empty($input['aa3_score'])){
                DB::table('char_attacks')->insert( array(
                    'charId' => $charId, 
                    'attack_name' => $input['aa3_name'],
                    'attack_score' => $input['aa3_score']
                    )
                );
            }
            if(!empty($input['aa4_name']) && !empty($input['aa4_score'])){
                DB::table('char_attacks')->insert( array(
                    'charId' => $charId, 
                    'attack_name' => $input['aa4_name'],
                    'attack_score' => $input['aa4_score']
                    )
                );
            }
    // Add to Skills If They Exist
       for($i = 1; $i <= 15; $i++){
          $skillNumber = "skill" . $i;
          $skillRank = 'skillRank' . $i;
          $skillAbil = 'skillAbil' . $i;
          
          if($input[$skillNumber] != "Skill Name"){
            $skillId = DB::table('skillsList')->where('skill_name', $input[$skillNumber])->pluck('skill_id'); 
            DB::table('char_skills')->insert(array(
                'charId' => $charId,
                'skill_id' => $skillId,
                'skill_total' => $input[$skillRank] + $input[$skillAbil],              
                'skill_ranks' => $input[$skillRank],
                'skill_abil' =>  $input[$skillAbil]           
            ));    
          } 
       }

     // Add to Feats If They Exist
       for($i = 1; $i <= 12; $i++){
          $featNumber = "feat" . $i;
          $featScore = $featNumber . "score";
          if($input[$featNumber] != "Feat Name"){
            $featId = DB::table('featsList')->where('feat_name', $input[$featNumber])->pluck('feat_id'); 
            DB::table('char_feats')->insert(array(
                'char_id' => $charId,
                'feat_id' => $featId,
                'feat_ranks' => $input[$featScore]               
            ));    
          } 
       }
       
     // Add to Powers If They Exist
       for($i = 1; $i <= 6; $i++){
          $powerNumber = "power" . $i;
          $powerRank = "powerRank" . $i;
          $powerNote = "powerNote" . $i;
          if($input[$powerNumber] != "Power Name"){
            $powerId = DB::table('powersList')->where('power_name', $input[$powerNumber])->pluck('power_id'); 
            DB::table('char_powers')->insert(array(
                'char_id' => $charId,
                'power_id' => $powerId,
                'power_ranks' => $input[$powerRank], 
                'notes' => $input[$powerNote]              
            ));    
          } 
       }
       
       // Add to Drawbacks If They Exist
       if(!empty($input['db1'])){
            DB::table('char_drawbacks')->insert( array(
                    'char_id' => $charId, 
                    'drawback' => $input['db1'],
                    'db_cost' => $input['db1cost']
                    )
                );    
       } 
       if(!empty($input['db2'])){
            DB::table('char_drawbacks')->insert( array(
                    'char_id' => $charId, 
                    'drawback' => $input['db1'],
                    'db_cost' => $input['db1cost']
                    )
                );    
       }
        Session::forget('addChar');
      return Redirect::action('HomeController@display');
    }

}
