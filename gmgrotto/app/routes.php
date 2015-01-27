<?php
/*****  MAIN    *****/
Route::any('/', array(
'before'=> 'auth', 'uses' => 'HomeController@display', function(){
	
    }));
/*****  DICE ROLLER  *****/ 
Route::get('/dice', array('uses'=>'ShowController@dice', function(){
    
    }));
Route::post('/roll', array('uses'=>'ShowController@roll', function(){
    
    }));
/*****  SCRATCHPAD  *****/  
Route::post('/save', array('uses' => 'ScratchpadController@save', function(){
   
    }));   
/*****  CHARACTERS  *****/ 
Route::get('/addChar', array('uses' => 'ShowController@addForm', function(){
   
    }));   
    /* Submit Character */
Route::post('/char', array('uses' => 'CharController@addChar', function(){
    
    })) ; 

    /* View Character  */ 
Route::get('/char/view/{charId}', array('uses' => 'ShowController@showChar', function(){

    }));
    /* Edit Character */
Route::post('/edit/{charId}', array('uses' => 'CharController@editChar', function(){
    
    })) ; 
    /* Delete Character */
Route::get('/delete/char/{charId}', array('uses' => 'DeleteController@deleteChar', function(){
    
    }));    
/*****  COMBAT CALCULATOR   *****/
Route::post('/fight', array('uses' => 'HomeController@fight', function(){
    
    })); 
    
Route::get('/clear', array('uses' => 'CalcController@clearComb', function(){
    
    }));
     
    
/*****   FILES    *****/
    /*      View File */
Route::get('view/{file}', array('uses' => 'ShowController@files', function(){
    
    }));
    /*      Delete File */
Route::get('delete/file/{file_id}', array('uses' => 'DeleteController@files', function(){
    
    }));
    /*      Files Upload    */
Route::post('/', array('uses' => 'HomeController@upload', function(){
        $filename = Input::get('filename');
        Session::put('filename', $filename);
    }));

    /*      Exit File    */
Route::get('exit/{what}', array('uses' => 'HomeController@exitForget', function(){

    }));

/*****  REGISTRATION    *****/
Route::get('register', function(){
	return View::make('register');
    });
    /*		Registration Form	*/

Route::post('register', function(){
	$user = new User;
	$user->email = Input::get('email');
	$user->username = Input::get('username');
	$user->password = Hash::make(Input::get('password')); // Encrypt password before saving	
	$user->save();
	$username = Input::get('username');
	return View::make('login');	
    });


/*****  LOGIN    *****/
Route::get('login', function(){
	return View::make('login');
    });

/*		Login Form	*/
Route::post('login', function(){
	$user = Input::get('username');	
    $uid = DB::table('users')->where('username', $user)->pluck('id');
	$credentials = Input::only('username', 'password');
	if(Auth::attempt($credentials)) {
	    Session::put('uid', $uid); // Save UID
		Session::put('uname', $user);
        // Database Reference
        
       
		return Redirect::intended('/');
	} 
	return Redirect::to('login');
    });


/*****  LOGOUT    *****/
Route::get('logout', function(){
	Session::flush();
	Auth::logout();
	return View::make('logout');
    });
    
    
  


