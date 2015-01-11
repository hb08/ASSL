<?php

class HomeController extends BaseController {

	/*
	|--------------------------------------------------------------------------
	| Default Home Controller
	|--------------------------------------------------------------------------
	|
	| You may wish to use controllers instead of, or in addition to, Closure
	| based routes. That's great! Here is an example controller method to
	| get you started. To route to this controller, just add the route:
	|
	|	Route::get('/', 'HomeController@showWelcome');
	|
	*/

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
				$filename = Input::get('filename');
				// Saving
				$destinationPath = 'public/_uploads';
				Input::file('newFile')->move($destinationPath, $filename); 
									
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

}
