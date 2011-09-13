<?php
class virfycode_Controller extends Controller{

	function init(){
		$this->code = Load::lib('vdimgck');
	}

	function indexAction(){
		$this->code->createImage();
		exit();
	}
}
?>