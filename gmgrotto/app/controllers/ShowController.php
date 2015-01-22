<?php

class ShowController extends BaseController {

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
        Session::put('addChar', 'add') ;   
        return Redirect::action('HomeController@display');    
    }
    
    public function exitChar() {
        Session::forget('addChar');
        Session::forget('charShow');
        return Redirect::action('HomeController@display');
    }
    
    public function showChar($charId){        
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
        $charPowers = DB::table('char_powers')->where('char_id', $charId)->get();       
        $charSkills = DB::select('
                        SELECT skill_name, skill_total, skill_ranks, skill_abil 
                        FROM char_skills 
                        INNER JOIN skillsList 
                        WHERE char_skills.skill_Id = skillsList.skill_id 
                            AND char_skills.charId = ?', array($charId));

        // Make a big array
        $char = array(
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
