<?php
class uploadeditor_Controller extends Controller{

	function init(){
		$this->upload = Load::lib('upload');
	}
	
	function indexAction(){
		//$this->showErr(array('err'=>$this->upload->run('filedata',false)));
		if($this->upload->run('filedata',false)){
			$filedata = $this->upload->data();
			$returns = array('err'=>$this->upload->display_errors(),'msg'=>IMG_DOMAIN.'/'.$filedata['file_url']);
			
		}else{
			$errmsgs = Load::conf('uploaderrmsg');
			$returns = array('err'=>$this->upload->display_errors(),'msg'=>'');
		}
		$this->showErr($returns);
	}

	function showErr($msg){
		$json = Load::lib('json');
		$msg = $json->encode($msg);
		$this->ajaxmsg($msg);
	}
}
?>