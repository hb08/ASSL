<?php

class ShowController extends BaseController {
    public function gen(){
        Session::put('gen' , 'open');
        Session::put('size', '');
        return Redirect::action('HomeController@display');
    }
   
    public function roll(){
        $inputs = Input::all();
        $names = Session::get('names');
        
        function cycleInputs($names, $inputs){
            $message = array();
            $count = 0;
            foreach($names as $n){                          
                // Starting and Empty variables
                $name = $n;
                $t = "";
                $v = 0;
                $m = 0;
                // Array of input starters
                $start = array(
                    'saves' => ['save_', 'save_mod_'],
                    'skills' => ['skill_', 'skill_mod_'],
                    'power' => ['power_', 'power_mod_'],
                    'misc' => ['misc', 'misc_score', 'misc_mod']
                );
                foreach($start as $s){                 
                    // If there is a value for that starter + the name of uploaded characters
                    if(!empty($inputs[$s[0] . $n ])){
                        if($count == 0 ){
                            $startDiv = "<div class='rolls'>";
                            array_push($message, $startDiv);
                            $count += 1;
                        }
                        // Assign it to variable      
                        $i = $inputs[$s[0] . $n];
                        // Explode the input
                        $a = explode("_", $i);                 
                        // portion before the _ is the type
                        $t = $a[0];
                        // portion after the _ is the value
                        $v = $a[1];  
                        // Assign easy to read name for type  
                        if($t == 'f'){
                            $t = "<span class='hBlue'>Fortitude";                  
                        }elseif($t == 'w'){
                            $t = "<span class='hBlue'>Will";                  
                        }elseif($t == 't'){
                            $t = "<span class='hBlue'>Toughness";
                        }elseif($t == 'r'){
                            $t = "<span class='hBlue'>Reflex";
                        }else{
                            $t = "<span class='hBlue'>" . $t;
                        } 
   
                        // If there is a modifier
                        if(!empty($inputs[$s[1] . $n])){
                            // Assign it to a variable
                            $m = $inputs[$s[1] . $n];
                        }  
    
                        
                        // If there's a value for this character
                        if($v > 0){
                            $count ++;
                            // Roll a D20
                            $roll = User::rollDice(1,20); 
                            // Add the value, the modifier, and the roll
                            $total = $v + $m + $roll;
                            // Assign it to a temporary variable, easy to read and formatted for page
                            $temp = "<p><span class='hOrange'>" . $n . "</span> rolls for a " . $t . " Save</span> of <span class='total'>" . $total . "</span>.";
                             if($roll == 20 ){
                                $total .= "<span class='hGreen'>Critical Success!</span>";
                            }elseif($roll == 1 ){
                                $total .= "<span class='hRed'>Critical Failure!</span>";
                            }
                            // Add the rolls themselves 
                            $temp .= "<span>" . $v . " + " . $m . " + <span class='dice'>" . $roll . "</span> = " . $total . "</p>"; 
                            // Push to message array
                            array_push($message, $temp);                                      
                        }                                                                  
                    }                                                 
                } 
                if( $count > 0 ){
                   $divide = "</div>";
                   array_push($message, $divide);
                   $count = 0;
                }             
            }
           return $message;
        }

        // Check and return any Misc Roll
        function miscInputs(){
            $name = Input::get('misc');
            $score = Input::get('misc_score');
            $mod = Input::get('misc_mod');
            $message = array();
            if(!empty($name)){
                $startDiv = "<div class='rolls'>";
                array_push($message, $startDiv);
                $roll = User::rollDice(1,20); 
                $total = $score + $mod + $roll;
                // Assign it to a temporary variable, easy to read and formatted for page
                $temp = "<p><span class='hOrange'>" . $name . "</span> has a roll of " . $roll . " for <span class='total'>" . $total . "</span>.";
                if($roll == 20 ){
                    $total .= "<span class='hGreen'>Critical Success!</span>";
                }elseif($roll == 1 ){
                    $total .= "<span class='hRed'>Critical Failure!</span>";
                }
                // Add the rolls themselves 
                $temp .= "<span>" . $score. " + " . $mod . " + <span class='dice'>" . $roll . "</span> = " . $total . "</p></div>"; 
                // Push to message array
                array_push($message, $temp);        
            }
            return $message;
        }

        // Cycle through character inputs
        $rolls = cycleInputs($names, $inputs);
        // Check for misc
        $misc = miscInputs();
        foreach($misc as $m){
            array_push($rolls, $m);
        }
        Session::put('rolls', $rolls);
        return Redirect::action('HomeController@display');  
    }
    
