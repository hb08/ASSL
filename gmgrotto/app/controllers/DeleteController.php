<?php

class DeleteController extends BaseController {

	public function files($file_Id) {
		// Delete Files
		$fileId = $file_Id;
		
		// Database Reference
		DB::table('files')->where('fileId', $fileId)->delete();
		
		return Redirect::to('/');
	}

}
