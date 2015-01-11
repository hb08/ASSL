<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/



Route::any('/', array(
'before'=> 'auth',
function()
{		
	return View::make('hello');
}));

Route::get('file_upload', function()
{
	return View::make('file_upload');
});

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
	return View::make('hello');	
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
	Session::put('uname', $user);
	$credentials = Input::only('username', 'password');
	if(Auth::attempt($credentials)) {
		
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





