<?php
class Init{

	protected $_font = null;
	protected $_requset = null;
	protected $_tpl = null;
	protected $_contr = null;

	function __construct(){
		$this->_font = APP_Front::getInstance();
		$this->_requset = $this->_font->getRequest();
		$this->_tpl = Template::getInstance();
		
	}

	function pre_route(){
		if(date_default_timezone_get() != "Asia/Shanghai") date_default_timezone_set("Asia/Shanghai");
	}

	function pre_dispatch()
	{
	}
}
?>