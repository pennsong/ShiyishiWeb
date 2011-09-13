<?php

class adminlog_Controller extends Controller{

	function init(){
		$this->adminlog = Load::model('adminlog');
		$this->menu = Load::model('menu');
		$this->admin = Load::model('admin');
		$this->conf = Load::conf('conf');
		$this->menus_keynames = $this->menu->getMenuKeyNames('menus_keynames');
		$this->menus_keynames['passwd'] = '修改密码';
		$this->menus_keynames['index'] = '登陆页面';
		$this->adminnames = $this->admin->getAdminNames();
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$rows = $this->adminlog->pageAll($this->_get('page',1), 20, $url,'','id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['action'] = $this->conf['admin_action'][$val['action']];
			$rows[$key]['model'] = $this->menus_keynames[$val['model']];
			$rows[$key]['dothing'] = str_replace('#TIME#',$val['createtime'],$val['dothing']);
		}	
		$page = $this->_get('page');
		$this->assign('menus_keynames',$this->menus_keynames);
		$this->assign('adminnames',$this->adminnames);
		$this->assign('admin_action',$this->conf['admin_action']);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}
	
	function searchAction(){
		$url = $this->getPageUrl().'/search.do';
		$model = $this->_get('model');
		$action = $this->_get('saction') ? $this->_get('saction') : $this->_get('action');
		$adminid = $this->_get('adminid');
		$startdate = $this->_get('startdate');
		$enddate = $this->_get('enddate');
		$s = array('model'=>$model,'action'=>$action,'adminid'=>$adminid,'startdate'=>$startdate,'enddate'=>$enddate);
		if(empty($s)){
			$this->_forward('list');
			exit();
		}
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='startdate'){
				$wheres[] = "createtime > '{$val} 00:00:00'";
			}elseif($key=='enddate'){
				$wheres[] = "createtime <= '{$val} 23:59:59'";
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->adminlog->pageAll($page, 20, $url,$wheres,'id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['action'] = $this->conf['admin_action'][$val['action']];
			$rows[$key]['model'] = $this->menus_keynames[$val['model']];
			$rows[$key]['dothing'] = str_replace('#TIME#',$val['createtime'],$val['dothing']);
		}
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->assign('adminnames',$this->adminnames);
		$this->assign('menus_keynames',$this->menus_keynames);
		$this->assign('admin_action',$this->conf['admin_action']);
		$this->display('adminlog_list.tpl');
	}

	function clearAction(){
		$model = $this->_get('model');
		$action = $this->_get('action');
		$adminid = $this->_get('adminid');
		$startdate = $this->_get('startdate');
		$enddate = $this->_get('enddate');
		$s = array('model'=>$model,'action'=>$action,'adminid'=>$adminid,'startdate'=>$startdate,'enddate'=>$enddate);
		if(empty($s)){
			$this->showmsg('没有指定清除条件，不允许删除！');
			exit();
		}
		$wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='startdate'){
				$wheres[] = "createtime > '{$val} 00:00:00'";
			}elseif($key=='enddate'){
				$wheres[] = "createtime <= '{$val} 23:59:59'";
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		if(empty($wheres)){
			$this->showmsg('没有指定清除条件，不允许删除！');
			exit();
		}
		$this->adminlog->removeBy(implode(" and ",$wheres));
		if($model=='adminlog' && ($action=='clear'||!$action)) $this->adminlog->save(array('action'=>'clear','model'=>'adminlog'));
		$this->showmsg('操作成功',"list.do");
		exit();
		
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->adminlog->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->adminlog->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
			exit();
		}
    	 $this->showmsg('操作成功',"list.do?page=$page");
	  exit();
	}

	function viewAction(){
		$id = $this->_get('id');
		$info = $this->adminlog->find($id);
		$info['dothing'] = str_replace('#TIME#',$info['createtime'],$info['dothing']);
		$adminlogext = Load::model('adminlogext');
		$infoext = $adminlogext->find($id);
		$requestvar = unserialize($infoext['requestvar']);
		ob_start();
		print_r($requestvar);
		$info['requestvar'] = ob_get_contents();
		ob_end_clean();
		$this->assign('item', $info);
		$this->display('adminlog_view.tpl');
	}
}
?>