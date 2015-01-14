<?php

class HomeController extends BaseController {
	
	public function showWelcome()
	{
		return View::make('hello');
	}
	
	public function upload() {
		// Getting Post Data
		$file = array('newFile' => Input::file('newFile'));
		// Set up Rules
		$rules = array('newFile' => 'required', );
		// Doing Validation, passing post data, rules
		$validator = Validator::make($file, $rules);
		if ($validator->fails()){
			//send back to page with input data and errors
			return Redirect::to('/')->withInput()->withErrors($validator);
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

    
	public function display(){
	    // Set User Id
		$uid = Session::get('uid');
        // Find Files for User	
		$fl = DB::table('files')->where('userId', $uid)->get();
        if(!empty($fl)) 
            $fi = Session::get('file');
            $uname = Session::get('uname');
            $extPath = Session::get('extPath');
            if(!empty($fi)){
                return View::make('hello', ['filelist' => $fl, 'file' => $fi, 'uname' => $uname, 'extPath' => $extPath]);    
            }            
            return View::make('hello', ['filelist' => $fl]);     
        }
    
    public function exitFile(){
        Session::forget('file');  
        return Redirect::action('HomeController@display');   
    }		
}
