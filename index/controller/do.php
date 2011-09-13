<?php
//表单提交程序执行总入口
class do_Controller extends Controller{
	
	function init(){
		$this->user = Load::model('user');
	}
	
	function indexAction(){
		
	}

	//1. 个人注册
	function uregAction(){
		$this->postCheck($_POST);
		//暂时不需要验证码
		//$validate = $this->_get('validate');
		//$codelib = Load::lib('vdimgck');
		//if($validate == '' || $validate != $codelib->getword()){
		//	$this->showmsg('验证码不正确!', 1);
		//}
		$info = $this->_get('info');
		if(!strpos($info['email'],'@')){
			$this->showmsg("邮箱格式不正确",1);
		}

		if(!$info['mobile']){
			$this->showmsg("手机不能为空",1);
		}

		if(!$info['idcard']){
			$this->showmsg("身份证不能为空",1);
		}

		if(!$info['password']){
			$this->showmsg("密码不能为空",1);
		}
		if($info['password1']!=$info['password']){
			$this->showmsg("两次密码输入不一致",1);
		}

		$info['password'] = md5($info['password']);

		$userinfo = $this->user->checkuserinfo(array('email'=>$info['email']));
		if(!empty($userinfo)){
			$this->showmsg("您使用的Email地址已被注册",1);
		}
		$userinfo = $this->user->checkuserinfo(array('mobile'=>$info['mobile']));
		if(!empty($userinfo)){
			$this->showmsg("您使用的手机号码已被注册",1);
		}
		$userinfo = $this->user->checkuserinfo(array('idcard'=>$info['idcard']));
		if(!empty($userinfo)){
			$this->showmsg("您使用的身份证已被注册",1);
		}
		$info['usertype'] = 'member';
		$info['regip'] = F::onlineip();
		$info['regdate'] = time();
		$info['status'] = 1;

		if(($uid = $this->user->save($info)) === false){
			$this->showmsg($this->user->getError(),1);
		}
		$logininfo['loginstat'] = 1;
		$logininfo['uid'] = $uid;
		$logininfo['email'] = $info['email'];
		$logininfo['idcard'] = $info['idcard'];
		$logininfo['allmoney'] = '0.00';
		$logininfo['allpoint'] = '0';
		$logininfo['password'] = $info['password'];
		$logininfo['phone'] = $info['mobile'];
		$logininfo['resume_status'] = 0;
		F::userlogin($logininfo);
		$backurl = BASE_URL.'/member/regok.html';//$this->_get('r',BASE_URL.'/my/');
		$m = Load::model('smtp');
		$m->sendmail('reg',array('username'=>$info['email'],'email'=>$info['email']));
		$this->_redirect($backurl);
		//$this->showmsg('恭喜，注册成功',$backurl);
	}

	//2. 登录
	function uloginAction(){
		$this->postCheck($_POST);
		$loginusername = $this->_get('uemail');
		$loginpassword = $this->_get('upassword');
		if(!$loginusername){
			$this->showmsg("登录账号不能为空",1);
		}
		if(!$loginpassword){
			$this->showmsg("登录密码不能为空",1);
		}
		//判断填写的用户名 email 还是会员卡
		if(!strpos($loginusername,'@')){
			$this->showmsg("登录账号为您注册时填写的Email",1);
		}

		$userinfo = $this->user->checkuserinfo(array('email'=>$loginusername));

		if(empty($userinfo)){
			$this->showmsg("您的用户名填写错误或不存在！",1);
		}
		if($userinfo['password']!=md5($loginpassword)){
			$this->showmsg("您的密码输入错误！",1);
		}
		$logininfo['loginstat'] = 1;
		$logininfo['uid'] = $userinfo['id'];
		$logininfo['email'] = $userinfo['email'];
		$logininfo['username'] = $userinfo['username'];
		$logininfo['idcard'] = $userinfo['idcard'];
		$logininfo['allmoney'] = $userinfo['allmoney'];
		$logininfo['allpoint'] = $userinfo['allpoint'];
		$logininfo['password'] = $userinfo['password'];
		$logininfo['phone'] = $userinfo['mobile'];
		$logininfo['resume_txt'] = $userinfo['resume_txt'];
		$logininfo['resume_vod'] = $userinfo['resume_vod'];
		$logininfo['resume_status'] = $userinfo['resume_status'];
		F::userlogin($logininfo);
		$backurl = $this->_get('r',BASE_URL.'/member/');
		$this->showmsg('恭喜，登录成功',$backurl);
	}

	//3. 找回密码
	function getpwdAction(){
		$this->postCheck($_POST);
		$loginusername = $this->_get('uemail');
		if(!$loginusername){
			$this->showmsg("请输入您要找回的账号",1);
		}
		//判断填写的用户名 email 还是会员卡
		if(!strpos($loginusername,'@')){
			$this->showmsg("登录账号为您注册时填写的Email",1);
		}
		$userinfo = $this->user->checkuserinfo(array('email'=>$loginusername));
		if(empty($userinfo)){
			$this->showmsg("您的用户名填写错误或不存在！",1);
		}

		$newpassword = F::getRandomstr(6);
		if($this->user->update(array('password'=>md5($newpassword)),'id='.$userinfo['id']) === false){
			$this->showmsg($this->user->getError(),1);
		}

		$uname = $userinfo['usertype'] == 'member' ? '会员朋友' : '企业会员';
		
		$m = Load::model('mail');
		$m->send('act',array('username'=>$uname,'useremail'=>$userinfo['email'],'userpasswd'=>$newpassword));
		
		$this->showmsg('恭喜，邮件已发送您您注册邮箱，请到'.$userinfo['email'].'查询，感谢您的支持。',BASE_URL."/");
	}

	//退出登录
	function logoutAction(){
		F::userlogout();
		$this->_header(BASE_URL."/");
	}

	function leaderAction(){
		$id = (int)$this->_get('id');
		$passwd = trim($this->_get('passwd'));
		if($id>0){
			$leadermodel = Load::model('leader');
			//验证
			$check = $leadermodel->find($id);
			if($check && $check['passwd']==$passwd){
				$_SESSION['leaderpasswd'] = 'ok';
				$this->_header(BASE_URL.'/i/'.$id);
			}else{
				$this->showmsg('密码输入错误！',1);
			}
		}
		$this->showmsg('非法URL！',BASE_URL.'/');
	}
}
?>
