<?php
/**
 * App Framework
 * write by guoli 2010-05-06
 */

class APP_Exception extends Exception
{
	protected $tpl = null;
	protected $msg = null;
	protected $msg2 = null;
	function __construct($msg=null,$msg2=null){
		$this->tpl =  Template::getInstance();
		$this->msg = $msg;
		$this->msg2 = $msg;
		$this->display();
	}

	function display(){
		header("HTTP/1.0 404 Not Found");
		//$this->tpl->assign('msg',$this->msg);
		//$this->tpl->display('404.tpl');
		echo $this->msg;
		echo $this->msg2;
		exit;
	}
}