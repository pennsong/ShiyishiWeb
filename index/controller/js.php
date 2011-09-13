<?php
class js_Controller extends Controller{
	function init(){

	}

	function indexAction(){
		$adid = $this->_get('callid');
		$code = F::datacall(array('id'=>$adid));
		echo "document.write(\"$code\")";
	}
}
?>