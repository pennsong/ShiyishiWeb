<?php

class admin_Controller extends Controller{

	function init(){
		$this->admin = Load::model('admin');
		$this->duty = Load::model('duty');
		$duty = $this->duty->getcache();
		$this->assign('zhiwus',$duty);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$page = $this->_get('page');
		$s = $this->_get('s');
		$where = '';
		if($s){
			$this->assign('s',urldecode($s));
			$url .= '?s='.urlencode($s);
			$stype = $this->_get('stype');
			$this->assign('stype',$stype);
			$url .= '&stype='.$stype;
			$where = $stype.' like "%'.$s.'%"';
		}
		$citys = $this->cache->getAreaDatas();
		$rows = $this->admin->pageAll($page, 20, $url,$where,'admin_zhiwu ASC');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['admin_zhiwuid'] = $val['admin_zhiwu'];
			$duty = $this->duty->find($val['admin_zhiwu']);
			$rows[$key]['admin_zhiwu'] = $duty['duty_name'];
			$admincitys = unserialize($val['admin_citys']);
			$str = '';
			foreach($admincitys as $k=>$v){
				$str .= $citys[$v]['name'].' ';
			}
			$rows[$key]['admin_citys'] = $str;
			$rows[$key]['admin_lastlogintime'] = $val['admin_lastlogintime']>0 ? date("m-d H:i",$val['admin_lastlogintime']) : '未曾登录';
		}
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$this->assign('citys',$this->cache->getAreaDatas());
		$this->display('admin_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->admin->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['admin_citys'] = unserialize($info['admin_citys']);
		$citys = $this->cache->getAreaDatas();
		if(!empty($info['admin_citys'])){
			foreach($info['admin_citys'] as $k=>$v){
				$citys[$v]['checked'] = ' checked';
			}
		}
		
		$this->assign('citys',$citys);
		$this->assign('info', $info);
		$this->display('admin_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(!$info['id']&&!$info['admin_name']){
			$this->showmsg('用户名不能为空',1);
		}
		if($info['id'] && $info['admin_password']=='******')
			unset($info['admin_password']);
		else
			$info['admin_password'] = md5($info['admin_password']);
		
		$info['admin_citys'] = serialize($info['admin_citys']);
		if($this->admin->save($info) === false){
			$this->showmsg($this->admin->getError(),1);
		}
		if($this->_get('postaction')=='saveback')
			$this->showmsg('操作成功',"add.do");
		else
			$this->showmsg('操作成功',"list.do");
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if($id==1){
			$this->showmsg('系统管理员账号不能被删除。',1);
		}elseif($id==$_SESSION['admin_info']['id']){
			$this->showmsg('您不能删除自己。',1);
		}
		if(!$rowCount = $this->admin->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->admin->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
    	$this->showmsg('操作成功',"list.do?page=$page");
	}
	
	function checkinfoAction(){
		$info = $this->_get('info');
		$rs = $this->admin->checkinfo($info);
		exit();
	}
}
?>