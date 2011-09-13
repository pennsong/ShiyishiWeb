<?php
class data_Controller extends Controller{
	function init(){
		
	}
	
	function indexAction(){
		$excelurl = urldecode($this->_get('url'));
		$this->assign('excelurl',$excelurl);
		$this->display('data_excel.tpl');
	}
}
?>