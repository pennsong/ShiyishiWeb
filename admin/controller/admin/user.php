<?php
/*
* 用户系统 @Author Guoli
*/
class user_Controller extends Controller{

	function init(){
		$this->user = Load::model('user');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$status = (isset($_GET['status'])||isset($_POST['status'])) ? (int)$this->_get('status') : 1;
		$url = $this->getPageUrl().'/list.do?status='.$status;
		$s['id'] = intval($this->_get('id'));
		$s['email'] = trim($this->_get('email'));
		$s['mobile'] = trim($this->_get('mobile'));
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$count['a'] = $this->user->count('status=1');
		$count['b'] = $this->user->count('status=0');
		$count['c'] = $this->user->count('status=-1');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		$sdate = 'regdate';
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
		$wheres[] = "status = '".$status."'";
		$s['status'] = $status;
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->user->pageAll($page, 20, $url,$wheres,$orderby);
		$tmpResumeVod = Load::model('resume_vod');
		foreach ($rows as &$row) {
			$tmpResumeVodArray = $tmpResumeVod->fetchRow("uid='".$row['id']."'");
			$row['auth'] = $tmpResumeVodArray['status'];
		}
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('count',$count);
		$this->assign('rows', $rows);
		$this->assign('turl',$url.'&page='.$page);
		$this->display('user_list.tpl');
	}

	function recordAction(){
		$wheres = array();
		$puid = intval($this->_get('uid',0));
		if($puid<=0){
			$this->showmsg('参数错误',1);
		}
		$uinfo = $this->user->find($puid);
		$page = $this->_get('page',1);
		$orderby = 'id DESC';
		$wheres[] = "puid = '".$puid."'";
		$url = $this->getPageUrl().'/record.do?uid='.$puid;
		$rows = $this->user->pageAll($page, 20, $url,$wheres,$orderby);
		$this->assign('page',$page);
		$this->assign('uinfo', $uinfo);
		$this->assign('rows', $rows);
		$this->display('user_record.tpl');
	}

	function rewardAction()
	{
		$puid = intval($this->_get('uid',0));
		if($puid<=0){
			$this->showmsg('参数错误',1);
		}
		$nowtime = time();
		$url = $this->getPageUrl().'/reward.do?uid='.$puid;
		$page = (int)$this->_get('page',1);
		$user_account_model = Load::model('user_account');
		$row = $user_account_model->fetchRow("uid='".$puid."'",null,"sum(`money`*`doact`) as allmoney");
		$rows = $user_account_model->pageAll($page, 20, $url,"uid='".$puid."'",'id desc');
		$uinfo = $this->user->find($puid);
		$this->assign('uinfo', $uinfo);
		$this->assign('allmoney',$row['allmoney']);
		$this->assign('rows',$rows);
		$this->display();
	}

	function rewardmeAction()
	{
		$puid = intval($this->_get('uid',0));
		if($puid<=0){
			$this->showmsg('参数错误',1);
		}
		$nowtime = time();
		$url = $this->getPageUrl().'/rewardme.do?uid='.$puid;
		$page = (int)$this->_get('page',1);
		$e_user_model = Load::model('e_user');
		$enrolllog_model = Load::model('enrolllog');
		$jobs_model = Load::model('jobs');
		//$row = $enrolllog_model->fetchRow("uid='".$puid."'",null,"sum(`money`*`doact`) as allmoney");
		$rows = $enrolllog_model->pageAll($page, 20, $url,"uid='".$puid."' and status=1",'id desc');
		foreach($rows as $k=>$v){
			$rows[$k]['ename'] = $v['eid']>0 ? $e_user_model->getCompanyName($v['eid']) : '';
			$rows[$k]['jobname'] = $v['jobid']>0 ? $jobs_model->getJobName($v['jobid']) : '';
		}
		$uinfo = $this->user->find($puid);
		if($uinfo['puid']>0){
			$puinfo = $this->user->find($puid);
		}
		$this->assign('puinfo', $puinfo);
		//$this->assign('allmoney',$row['allmoney']);
		$this->assign('rows',$rows);
		$this->display();
	}

	function bankAction()
	{
		$puid = intval($this->_get('uid',0));
		if($puid<=0){
			$this->showmsg('参数错误',1);
		}
		$user_bank_model = Load::model('user_bank');
		$banks = $alipays = array();
		$rows = $user_bank_model->fetchAll('uid='.$puid,'id desc');
		$i=0;
		if(!empty($rows)){
			foreach($rows as $v){
				if($i==0){$v['status'] = 1;}else{$v['status'] = 0;}
				if($v['type']=='bank'){
					$banks[] = $v;
				}else{
					$alipays[] = $v;
				}
				$i++;
			}
		}
		$uinfo = $this->user->find($puid);
		$this->assign('uinfo', $uinfo);
		$this->assign('banks',$banks);
		$this->assign('alipays',$alipays);
		$this->display();
	}


	function addAction(){
		$this->display('user_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!($info = $this->user->find($id))){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['password'] = '********';
		$this->assign('info', $info);
		$this->display('user_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$oldmobile = $this->_get('oldmobile');
		if(!$info['id']){
			$info['status'] = 1;
			$info['regdate'] = time();
			$info['regip'] = F::onlineip();
			$info['password'] = md5($info['password']);
			if(!$this->user->checkinfo('email',$info['email'])){
				$this->showmsg("您使用的Email地址已被注册",1,"380");
			}
		}else{
			if(!$this->_get('modpass')){
				unset($info['password']);
			}else{
				$info['password'] = md5($info['password']);
			}
		}

		if($info['mobile'] && $info['mobile'] != $oldmobile){
			if(!$this->user->checkinfo('mobile',$info['mobile'])){
				$this->showmsg("您填写的手机号地址已被注册",1,"380");
			}
		}

		if(($uid = $this->user->save($info)) === false){
			$this->showmsg($this->user->getError(),1,"380");
		}
		
		if($this->_get('postaction')=='saveback'){
			$this->showmsg('操作成功',"add.do","380");
		}else{
			$this->showmsg('操作成功',5,"380");
		}
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
    	$this->wajaxmsg('删除成功',1);
	}

	function statusAction(){
		$id = $this->_get('uid',0);
		if(!$id){
			$this->wajaxmsg('非法操作',1);
			exit();
		}
		$info = $this->user->find($id);
		$info['resume_status']=0;
		$uid = $this->user->save($info);
		if($uid){
			$this->showmsg("解锁成功");
		}else{
			$this->showmsg("解锁失败");
		}
	}
}
?>