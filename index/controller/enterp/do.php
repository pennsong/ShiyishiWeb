<?php
//会员中心表单提交程序执行总入口
class do_Controller extends Controller{
	
	function init(){
		$this->logincheck('enterp');
		$this->user = Load::model('e_user');
	}
	
	function indexAction(){
		
	}

	//信息修改
	function profileAction(){
		$this->postCheck($_POST);
		$info = $this->_get('info');
		$this->logincheck();
		$this->uid = $this->logininfo['uid'];
		$info['id'] = $this->uid;
		if($this->user->save($info) === false){
			$this->showmsg($this->user->getError(),1);
		}
		$this->showmsg('恭喜，信息修改成功',BASE_URL."/enterp/");
	}

	//上传头像
	function userpicAction(){
		$uploadmodel = Load::lib('upload');
		if($uploadmodel->run('file')){
			$filedata = $uploadmodel->data();
			$smallimg = $filedata['file_small']['s']&&!is_array($filedata['file_small']['s']) ? $filedata['file_small']['s'] : $filedata['file_url'];
			$this->user->update(array('id'=>$this->uid,'userphoto'=>$smallimg));
			echo '<script>parent.uploadSuccess("'.IMG_DOMAIN.'/'.$smallimg.'");</script>';
		}else{
			echo '<script>parent.uploadError("'.$uploadmodel->display_errors().'");</script>';
		}
	}

	//登录
	function loginAction(){
		//$this->postCheck($_POST);
		$loginusername = $this->_get('loginusername');
		$loginpassword = $this->_get('loginpassword');
		if(!$loginusername){
			$this->showmsg("登录账号不能为空",1);
		}
		if(!$loginpassword){
			$this->showmsg("登录密码不能为空",1);
		}
		$userinfo = $this->user->fetchRow("username= '".$loginusername."'");
		if(empty($userinfo) || $userinfo['status'] != 2){
			$this->showmsg("您的账号不存在！",1);
		}
		if($userinfo['password']!=md5($loginpassword)){
			$this->showmsg("您的密码不正确！",1);
		}
		$logininfo['loginstat'] = 1;
		$logininfo['uid'] = $userinfo['id'];
		$logininfo['email'] = $userinfo['email'];
		$logininfo['username'] = $userinfo['username'];
		$logininfo['company'] = $userinfo['company'];
		$logininfo['contact'] = $userinfo['contact']; 
		F::userlogin($logininfo,"enterp");
		F::userlogout();
		$this->logininfo = F::logininfo("enterp");
		$backurl = $this->_get('r',BASE_URL.'/enterp/');
		$this->showmsg('恭喜，登录成功',$backurl);
	}

	//登录
	function vloginAction(){
		$loginusername = $this->_get('n');
		$loginpassword = $this->_get('p');
		if(!$loginusername){
			//$this->showmsg("登录账号不能为空",1);
			echo -1;
		}
		if(!$loginpassword){
			//$this->showmsg("登录密码不能为空",1);
			echo -2;
		}
		$userinfo = $this->user->fetchRow("username= '".$loginusername."'");
		if(empty($userinfo) || $userinfo['status'] != 2){
			//$this->showmsg("您的账号不存在！",1);
			echo -3;
		}
		if($userinfo['password']!=md5($loginpassword)){
			//$this->showmsg("您的密码不正确！",1);
			echo -4;
		}
		echo 1;
	}

	function enrollAction(){
		$uid = (int)$this->_get('uid',0);
		$jobid = (int)$this->_get('jobid',0);
		$rtype = $this->_get('t','cn');
		$logininfo = F::logininfo("enterp");
		$eid = $logininfo['uid'];
		$resumemodel = Load::model('resume');
		$enrolllogmodel = Load::model('enrolllog');
		$usermodel = Load::model('user');
		if($uid>0){
			$userinfo = $usermodel->find($uid);
			$idcard = $userinfo['idcard'];
			if(!$userinfo['idcard']){
				$resume = $resumemodel->fetchRow(" rtype='".$rtype."' and uid = ".$uid );
				$idcard = $resume['idcard'];
			}
		}else{
			$idcard = '';
		}
		if($idcard){
			$check = $enrolllogmodel->fetchRow("status=1 AND usercard='".$idcard."'");
			if($check){
				$this->showmsg('该求职者已被其他企业录用。');
			}
			$info['eid'] = $eid;
			$info['jobid'] = $jobid;
			$info['uid'] = $uid;
			$info['usercard'] = $idcard;
			$info['status'] = 1;
			if($enrolllogmodel->save($info) === false){
				$this->showmsg($enrolllogmodel->getError(),1);
			}
			
			if($userinfo){
				$uinfo['id'] = $uid;
				$uinfo['eid'] = $eid;
				$uinfo['jobid'] = $jobid;
				$uinfo['resume_status'] = 2;
				$uinfo['edatetime'] = time();
				$usermodel->update($uinfo);
				//判断是否存在上级
				if($userinfo['puid']>0){
					$jobs_model = Load::model('jobs');
					$ename = $this->user->getCompanyName($eid);
					$jobname = $jobs_model->getJobName($jobid);
					$useraccountmodel = Load::model('user_account');
					$useraccountmodel->save(array('uid'=>$userinfo['puid'],'xid'=>$userinfo['id'],'eid'=>$eid,'money'=>'100','doact'=>1,'status'=>1,'aclog'=>$ename.' 录用了 您的朋友：'.$userinfo['email'].'；职位为：'.$jobname));
				}
			}
			$this->showmsg('成功录用！','/enterp/resume/downlist.html');
		}else{
			$this->showmsg('参数错误',1);
		}
	}

	function logoutAction(){
		session_unregister();
		session_destroy();
		$this->_header(BASE_URL."/enterp/");
	}
}
?>
