<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

	use UserTrait, RemindableTrait;
	protected $table = 'users';
    protected $hidden = array('password', 'remember_token');


    // Dice Roller
    static public function rollDice($min, $max) {
       $roll = rand( $min, $max) ; 
       return $roll;
    }
    
    // Convert Object to Array
    static public function makeArray($o){
        // If this is an object
        if(is_object($o)){
            // Get the properties
            $o = get_object_vars($o);
        }// Otherwise
        else{
            // Keep it the Same
            $o = $o;    
        }
        return $o;
        
    }
	

}
