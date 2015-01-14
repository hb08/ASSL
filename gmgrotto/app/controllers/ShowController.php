<?php

class ShowController extends BaseController {

    public function files($file_Id) {
        // FileId Files
        $fileId = $file_Id;
        
        // Pull File
        $data = DB::table('files')->where('fileId', $fileId)->get();
        $username = Session::get('uname');
        $extPath = $username . "_" . $data[0]->filename . "." . $data[0]->file_ext;
        Session::put('file', $data);
        Session::put('extPath', $extPath);
        return Redirect::action('HomeController@display');
    }

}
