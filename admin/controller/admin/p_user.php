<?php
/*
* 用户系统 @Author Guoli
*/
class p_user_Controller extends Controller{

	function init(){
		$this->user = Load::model('p_user');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['username'] = trim($this->_get('username'));
		$s['email'] = trim($this->_get('email'));
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		$sdate = 'createtime';
		$orderby = 'id DESC';
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='s_date'){
				$wheres[] = $sdate." >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = $sdate." <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "$key LIKE '%".$val."%'";
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->user->pageAll($page, 20, $url,$wheres,$orderby);
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->assign('turl',$url.'&page='.$page);
		$this->display('p_user_list.tpl');
	}


	function addAction(){
		$this->display('p_user_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!($info = $this->user->find($id))){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['password'] = '********';
		$this->assign('info', $info);
		$this->display('p_user_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(!$info['id']){
			$info['createtime'] = time();
			$info['lasttime'] = time();
			$info['gip'] = F::onlineip();
			$info['password'] = md5($info['password']);
		}else{
			if(!$this->_get('modpass')){
				unset($info['password']);
			}else{
				$info['password'] = md5($info['password']);
			}
			$info['lasttime'] = time();
		}
		if(($uid = $this->user->save($info)) === false){
			$this->showmsg($this->user->getError(),1,"380");
		}
		$this->showmsg('操作成功','list.do');
	}

	function checkAction(){
		$ids = $this->_get('ids');
		$status = $this->_get('status');
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		$this->user->update(array('status'=>$status),"id IN (".implode(',',$ids).")");
		$this->wajaxmsg('操作成功',1);
	}

	function removeAction(){
		$id = $this->_get('id');
		$rowCount = $this->user->remove($id);
		if(!$rowCount){
			if($rowCount === false)
				$this->wajaxmsg($this->user->getError());
			else
				$this->wajaxmsg('您请求的数据不存在');
		}
    	$this->wajaxmsg('删除成功','list.do');
	}
}
?>