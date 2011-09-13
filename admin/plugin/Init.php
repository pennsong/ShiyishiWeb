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
		$this->_requset->setParam('domain', WEB_DOMAIN);
		$this->_tpl->assign('domain', WEB_DOMAIN);
		
		$admin_info = $_SESSION['admin_info'];
		$this->_requset->setParam('admin_info', $admin_info);
	}

	function pre_dispatch()
	{
		
		//定义后台权限标示
		$pix = 'admin_';
		//权限控制
		$duty = Load::model('duty');
		//获取action
		$action =  $this->_requset->getActionName();
		//获取module
		$module =  $this->_requset->getModuleName();
		//获取controller
		$controller = $this->_requset->getControllerName();	
		//公用权限
		if($this->_checkPerview($controller)) return true;
		//获取admin信息
		$admin_info = $_SESSION['admin_info'];
		if(!$admin_info||$admin_info['login']!=1){
			//echo 'fdfd';exit;
			$this->_showmsg('您还未登录或者登录超时',4);
		}
		$adminlog = Load::model('adminlog');
		//$adminlog->save(array('action'=>$action,'model'=>$controller));
		//总管理员默认拥有所有权限。
		if($admin_info['admin_zhiwu']=='1') return true;
		//获取权限信息
		if($admin_info['admin_purview'])
		{
			$auth = $duty->getDutypurview(unserialize($admin_info['admin_purview']));
		}
		elseif($admin_info['admin_zhiwu'])
		{
			$auth = $duty->getDuty($admin_info['admin_zhiwu']);
		}else {
			$this->_showmsg('您还未开通此权限',1);
		}
		
		if (!array_key_exists($pix.$controller,$auth['purview'])) {
			$this->_showmsg('您还未开通此权限',1);
		}elseif ($auth['purview'][$pix.$controller][0] != 'null'){
			if(!in_array($action,array('index','pwinfo','addshow','addticket','donepw'))){
				$checkaction = array_intersect($this->_getAction($action),$auth['purview'][$pix.$controller]);
				if (empty($checkaction)){
					$this->_showmsg('您还未开通此权限',1);
				}
			}
		}

		foreach($auth['purview'] as $key=>$val)
		{
			if(!empty($val))
				$pck[] = '/'.str_replace("_","/",$key).".do";
		}
		$_SESSION['admin_info']['menu_allow'] = $pck;
	}

	protected function _showmsg($msg,$type = null)
	{
		if($type === null){
			$this->_tpl->assign('jumpurl', $_SERVER['HTTP_REFERER']);
		}elseif(substr($type, 0 ,1) === '/'){
			$this->_tpl->assign('jumpurl', '/'.$type);
		}elseif(is_string($type)){
			$this->_tpl->assign('jumpurl', '/'.$type);
		}
		$this->_tpl->assign('msg', (array) $msg);
		$this->_tpl->assign('type', (int) $type);
		$this->_tpl->display('message.tpl');
		exit;
	}

	protected function _getAction($action)
	{
		if(!$action)$action = 'index';
		$arr = array('index'=>array('index','list','add','edit'),'list'=>array('index','list','add','edit'),'save'=>array('add','edit'),'done'=>array('import'));
		return isset($arr[$action]) ? $arr[$action] : array($action);
	}

	protected function _checkPerview($act)
	{
		if(!$act)$act = 'index';
		$arr = array('index','logon','logout');
		if(in_array($act,$arr))
			return true;
	}
}
?>