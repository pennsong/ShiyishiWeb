<?php

class duty_Controller extends Controller{

	function init(){
		$this->duty = Load::model('duty');
		$this->purview = Load::model('purview');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$rows = $this->duty->all();
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->duty->order($orderid) === false){
			$this->showmsg($this->duty->getError(),1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}

	function addAction(){
		$groups = $this->duty->children(0,2);
		$this->assign('groups', $groups);
		$this->display('duty_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->duty->find($id)){
			$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$groups = $this->duty->children(0,2);
		$this->assign('groups', $groups);
		$this->assign('info', $info);
		$this->display('duty_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->duty->save($info) === false){
			$this->showmsg($this->duty->getError(),1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}

	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->duty->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->duty->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}
	
	
	function purviewAction(){
		if($_POST)
		{
			$menu = Load::model('menu');
			$info = $this->_get('info');
			if($this->_get('m')=='duty')
			{
				$info['purview'] = serialize($info['purview']);
				if($this->duty->save($info) === false){
					$this->showmsg($this->duty->getError(),1);
					exit();
				}
				$rurl = '/admin/duty.do';
			}
			elseif($this->_get('m')=='admin')
			{
				$this->admin = Load::model('admin');
				if($this->_get('duty_p'))
				{
					$duty = $this->duty->find($this->_get('duty_p'));
					$info['admin_purview'] = $duty['purview'];
				}
				else
				{
					$info['admin_purview'] = serialize($info['purview']);
				}
				if($this->admin->save($info) === false){
					$this->showmsg($this->admin->getError(),1);
					exit();
				}
				//$a_type = $this->_get('admin_type',1);
				//$duty = $this->duty->find($a_type);
				$rurl = '/admin/admin.do';
			}
			$menu->flushcache('menus_'.$info['id']);
			$this->showmsg('操作成功',$rurl);
			exit();
		}
		$id = $this->_get('id');
		$uid = $this->_get('uid');
		if($id>0)
		{
			if(!$info = $this->duty->find($id)){
				$this->showmsg('您请求的数据不存在',1);
				exit();
			}
			$dutyone = $this->duty->getcache('duty_one');
			$info['duty_name'] = $dutyone[$info['parent_id']].'组->'.$info['duty_name'];
			$info['purview'] = unserialize($info['purview']);
			$this->assign('m', 'duty');
		}
		elseif($uid>0)
		{
			$this->admin = Load::model('admin');
			if(!$info = $this->admin->find($uid)){
				$this->showmsg('您请求的数据不存在',1);
				exit();
			}
			if($info['admin_purview'])
			{
				$info['purview'] = unserialize($info['admin_purview']);
			}
			else
			{
				$duty = $this->duty->find($info['admin_zhiwu']);
				$info['purview'] = unserialize($duty['purview']);
			}
			$this->assign('m', 'admin');
		}
		$purviews = $this->purview->children(0,4,2);
		$this->assign('purviews', $purviews);
		$this->assign('purviewtops', $this->purview->children(0,1,2));
		$this->assign('info', $info);
		$this->display('duty_purview.tpl');
	}
}
?>