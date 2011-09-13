<?php

class profile_Controller extends Controller{

	function init(){
		$this->admin = Load::model('admin');
		$this->duty = Load::model('duty');
		$this->dutydata = $this->duty->getcache();
	}
	
	function indexAction(){
		$this->_forward('edit');
	}

	function editAction(){
		$id = $_SESSION['admin_info']['id'];
		if(!$info = $this->admin->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$zhiwus = $this->duty->getcache('duty_one');
		$info['admin_zhiwuname'] = $zhiwus[$info['admin_zhiwu']];
		$info['admin_citys'] = unserialize($info['admin_citys']);
		$citys = $this->cache->getAreaDatas();
		if(!empty($info['admin_citys'])){
			foreach($info['admin_citys'] as $k=>$v){
				$citys[$v]['checked'] = ' checked';
			}
		}
		
		$this->assign('citys',$citys);
		$this->assign('info', $info);
		$this->assign('profile', 1);
		$this->display('admin_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		
		if($info['admin_password']=='' || $info['admin_password']=='******')
			unset($info['admin_password']);
		else
			$info['admin_password'] = md5($info['admin_password']);
		$info['admin_citys'] = serialize($info['admin_citys']);
		if($this->admin->save($info) === false){
			$this->showmsg($this->admin->getError(),1);
		}
		$this->showmsg('操作成功',"/admin/profile.do");
		exit();
	}
}
?>