<?php

class HomeController extends BaseController {	
	public function upload() {
		// Getting Post Data
		$file = array('newFile' => Input::file('newFile'));
		// Set up Rules
		$rules = array('newFile' => 'required', );
		// Doing Validation, passing post data, rules
		$validator = Validator::make(
            array(
                
            ),
            array(

            )
        );
		if ($validator->fails()){

			//send back to page with input data and errors
			return Redirect::action('HomeController@display',['errors', $errors]);
		}
		else {
			// checking file is valid
			if (Input::file('newFile')->isValid()){
				$user = Session::get('uname');
				$filename = Input::get('filename');
                $fileExt = Input::file('newFile')->getClientOriginalExtension();
                $uploadName = $user . "_" . $filename . "." . $fileExt;
				
				// Saving
				$destinationPath = 'public/_uploads';
				Input::file('newFile')->move($destinationPath, $uploadName); 
				
				// Database Reference
				$uid = DB::table('users')->where('username', $user)->pluck('id');
				Session::put('uid', $uid); // Save UID
				// Add Filename to User on File Table
				DB::table('files')->insert(
					array('userid' => $uid, 'filename' => $filename, 'file_ext' => $fileExt)
				);
				
				// Send back with message
				Session::flash('success', 'Upload Successful!');
				return Redirect::to('/');
			}
			else {
				Session::flash('error', 'Error in Upload');
				return Redirect::to('/');
			}
		}
	}

    public function fight(){
        $combRes = Chars::fight(); 
        Session::put('combRes', $combRes);    
        return Redirect::to('/')->withInput();           
    }
    
	public function display(){
	    // Set User Id
		$uid = Session::get('uid');
        
        // User Files	
		$fl = DB::table('files')->where('userId', $uid)->get(); 
        if(!empty($fl)){ 
             
        }else {
           $fl = null;
        } 
        // Check Combat
        $combRes = Session::get('combRes');
        
        // Set Navbar
        $charsList = Chars::getAttacks($uid); 
        
        // Check Notes
        $currentNotes = DB::table('scratchpad')->where('userId', $uid)->pluck('notes');
        
        // Set Select Lists for Char Form
        $feats = DB::table('featsList')->orderBy('feat_name')->get();
        Session::put('feats', $feats);
        $powers = DB::table('powersList')->orderBy('power_name')->get();
        Session::put('powers', $powers);
        $skills = DB::table('skillsList')->orderBy('skill_name')->get();
        Session::put('skills', $skills);
        
        $fi = Session::get('file');
        // Individual File Check  
        if(!empty($fi)){
            $uname = Session::get('uname');
            $extPath = Session::get('extPath');                      
        }else {
            $uname = Session::get('uname');
            $extPath = NULL;
            $fi = NULL;
        }       
        return View::make('pages.hello', ['filelist' => $fl, 'file' => $fi, 'combRes' => $combRes, 'uname' => $uname, 'extPath' => $extPath, 'charsList' => $charsList, 'notes' => $currentNotes]);
    } 
    
    public function exitForget($what){
        if($what == 'dice'){
            Session::forget('rolls');
            Session::forget('dice');                         
        }elseif($what == 'gen'){
            Session::forget('gen');
            Session::forget('details');
        }else{
            Session::forget('file'); 
            Session::forget('addChar');
            Session::forget('charShow'); 
        }
        return Redirect::action('HomeController@display');   
    }		
}
