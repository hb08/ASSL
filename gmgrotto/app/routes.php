<?php

Route::any('/', array(
'before'=> 'auth', 'uses' => 'HomeController@display', function(){
	
}));
/*		Registration	*/
Route::get('register', function()
{
	return View::make('register');
});

/*		Registration Form	*/

Route::post('register', function()
{
	$user = new User;
	$user->email = Input::get('email');
	$user->username = Input::get('username');
	$user->password = Hash::make(Input::get('password')); // Encrypt password before saving	
	$user->save();
	$username = Input::get('username');
	return View::make('login');	
});


/*		Login	*/
Route::get('login', function()
{
	return View::make('login');
});

/*		Login Form	*/
Route::post('login', function()
{
	$user = Input::get('username');	
	$credentials = Input::only('username', 'password');
	if(Auth::attempt($credentials)) {
		Session::put('uname', $user);
		return Redirect::intended('/');
	} 
		return Redirect::to('login');
});


/*		Logout	*/
Route::get('logout', function()
{
	Session::forget('uname');
	Auth::logout();
	return View::make('logout');
});


/*		Files Upload	*/
Route::post('/', array('uses' => 'HomeController@upload', function()
{
	$filename = Input::get('filename');
	Session::put('filename', $filename);
}
));
Route::get('/delete/file/{file_id}', array('uses' => 'DeleteController@files', function(){
	
}));

Route::get('/view/{fileId}', array('uses' => 'HomeController@files', function(){
    
}));