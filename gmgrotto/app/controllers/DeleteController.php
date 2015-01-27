<?php

class DeleteController extends BaseController {

    public function files($file_Id) {
        $file = DB::select('SELECT fileName, file_ext from files WHERE fileId = ?', array($file_Id));
        foreach($file as $f){
            $fileExt = $f->file_ext;
            $filename = $f->fileName;           
        }
        $user = Session::get('uname');
        $uploadName = $user . "_" . $filename . "." . $fileExt;
        $destinationPath = 'public/_uploads';
        $fullPath = $destinationPath . "/" . $uploadName;
        
        // Database Reference
        DB::table('files')->where('fileId', $file_Id)->delete();
        
        // Delete Files
        unlink($fullPath);
        
        return Redirect::to('/');
    }
    public function deleteChar($charId){
        DB::table('charList')->where('charId', $charId)->delete();
        Session::forget('addChar');
        Session::forget('charShow');
        return Redirect::action('HomeController@display'); 
    }

}