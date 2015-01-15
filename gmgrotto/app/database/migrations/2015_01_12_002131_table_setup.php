<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TableSetup extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function($newtable){
			$newtable->increments('id');
			$newtable->string('email')->unique();
			$newtable->string('username', 100)->unique();
			$newtable->string('password', 128);
			$newtable->string('remember_token', 100);
			$newtable->timestamps();
		});
		
		Schema::create('files', function($newtable){
			$newtable->increments('fileId');
			$newtable->string('userId', 128);
			$newtable->string('filename', 100);
            $newtable->string('file_ext', 5);
			$newtable->string('remember_token', 100);
			$newtable->timestamps();
		});
		
		Schema::create('textpad', function($newtable){
			$newtable->increments('textId');
			$newtable->string('userId');
			$newtable->text('lastSave');
			$newtable->string('remember_token', 100);
			$newtable->timestamps();
		});
		
		Schema::create('charList', function($newtable){
			$newtable->increments('charId');
			$newtable->string('userId');
			$newtable->text('charName');
			$newtable->string('remember_token', 100);
			$newtable->timestamps();
		});
        
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop();
	}

}
