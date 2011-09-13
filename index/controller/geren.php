<?php
class geren_Controller extends Controller{

	function init(){
	}
	
	function indexAction(){
		$this->assign('pagetitle','个人专题');
		$this->display('geren.tpl');
	}
}
?>