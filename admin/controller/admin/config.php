<?php

class config_Controller extends Controller{

	function init(){
		$this->config = Load::model('config');
	}
	
	function indexAction(){
		$this->_forward('edit');
	}

	function editAction(){
		$id = 1;
		$info = $this->config->find($id);
		$dbinfo = Load::conf('db:default');
		$this->assign('info', $info);
		$this->assign('dbinfo', $dbinfo);
		$this->display('config.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$info['weburl'] = rtrim($info['weburl'],"/");
		if(!strstr($info['weburl'],'http://'))
			$info['weburl'] = 'http://'.$info['weburl'];
		//print_r($info);exit;
		if($this->config->save($info) === false){
			$this->showmsg($this->config->getError(),1);
		}
		$this->config->flushdbcache($this->_get('db'));
		$this->showmsg('操作成功','/admin/config.do');
	}
}
?>