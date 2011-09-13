<?php
/**
 * App Framework
 * write by kinglv 2009-1-12
 */

class APP_Request
{

	protected $_dispatched = false;

	protected $_module = null;

	protected $_controller = 'index';
	protected $_ucontroller = 'index';

	protected $_action = 'index';

	protected $_requestUri;

	protected $_baseUrl = null;

	protected $_pathInfo = null;

	protected $_params = array();

	public function __construct()
	{
		$this->setRequestUri();
		$this->setPathInfo();
	}

	public function getModuleName()
	{
		return $this->_module;
	}

	public function setModuleName($value)
	{
		$this->_module = $value;
		return $this;
	}

	public function getControllerName()
	{
		return $this->_controller;
	}

	public function getControllerUName()
	{
		return $this->_ucontroller;
	}

	public function setControllerName($value)
	{
		$value && $this->_controller = $value;
		return $this;
	}
	
	public function setControllerUName($value)
	{
		$value && $this->_ucontroller = $value;
		return $this;
	}

	public function getActionName()
	{
		return $this->_action;
	}

	public function setActionName($value)
	{
		$value && $this->_action = $value;
		return $this;
	}

	public function setRequestUri()
	{
		$this->_requestUri = $_SERVER['REQUEST_URI'];
		return $this;
	}

	public function getRequestUri()
	{
		return $this->_requestUri;
	}

	public function setParam($key, $value)
	{
		$key = (string) $key;
		if ((null === $value) && isset($this->_params[$key])) {
			unset($this->_params[$key]);
		} elseif (null !== $value) {
			$this->_params[$key] = $value;
		}
		return $this;
	}

	public function getParam($key, $default = null)
	{
		if (isset($this->_params[$key])) {
			return $this->_params[$key];
		} elseif (isset($_POST[$key])&&$_POST[$key]) {
			return $_POST[$key];
		} elseif (isset($_GET[$key])&&$_GET[$key]) {
			return $_GET[$key];
		}

		return $default;
	}

	public function getParams()
	{
		$return = $this->_params;
		if (isset($_GET) && is_array($_GET)) {
			$return += $_GET;
		}
		if (isset($_POST) && is_array($_POST)) {
			$return += $_POST;
		}
		return $return;
	}
	
	public function isAjaxRequest()
	{
		if($this->getParam('inajax'))
		{
			return true;
		}
		return ($this->getHeader('X_REQUESTED_WITH') == 'XMLHttpRequest');
	}

	public function setBaseUrl($baseUrl = null)
	{
		if ($baseUrl === null) {
			if (isset($_SERVER['SCRIPT_NAME'])) {
				$baseUrl = $_SERVER['SCRIPT_NAME'];
			} elseif (isset($_SERVER['PHP_SELF'])) {
				$baseUrl = $_SERVER['PHP_SELF'];
			} else {
				$this->_baseUrl = '';
				return $this;
			}
			//$this->_baseUrl = rtrim(dirname($baseUrl), '/');
			return $this;
		}
		$this->_baseUrl = rtrim($baseUrl, '/');
		return $this;
	}

	public function getBaseUrl(){
		if (null === $this->_baseUrl) {
			$app_modele_name = str_replace(array('/','\\'),'',APP_MODUL_NAME);
			if(defined('BASE_URL')&&!in_array($app_modele_name,array('admin')))
				$this->setBaseUrl(BASE_URL);
			else
				$this->setBaseUrl('http://admin'.WEB_DOMAIN);
		}
		return $this->_baseUrl;
	}

	public function setPathInfo($pathInfo = null)
	{
		if ($pathInfo === null) {
			$baseUrl = $this->getBaseUrl();
			$requestUri = $this->getRequestUri();
			if ($pos = strpos($requestUri, '?')) {
				$requestUri = substr($requestUri, 0, $pos);
			}
			$pathInfo = $requestUri;//substr($requestUri, strlen($baseUrl));
		}
		$this->_pathInfo = (string) $pathInfo;
		return $this;
	}

	public function getPathInfo()
	{
		return $this->_pathInfo;
	}

	public function setSubParam()
	{
		$serverUrl = F::gethost();
		if(!$serverUrl){
			return $parms;
		}
		$urls = explode(".",$serverUrl);
		if(!in_array($urls[0],array('www','admin','img'))){
			$this->setParam('city',$urls[0]);
		}else{
			$this->setParam('city','');
		}
	}
}
