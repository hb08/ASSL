<?php

class ScratchpadController extends BaseController {

    public function save() {
        $input = Input::all();
        $uid = Session::get('uid'); 
        
        // Check for notes by this user
        $current = DB::table('scratchpad')->where('userId', $uid)->get();
        
        // If there are notes, add them, otherwise update them 
        if(!empty($current)){   
            DB::table('scratchpad')
            ->where('userId', $uid)
            ->update(array('notes' => $input['notes']));    
        }else {
            DB::table('scratchpad')->insert(array(
            'userId' => $uid,
            'notes' => $input['notes']
             )); 
        }

        
        
     return Redirect::to('/');
    }


}
