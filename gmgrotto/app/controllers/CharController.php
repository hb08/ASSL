<?php

class CharController extends Controller {

	public function addChar() {
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
                'charid' => $charId,
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
        
        echo "<pre>";
        print_r($input);
        echo  "</pre>";        


 //       return Redirect::action('HomeController@display');
    }

}