    public function dice(){
        $uid= Session::get('uid');
        $saves = DB::select("SELECT charName, tough, will, fort, ref FROM charList 
                    INNER JOIN char_comb ON charlist.charId=char_comb.charId
                    WHERE charList.userId = ?
                    ORDER BY charName", array($uid));
        Session::put('saves', $saves);
        $skills = DB::select("SELECT charName, skill_name, skill_total FROM charList
                    INNER JOIN char_skills ON charList.charId=char_skills.charId
                    JOIN skillsList ON char_skills.skill_id=skillsList.skill_id
                    WHERE charList.userId = ?
                    ORDER BY charName, skill_name;",array($uid));
        Session::put('skillSelect', $skills);
        $names = DB::table('charList')->where('userId', $uid)->lists('charName');
        Session::put('names', $names);
        $powersSelect = DB::select("SELECT charName, power_name, power_ranks FROM charList
                    INNER JOIN char_powers ON charList.charId=char_powers.char_id
                    JOIN powersList ON char_powers.power_id=powersList.power_id
                    WHERE charList.userId = ?
                    ORDER BY charName, power_name;", array($uid));
        
        Session::put('powersSelect', $powersSelect);
        Session::put('dice', 'show') ;
        
        return Redirect::action('HomeController@display');    
    }    
    
    public function files($file_Id) {
        // FileId Files
        $fileId = $file_Id;
        
        // Pull File
        $data = DB::table('files')->where('fileId', $fileId)->get();
        $username = Session::get('uname');
        $extPath = $username . "_" . $data[0]->filename . "." . $data[0]->file_ext;
        Session::put('file', $data);
        Session::put('extPath', $extPath);
        return Redirect::action('HomeController@display');
    }
        
    public function addForm() {
        Session::forget('charShow');
        Session::put('addChar', 'add') ;   
        return Redirect::action('HomeController@display');    
    }
    
    public function showChar($charId){
        Session::forget('addChar');        
        // Retrieving Char Info from Database 
        $charName = DB::table('charList')->where('charId', $charId)->pluck('charName');         
        $charAbilities = DB::table('char_abilities')->where('char_id', $charId)->get();      
        $charAttacks = DB::table('char_attacks')->where('charId', $charId)->get();      
        $charBasic = DB::table('char_basic')->where('charId', $charId)->get();        
        $charComb = DB::table('char_comb')->where('charId', $charId)->get();       
        $charDB = DB::table('char_drawbacks')->where('char_id', $charId)->get();       
        $charFeats= DB::select('
                        SELECT feat_name, feat_ranks
                        FROM char_feats 
                        INNER JOIN featsList 
                        WHERE char_feats.feat_id = featsList.feat_id 
                        AND char_feats.char_id = ?', array($charId));       
        $charPowers = DB::select('
                        SELECT power_name, power_ranks, notes
                        FROM char_powers 
                        INNER JOIN powersList 
                        WHERE char_powers.power_id = powersList.power_id 
                        AND char_powers.char_id = ?', array($charId));       
        $charSkills = DB::select('
                        SELECT skill_name, skill_total, skill_ranks, skill_abil 
                        FROM char_skills 
                        INNER JOIN skillsList 
                        WHERE char_skills.skill_Id = skillsList.skill_id 
                            AND char_skills.charId = ?', array($charId));

        // Make a big array
        $char = array(
            'id' => $charId,
            'codeName' => $charName, 
            'abilities' => $charAbilities, 
            'attacks' => $charAttacks, 
            'basic' => $charBasic, 
            'combat' => $charComb, 
            'drawbacks' => $charDB, 
            'feats' => $charFeats,
            'powers' => $charPowers, 
            'skills' => $charSkills
        );
        
        // Save to session
        Session::put('charShow', $char);
        
        return Redirect::action('HomeController@display');
    }
}
