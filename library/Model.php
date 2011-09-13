<?php
abstract class Model{
	protected $_error = array();
	public function __construct(){
		$this->init();
	}

	public function getError(){
		if(!$this->isError()){
			$this->_error[] = "服务器繁忙，请稍后重试。";
		}
		return $this->_error;
	}

	protected function setError($error){
		$this->_error[] = $error;
		return $this;
	}

	protected function isError(){
		return !empty($this->_error);
	}

	public function init(){}
}
?>