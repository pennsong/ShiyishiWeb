<?php
class mail_Model extends Model{
	function init(){
		$this->m = Load::lib('mail');
		$this->cache = Load::model('cache');
		$this->mc = Load::conf('mail:local');
	}
	
	/*
	** data (array) 必须包含 action ,user ,mail 其中user中必须包括 usertype[inter,person,company],useremail;mail数据包括：如发帖时的帖子标题 帖子id，帖子url
等。
	*/
	function send($action='auto',$user=array(),$mail=array()){
		if(empty($user))
			return false;
		$usertype = $this->usertype();
		$cache_key = $action.$usertype;
		$taskinfo = $this->cache->getMailTasks();
		$taskinfo = $taskinfo[$cache_key];
		$mailinfo = $this->cache->getMailTemplates();//$taskinfo['templateid']
		$mailinfo = $mailinfo[$taskinfo['templateid']];
		$mailbody = $mailinfo['mailcontent'];
		$user['username'] = !isset($user['username']) ? substr($user['useremail'],0,strpos($user['useremail'],"@")) : $user['username'];
		//格式化邮件标题
		$mailsubject = str_replace("{用户名}",$user['username'],$mailinfo['mailsubject']);
		//格式化邮件内容
		$mailbody = str_replace("{用户名}",$user['username'],$mailbody);
		$mailbody = str_replace("{用户邮件}",$user['useremail'],$mailbody);
		
		//找回密码
		if($action=='act'){
			$mailbody = str_replace("{用户密码}",$user['userpasswd'],$mailbody);
		}

		$this->m->CharSet = "gb2312";
		$this->m->IsSendmail();
		$this->m->SetFrom($this->mc['from_email'], @iconv("UTF-8","GB2312",$this->mc['from_user']));
		$this->m->AddAddress($user['useremail'], $user['username']);
		$this->m->Subject = @iconv("UTF-8","GB2312",$mailsubject);
		$this->m->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
		$this->m->MsgHTML(@iconv("UTF-8","GB2312",$mailbody));
		//$mail->AddAttachment('images/phpmailer.gif');      // attachment
		//$mail->AddAttachment('images/phpmailer_mini.gif'); // attachment
	
		if ($this->m->Send ()) {
			return true;
		}else{
			return false;
		}
	}

	function usertype(){
		return 'common';

	}
}
?>