<?php
/**
 * App Framework
 * write by kinglv 2009-1-11
 * modify by kinglv 2009-6-22
 */

class APP_Front
{
	protected static $_instance = null;

	protected $_request = null;

	protected $_response = null;

	protected $_modules = array();

	protected $_plugins = array();

	protected function __construct(){
		$this->_request = new APP_Request();
		$this->_response = new APP_Response();
	}

	public static function getInstance(){
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}

	public function setModule($key, $value = null){
		if($value === null){
			$this->_modules = (array) $key;
		}else{
			$this->_modules[$key] = $value;
		}
		return $this;
	}

	public function getModule($key){
		return $key ? $this->_modules[$key] : APP_CTRL_DIR;
	}

	public function addPlugin($plugin){
		if (false === array_search($plugin, $this->_plugins, true)){
			$this->_plugins[] = $plugin;
		}
		return $this;
	}

	public function removePlugin($plugin){
		if (is_string($plugin)){
			foreach ($this->_plugins as $key => $_plugin) {
				$type = get_class($_plugin);
				if ($plugin == $type) {
					unset($this->_plugins[$key]);
				}
			}
		}else{
			$key = array_search($plugin, $this->_plugins, true);
			if (false !== $key){
				unset($this->_plugins[$key]);
			}
		}
		return $this;
	}

	public function execPlugin($method){
		foreach ($this->_plugins as $plugin){
			try{
				$plugin->$method();
			}catch (Exception $e){
				$this->_error($e);
			}
		}
	}

	public function route(){
		$path = $this->_request->getPathInfo();
		$tdomain = str_replace(WEB_DOMAIN,"",F::gethost());
		$params = array();
		$path   = trim($path, '/');
		if ($path != '') {
			$tmp = explode('/', $path);
			if($config = @Load::conf('route')){
				$route = isset($config[$tdomain]) ? $config[$tdomain] : $config['subdomain'];
			}
			if(isset($route['module'])&&!empty($route['module'])&&in_array($tmp[0],array_keys($route['module']))){
				$ucontroller = strrpos($tmp[1], '.')>0 ? substr($tmp[1], 0, strrpos($tmp[1], '.')) : $tmp[1];
			}else{
				$ucontroller = strrpos($tmp[0], '.')>0 ? substr($tmp[0], 0, strrpos($tmp[0], '.')) : $tmp[0];
			}
			$this->_modules = isset($route['module']) ? (array) $route['module'] : array();
			$rules = (array) $route['rule'];
			foreach($rules as $rule){
				$newpath = preg_replace("/$rule[0]/i", $rule[1], $path);
				if($newpath != $path){
					$path = $newpath;
					break;
				}
			}
			if ($pos = strrpos($path, '.')) {
				$path = substr($path, 0, $pos);
			}
			$path = explode('/', $path);
			if(count($path) > 3){
				throw new APP_Exception('Path depth validation Failure',404);
			}
			
			$setup = $params['controller'] = str_replace("-","",$path[0]);
			$params['action'] = $path[1];

			if(!empty($this->_modules[$setup])){
				$params['module'] = $setup;
				$params['controller'] = $path[1];
				$params['action'] = $path[2];
			}
		}
		
		foreach ($params as $param => $value) {
			//$this->_request->setParam($param, $value);
			if ($param === 'module') {
				$this->_request->setModuleName($value);
			}elseif ($param === 'controller') {
				$this->_request->setControllerName($value);
				$this->_request->setControllerUName($ucontroller?$ucontroller:$value);
			}elseif ($param === 'action') {
				$arr = strtolower($value);
				$arr = explode('-',$arr);
				$actionName = array_shift($arr);
				$this->_request->setActionName($actionName);
				if($params['controller']=='email'){
					$this->_request->setParam('tpl', substr(strtolower($value),10));
				}else{
					if($len = count($arr)){
						for($i=0;$i<$len;$i = $i + 2){
							$key = $arr[$i];
							$val = $arr[$i + 1];
							//if(preg_match("/^[a-zA-Z0-9_]+$/",$key) && preg_match("/^[a-zA-Z0-9_]+$/",$val)){
								$this->_request->setParam($arr[$i], $val);
							//}else{
							//	throw new APP_Exception('Action Params validation Failure',404);
							//}
						}
					}
				}
			}
		}
		$this->_request->setSubParam();
	}

	public function run()
	{  
		try {
			$this->execPlugin('pre_route');
			$this->route();
		} catch (Exception $e) {
			$this->_error($e);
		}
		$this->dispatch();
		echo "end";
	}

	public function dispatch()
	{
		ob_start();
		try {
			$this->execPlugin('pre_dispatch');
			$this->_dispatch();
		} catch (Exception $e) {
			$this->_error($e);
		}
		$this->_response->send();
	}
	
	protected function _dispatch()
	{
		$loadController = false;
		$moduleName = $this->_request->getModuleName();
		$controllerName = $this->_request->getControllerName();
		$loadFile = $this->getModule($moduleName).'/'.$controllerName.'.php';
		
		if(@include_once($loadFile)){
			$className = $controllerName.'_Controller';
		}else{
			throw new APP_Exception('controller('.$controllerName.') not found',404);
		}
		
		$action = $this->_request->getActionName();
		$action = $action.'Action';
		$controller = new $className($this->_request, $this->_response);
		$controller->$action();
	}

	protected function _error($e){
		ob_get_clean();
		$this->_request->setParam('exceprion',$e)
			->setModuleName(null)
			->setControllerName('error')
			->setActionName('error');
		try {$this->_dispatch();} catch (Exception $e) {}
		exit;
	}

	public function getRequest()
	{
		return $this->_request;
	}

	public function getResponse()
	{
		return $this->_response;
	}
}
?>