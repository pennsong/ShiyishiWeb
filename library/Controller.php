<?php
/**
 * App Controller
 */

abstract class Controller
{
	protected $tpl = null;
	protected $cache = null;
	protected $cityinfo = null;//城市信息
	protected $logininfo = null;
	protected $_request = null;
	protected $_response = null;
	protected $_baseurl = null;
	protected $_pageurl = null;
	protected $_weburl = null;

	function __construct($request, $response){
		$this->_request = $request;
		$this->_response = $response;
		$this->tpl =  Template::getInstance();
		$this->cache = Load::model('cache');
		$this->cityinfo = $this->cache->getCityInfo($this->_get('city'));
		if($this->_get('city')&&!$this->cityinfo){
			$this->_header('http://www'.WEB_DOMAIN.'/','301');
		}
		$this->logininfo = F::logininfo();
		$this->init();
	}

	function init()
	{
	}

	function logincheck($utype='member')
	{
		if(!(F::islogin($utype))){
			$this->_header(BASE_URL.'/'.$utype.'/login.html?r=http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
		}
	}

	function postCheck($post=null,$t=0)
	{
		if($t==1){
			if(!$_SESSION['submitdata'])$_SESSION['submitdata'] = $post;
			$this->logincheck();
		}
		
		if(!$post||!is_array($post)||empty($post)){
			$post = $_SESSION['submitdata'];
			unset($_SESSION['submitdata']);
			if(!$post||!is_array($post)||empty($post)){
				$this->showmsg("警告，非法进行数据提交！",1);
			}
		}
		return $post;
	}

	function getCityCookie(){
		if($this->cityinfo){
			return $this->cityinfo;
		}else{
			return $this->cache->getCityInfo($_COOKIE['sys_cookie_city']);
		}
	}

	function getRequest()
	{
		return $this->_request;
	}

	function getResponse()
	{
		return $this->_response;
	}

	function getBaseUrl(){
		if($this->_baseurl === null){
			$this->_baseurl = $this->_request->getBaseUrl();
		}
		return $this->_baseurl;
	}

	function getWebUrl(){
		if($this->_weburl === null){
			$this->_weburl = $this->cityinfo ? 'http://'.$this->cityinfo['area_en'].WEB_DOMAIN : BASE_URL;
		}
		return $this->_weburl;
	}

	function getPageUrl(){
		if($this->_pageurl === null){
			$module = $this->_request->getModuleName();
			$controller = $this->_request->getControllerUName();
			$this->_pageurl = $this->getBaseUrl().($module ? '/'.$module.'/' : '/' ).$controller;
		}
		return $this->_pageurl;
	}

	function __call($methodName, $args)
	{
		if ('Action' == substr($methodName, -6)) {
			$action = substr($methodName, 0, strlen($methodName) - 6);
			throw new APP_Exception(sprintf('Action "%s" does not exist and was not trapped in __call()', $action), 404);
		}
		throw new APP_Exception(sprintf('Method "%s" does not exist and was not trapped in __call()', $methodName), 500);
	}

	function _get($paramName = null, $default = null)
	{
		if($paramName === null){
			return $this->_request->getParams();
		}
		return $this->_request->getParam($paramName, $default);
	}

	function _set($paramName, $value)
	{
		$this->_request->setParam($paramName, $value);
	}

	function _forward($action, $controller = null, $module = 'currentModule')
	{
		if (null !== $controller) {
			$this->_request->setControllerName($controller);
		}

		if ($module !== 'currentModule') {
			$this->_request->setModuleName($module);
		}
		$this->_request->setActionName($action);
		APP_Front::getInstance()->dispatch();
	}

	function _redirect($url)
	{
		if(substr($url, 0 ,1) === '/'){
			$url = $this->getBaseUrl().$url;
		}
		$this->_response->redirect($url);
	}

	function _header($url,$type='200')
	{
		ob_clean();
		if(substr($url, 0 ,1) === '/'){
			$url = $this->getBaseUrl().$url;
		}
		if($type=='301')header("HTTP/1.1 301 Moved Permanently");
		header("Location:".$url);
		exit;
	}

	function showmsg($msg, $type = null, $w=null, $msg2=null){
		if($type === null){
			$this->assign('jumpurl', $_SERVER['HTTP_REFERER']);
		}elseif(substr($type, 0 ,1) === '/'){
			$this->assign('jumpurl', $this->getBaseUrl().$type);
		}elseif(substr($type, 0 ,4) === 'http'){
			$this->assign('jumpurl', $type);
		}elseif(is_string($type)){
			$this->assign('jumpurl', $this->getPageUrl().'/'.$type);
		}
		$this->assign('pagetitle', '信息提示');
		$this->assign('msg', (array) $msg);
		$this->assign('msg2', $msg2);
		$this->assign('type', (int) $type);
		$this->assign('w', $w);
		$this->display('message.tpl');
		exit;
	}

	function wajaxmsg($msg,$s=0,$fun='msg'){//伪ajax
		@header('Content-Type:text/html;charset=utf-8');
		echo "<script>self.parent.".$fun."('".$msg."','".$s."');</script>";
		exit();
	}

	function show404($msg=null){
		header("HTTP/1.0 404 Not Found");
		$this->assign('msg', $msg);
		$this->display('404.tpl');
		exit;
	}


	function ajaxmsg($msg){
		@header("Expires: -1");
		@header("Cache-Control: no-store, private, post-check=0, pre-check=0, max-age=0", FALSE);
		@header("Pragma: no-cache");
		@header('Content-Type:text/html;charset=utf-8');
		echo $msg;
		exit();
	}

	function regfunc($funcname, $func = null){
		$this->tpl->register_function($funcname, $func);
	}

	function assign($tpl_var, $value = null){
		$this->tpl->assign($tpl_var, $value);
	}

	function getControllerUName(){
		return $this->_request->getControllerUName();
	}

	function getAppModeleName(){
		$app_modele_name = str_replace(array('/','\\'),'',APP_MODUL_NAME);
		return $app_modele_name;
	}

	function display($tpl = null,$fetch=false){
		$module = $this->_request->getModuleName();
		$module && $this->tpl->addModuleDir($module);
		$controller = $this->_request->getControllerName();
		$action = $this->_request->getActionName();
		if($tpl === null){
			if($action=='index')
				$tpl = $controller.'.tpl';
			else
				$tpl = $controller.'_'.$action.'.tpl';
		}
		$this->regfunc('datacall',"F::datacall");
		$this->tpl->assign(array(
			'baseurl' => $this->getBaseUrl(),
			'pageurl' => $this->getPageUrl()
		));
		if($this->_get('inajax')){
			$this->tpl->assign('inajax',$this->_get('inajax'));
		}
		if($this->cache){
			$webinfo = $this->cache->getConfig();
			$this->assign('web',$webinfo);
		}
		$this->tpl->assign('imgsurl',IMG_DOMAIN);
		if(!strstr(APP_MODUL_NAME,'admin')){
			$this->tpl->assign('r',$this->_get('r'));
			$this->tpl->assign('islogin',F::islogin());
			$this->tpl->assign('isloginp',F::islogin('enterp'));
			$this->tpl->assign('logininfo',$this->logininfo);
			$this->tpl->assign('pagemodel',$module ? $module : $controller);
			$this->tpl->assign('selfname',$this->_request->getControllerUName());
			$this->tpl->assign('webdomain',WEB_DOMAIN);
			$this->tpl->assign('cityinfo',$this->cityinfo);
			if(!$this->cityinfo){
				$defaultcity = $this->cache->getCityInfo('beijing');
				$this->tpl->assign('defaultcity',$defaultcity);
			}
			$this->tpl->assign('cookiecity',$this->getCityCookie());
			$this->tpl->assign('citydata',$this->cache->getAreaDatas());
			$this->tpl->assign('weburl',$this->getWebUrl());
		}
		$this->tpl->display($tpl);
	}
}
?>
