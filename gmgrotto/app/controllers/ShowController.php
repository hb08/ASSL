<?php

class ShowController extends BaseController {

    public function files($file_Id) {
        // FileId Files
        $fileId = $file_Id;
        
        // Pull File
        $data = DB::table('files')->where('fileId', $fileId)->get();
        $filename = Session::get('filename');
        $uname = Session::get('uname');
        Session::put('file', $data);
        return Redirect::to('/');
    }

}
