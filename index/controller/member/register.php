<?php
//注册页面
class register_Controller extends Controller{
	
	function init(){
		$this->user = Load::model('user');
		unset($_COOKIE['sys_cookie_city']);
	}
	
	function indexAction(){
		if(F::islogin()){
			$this->_header(BASE_URL."/member/");
		}
		if($this->_get('email')){
			$this->ajaxmsg($this->user->checkinfo('email',$this->_get('email')) ? 'fail' : 'success');
		}
		if($this->_get('mobile')){
			$this->ajaxmsg($this->user->checkinfo('mobile',$this->_get('mobile')) ? 'fail' : 'success');
		}
		if($this->_get('idcard')){
			$this->ajaxmsg($this->user->checkinfo('idcard',$this->_get('idcard')) ? 'fail' : 'success');
		}

		$puid = (int)$this->_get('uid',0);
		$puinfo = array();
		if($puid>0){
			$resumemodel = Load::model('resume');
			$puinfo = $resumemodel->fetchRow(" rtype='cn' and uid = ".$puid );
			if(!$puinfo){
				$puinfo = $resumemodel->fetchRow(" rtype='en' and uid = ".$puid );
				if(!$puinfo){
					$puinfo = $this->user->find($puid);
					$pname = $puinfo['email'];
				}else{
					$pname = $puinfo['uname'];
				}
			}else{
				$pname = $puinfo['uname'];
			}
		}

		$backurl = $this->_get('r',$_SERVER['HTTP_REFERER']);
		$this->assign('backurl',$backurl);
		$this->assign('puid',$puid);
		$this->assign('pname',$pname);
		$this->assign('pagetitle','个人用户免费注册');
		$this->display();
	}

	function regokAction(){
		if(!F::islogin()){
			$this->_header(BASE_URL."/member/register.html");
		}
		$this->assign('pagetitle','恭喜您，注册成功！');
		$this->display();
	}

}
?>
