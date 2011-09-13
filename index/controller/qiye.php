<?php
class qiye_Controller extends Controller{

	function init(){
	}
	
	function indexAction(){
		$this->assign('pagetitle','企业专题');
		$this->display('qiye.tpl');
	}
}
?>