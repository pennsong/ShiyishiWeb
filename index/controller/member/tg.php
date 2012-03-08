<?php
//会员中心 推广计划
class tg_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->user = Load::model('user');
		$this->uid = $this->logininfo['uid'];
		$this->e_user = Load::model('e_user');
	}
	
	function indexAction()
	{
		$this->_forward('code');
	}

	function codeAction()
	{
		$tgurl = BASE_URL.'/r/'.$this->uid;
		$this->assign('tgurl',$tgurl);
		$this->assign('pagetitle','我的推广代码');
		$this->display();
	}

	function recordAction()
	{
		$nowtime = time();
		$url = $this->getPageUrl().'/record.html';
		$page = (int)$this->_get('page',1);
		$resume_model = Load::model('resume');
		$enrolllog_model = Load::model('enrolllog');
		$jobs_model = Load::model('jobs');
		$allnums = $this->user->count("puid='".$this->uid."'");
		$rows = $this->user->pageAll($page, 15, $url,"puid='".$this->uid."'",'etimes desc');
		foreach($rows as $k=>$v){
			$uinfo = array('id'=>$v['id']);
			$up =false;
			$v['ename'] = $v['eid']>0 ? $this->e_user->getCompanyName($v['eid']) : '';
			$v['jobname'] = $v['jobid']>0 ? $jobs_model->getJobName($v['jobid']) : '';
			if(!$v['username']){
				$v['username'] = $resume_model->getUname($v['id']);
				if($v['username']){
					$uinfo['username'] = $v['username'];
					$up =true;
				}
			}
			if($v['eid']>0 && $v['etimes']<=0){
				$v['etimes'] = $enrolllog_model->count("uid='".$v['id']."' AND status=1");
				if($v['etimes']>0){
					$uinfo['etimes'] = $v['etimes'];
					$up =true;
				}
			}
			if($up)$this->user->save($uinfo);
			
			$rows[$k] = $v;
		}
		$this->assign('num',$allnums);
		$this->assign('rows',$rows);
		$this->assign('pagetitle','我的推广下线');
		$this->display();
	}

	function enrollAction()
	{
		$nowtime = time();
		$uid = (int)$this->_get('uid',0);
		if($uid<=0){
			$this->showmsg("用户参数错误",1);
		}
		$resume_model = Load::model('resume');
		$username = $resume_model->getUname($uid);
		$enrolllog_model = Load::model('enrolllog');
		$rows = $enrolllog_model->fetchAll("uid='".$uid."' and status=1",'id desc');
		foreach($rows as $k=>$v){
			$v['ename'] = $v['eid']>0 ? $this->e_user->getCompanyName($v['eid']) : '';
			$rows[$k] = $v;
		}
		$this->assign('num',count($rows));
		$this->assign('username',$username ? $username : $uid);
		$this->assign('rows',$rows);
		$this->assign('pagetitle','我的推广下线');
		$this->display();
	}

	function rewardAction()
	{
		$nowtime = time();
		$url = $this->getPageUrl().'/reward.html';
		$page = (int)$this->_get('page',1);
		$user_account_model = Load::model('user_account');
		$row = $user_account_model->fetchRow("uid='".$this->uid."'",null,"sum(`money`*`doact`) as allmoney");
		//获取领款后的新增记录
		//获取最后非驳回的领取的记录
		$row1 = $user_account_model->fetchRow("uid='".$this->uid."' and xid=0 and eid=0 and status<>0","id desc");
		//获取最后申请纪录
		$row2 = $user_account_model->fetchRow("uid='".$this->uid."' and xid=0 and eid=0","id desc");	
		$where[] = "uid='".$this->uid."'";
		if($row1){
			$where[] = "id > ".$row1['id'];
		}
		$where[] = "status = 1 and doact=1 ";
		$rows = $user_account_model->pageAll($page, 15, $url,$where,'id desc');
		//获取 申领记录
		$slrows = $user_account_model->fetchAll("uid='".$this->uid."' and xid=0 and eid=0","id desc");

		$this->assign('allmoney',$row['allmoney']);
		$this->assign('rows',$rows);
		$this->assign('slrows',$slrows);
		$this->assign('pagetitle','我的推广奖励');
		$this->assign('lastApply',$row2[status]==null?3:$row2[status]);
		$this->display();
	}

	function addbankAction(){
		$this->assign('pagetitle','添加银行账户');
		$this->assign('crumb','添加银行账户');
		$this->display();
	}

	function bankAction()
	{
		$user_bank_model = Load::model('user_bank');
		$banks = $alipays = array();
		$rows = $user_bank_model->fetchAll('uid='.$this->uid,'id desc');
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
		$this->assign('pagetitle','我的收款账户信息');
		$this->assign('crumb','我的收款账户信息');
		$this->assign('banks',$banks);
		$this->assign('alipays',$alipays);
		$this->display();
	}
}
?>
