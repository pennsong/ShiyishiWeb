<?php
//个人会员中心表单提交程序执行总入口
class do_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->uid = $this->logininfo['uid'];
		$this->user = Load::model('user');
	}
	
	function indexAction(){
		
	}

	//1. 个人信息修改
	function profileAction(){
		$this->postCheck($_POST);
		$info = $this->_get('info');

		if(!$info['oldpassword']){
			$this->showmsg("旧密码不能为空",1);
		}
		if(!$info['password']){
			$this->showmsg("新密码不能为空",1);
		}
		if($info['password1']!=$info['password']){
			$this->showmsg("两次密码输入不一致",1);
		}
		if(md5($info['oldpassword'])!=$this->logininfo['password']){
			$this->showmsg("旧密码验证不正确",1);
		}

		if(!$info['password']){
			unset($info['password']);
		}else{
			$info['password'] = md5($info['password']);
		}
		$info['id'] = $this->uid;
		if($this->user->save($info) === false){
			$this->showmsg($this->user->getError(),1);
		}
		F::setlogininfo('password',$info['password']);
		$this->showmsg('恭喜，个人信息修改成功',BASE_URL."/member/profile.html");
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

	//银行卡信息
	function bankAction(){
		$this->postCheck($_POST);
		$info = $this->_get('info');
		if($info['type']=='bank'){
			if(!$info['bank_name']){
				$this->showmsg("所属银行不能为空",1);
			}
			if(!$info['bank_kaihu']){
				$this->showmsg("开户行不能为空",1);
			}
			if(!$info['card_user']){
				$this->showmsg("开户人户名不能为空",1);
			}
			if(!$info['card_number']){
				$this->showmsg("个人银行卡号不能为空",1);
			}
			if($info['card_number1']!=$info['card_number']){
				$this->showmsg("两次输入的个人银行卡号不一致",1);
			}
		}else{
			if(!$info['alipay_number']){
				$this->showmsg("支付宝账号不能为空",1);
			}
			if($info['alipay_number1']!=$info['alipay_number']){
				$this->showmsg("两次输入的支付宝账号不一致",1);
			}
			$info['card_number'] = $info['alipay_number'];
			$info['bank_name'] = '支付宝';
			$info['bank_user'] = '支付宝';
		}

		unset($info['card_number1']);
		$info['uid'] = $this->uid;
		$user_bankmodel = Load::model('user_bank');

		if($user_bankmodel->save($info) === false){
			$this->showmsg($this->user->getError(),1);
		}

		$this->showmsg('恭喜，收款账号添加成功',BASE_URL."/member/tg/bank.html");
	}

	//添加简历
	function addresumeAction(){
		//$this->postCheck($_POST);
		$info = $this->_get('info');
		if(!$info['uname']){
			$this->showmsg("姓名不能为空",1);
		}
		if(!$info['idcard']){
			$this->showmsg("身份证不能为空",1);
		}
		$rtype = $this->_get('rtype');
		$winfo = $this->_get('winfo');
		$einfo = $this->_get('einfo');
		$linfo = $this->_get('linfo');
		$cinfo = $this->_get('cinfo');
		$itinfo = $this->_get('itinfo');
		$deleteinfo = $this->_get('delete');

		$info['uid'] = $this->uid;
		$info['rtype'] = $rtype;
		//print_r($info);print_r($winfo);print_r($einfo);print_r($linfo);print_r($cinfo);print_r($itinfo);exit;
		$info['birth_gnd'] = $info['birth_gnd_p'].','.$info['birth_gnd_c'];
		$info['live_gnd'] = $info['live_gnd_p'].','.$info['live_gnd_c'];
		$info['work_gnd'] = $info['work_gnd_p'].','.$info['work_gnd_c'];
		$info['speciality'] = $info['speciality'];
//		$info['speciality'] = $info['speciality_1'].','.$info['speciality_2'];
		$info['dustrytype'] = $info['dustrytype_1'].','.$info['dustrytype_2'];
		$info['funtype'] = $info['funtype_1'].','.$info['funtype_2'];
		$info['modifydate'] = time();
		$resumemodel = Load::model('resume');
		if($resumemodel->save($info) === false){
			$this->showmsg($resumemodel->getError(),1);
		}

		//工作经历
		if(!empty($winfo)){
			$datamodel = Load::model('resume_work');
			foreach($winfo as $work){
				$work['company'] = trim($work['company']);
				if($work['company']){
					$work['uid'] = $this->uid;
					$work['rtype'] = $rtype;
					$work['fromdate'] = $work['from_year'].'-'.$work['from_month'].'-'.$work['from_day'];
					$work['todate'] = $work['to_year']=='至今' ? '至今' : ($work['to_year'].'-'.$work['to_month'].'-'.$work['to_day']);
					if($work['id']>0)$work['modifydate'] = time();
					$datamodel->save($work);
				}
			}
			if($deleteinfo['work']){
				$datamodel->removeBy('id IN ('.trim($deleteinfo['work'],',').')');
			}
		}
		//教育
		if(!empty($einfo)){
			$datamodel = Load::model('resume_edu');
			foreach($einfo as $row){
				$row['schoolname'] = trim($row['schoolname']);
				if($row['schoolname']){
					$row['uid'] = $this->uid;
					$row['rtype'] = $rtype;
					$row['fromdate'] = $row['from_year'].'-'.$row['from_month'].'-'.$row['from_day'];
					$row['todate'] = $row['to_year']=='至今' ? '至今' : ($row['to_year'].'-'.$row['to_month'].'-'.$row['to_day']);
					$row['major'] = $row['major'];
//					$row['major'] = $row['major_1'];
//					if($row['major_2']>0){
//						$row['major'] .= ','.$row['major_2'];
//					}
					if($row['id']>0)$row['modifydate'] = time();
					$datamodel->save($row);
				}
			}
			if($deleteinfo['edu']){
				$datamodel->removeBy('id IN ('.trim($deleteinfo['edu'],',').')');
			}
		}
		//证书
		if(!empty($cinfo)){
			$datamodel = Load::model('resume_ctf');
			foreach($cinfo as $row){
				$row['ctfname'] = trim($row['ctfname']);
				if($row['ctfname']){
					$row['uid'] = $this->uid;
					$row['rtype'] = $rtype;
					$row['awarddate'] = $row['award_year'].'-'.$row['award_month'].'-'.$row['award_day'];
					if($row['id']>0)$row['modifydate'] = time();
					$datamodel->save($row);
				}
			}
			if($deleteinfo['ctf']){
				$datamodel->removeBy('id IN ('.trim($deleteinfo['ctf'],',').')');
			}
		}
		//语言
		if(!empty($linfo)){
			$datamodel = Load::model('resume_lang');
			foreach($linfo as $row){
				$row['uid'] = $this->uid;
				$row['rtype'] = $rtype;
				if($row['id']>0)$row['modifydate'] = time();
				$datamodel->save($row);
			}
			if($deleteinfo['lang']){
				$datamodel->removeBy('id IN ('.trim($deleteinfo['lang'],',').')');
			}
		}
		//计算机
		if(!empty($itinfo)){
			$datamodel = Load::model('resume_it');
			foreach($itinfo as $row){
				$row['skillname'] = trim($row['skillname']);
				if($row['skillname']){
					$row['uid'] = $this->uid;
					$row['rtype'] = $rtype;
					if($row['id']>0)$row['modifydate'] = time();
					$datamodel->save($row);
				}
			}
			if($deleteinfo['it']){
				$datamodel->removeBy('id IN ('.trim($deleteinfo['it'],',').')');
			}
		}
		if($rtype=='cn'){
			//插入姓名
			$upinfo['id'] = $this->uid;
			$upinfo['username'] = $info['uname'];
			$this->user->save($upinfo);
			F::setlogininfo('username',$info['uname']);
			$tname = '中文';
			$txtval = 1;
		}else{
			$tname = '英文';
			$txtval = 2;
		}
		if(!$info['id']){
			if($this->logininfo['resume_txt']<3){
				if($this->logininfo['resume_txt']<=0){
					$resume_txt = $txtval;
				}else{
					$resume_txt = $this->logininfo['resume_txt'] == $txtval ? $txtval : ($this->logininfo['resume_txt']+$txtval);
				}
				$uinfo['id'] = $this->uid;
				$uinfo['phone'] = $info['phone'];
				$uinfo['resume_txt'] = $resume_txt;
				$this->user->save($uinfo);
				F::setlogininfo('resume_txt',$resume_txt);
			}
		}else{
			if($info['phone']!=$info['oldphone']){
				$uinfo['id'] = $this->uid;
				$uinfo['mobile'] = $info['phone'];
				$this->user->save($uinfo);
			}
		}

		$this->showmsg('恭喜，'.$tname.'简历'.($info['id']>0 ? '更新' : '新建').'成功',BASE_URL."/member/");
	}
	
	//上传视频简历
	function addvodAction(){
		$id = $this->_get('id',0);
		$hasvodurl = false;
		if(isset($_FILES['vodurl'])&&$_FILES['vodurl']['name']){
			$upload = Load::lib('upload');
			$upload->max_size = 10485760;//10M
			$upload->allowed_types = explode('|', "flv|swf");
			if($upload->run('vodurl',$st)){
				$filedata = $upload->data();
				$info['vodurl'] = $filedata['file_url'];
			}else{
				$this->showmsg($upload->display_errors(),1);
			}
			$hasvodurl = true;
		}
		$vodmodel = Load::model('resume_vod');
		if($id>0){
			$info['id'] = $id;
			$msg = '';
			if($hasvodurl){
				$info['status'] = 0;
				if($vodmodel->save($info) === false){
					$this->showmsg($vodmodel->getError(),1);
				}
			}else{
				$this->showmsg('没有上传新的视频,视频简历更新失败',1);
			}
			$this->showmsg('恭喜，视频简历更新成功'.$msg,BASE_URL."/member/resume/vod.html");
		}else{
			if(!$hasvodurl){
				$this->showmsg("请选择要上传的视频",1);
			}
			$info['uid'] = $this->uid;
			$info['status'] = 0;
			$info['vodimg'] = 'images/msdatu.jpg';
			if($vodmodel->save($info) === false){
				$this->showmsg($vodmodel->getError(),1);
			}
			$uinfo['id'] = $this->uid;
			$uinfo['resume_vod'] = 1;
			$this->user->save($uinfo);
			F::setlogininfo('resume_vod',1);
			$this->showmsg('恭喜，视频简历新添成功',BASE_URL."/member/resume/vod.html");
		}
	}
	
	function myjobAction()
	{
		$act = trim($this->_get('act','pos'));
		$myjobmodel = Load::model('myjob_'.$act);
		$ids = $this->_get('ids');
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要删除的对象');
			}
			$ids = array($id);
		}
		$myjobmodel->update(array('status'=>0),"id IN (".implode(',',$ids).")");
		$this->wajaxmsg('删除成功',1);
	}
	//申请工作
	function applyjobAction(){
		$jobid = (int)$this->_get('jobid',0);
		if($jobid<=0){
			$this->showmsg("非法的URL","/");
		}
		$uinfo = $this->user->find($this->uid);
		if($uinfo['resume_txt']<1){
			$this->showmsg("您还未上传文字简历，目前不能申请职位。",BASE_URL."/member/resume/doc.html",1,'立即添加文字简历');
		}

		$web = $this->cache->getConfig();

		if($web['isvideo']==1 && $uinfo['resume_vod']<1){
			$this->showmsg("您还未上传视频简历，目前不能申请职位。",BASE_URL."/member/resume/vod.html",1,'立即上传视频简历');
		}

		if($uinfo['resume_status']<1){
			$this->showmsg("您的求职状态为免打扰，请更改状态为求职中即可申请该职位。",BASE_URL."/member/",1,'立即更改');
		}

		if($uinfo['resume_status']==2&&(time()-$uinfo['edatetime']<30*86400)){
			$this->showmsg("您已经被企业录用，并且一个月内无法再求职，如重新申请职位，请通过服务热线与我们服务人员联系。",BASE_URL."/member/",1,'返回个人中心');
		}

		$jobsmodel = Load::model('jobs');
		$info = $jobsmodel->find($jobid);
		if(!$info){
			$this->showmsg("该职位不存在","/");
		}

		$resumemodel = Load::model('resume');
		$resume = $resumemodel->fetchRow(" rtype='cn' and uid=".$this->uid." ");
		$backurl = $_SERVER['HTTP_REFERER'] ? $_SERVER['HTTP_REFERER'] : '/';
		$myjobmodel = Load::model('myjob_pos');
		$resume_box = Load::model('resume_box');

		$rnum = $resume_box->count("rid=".$resume['id']." AND jid=".$info['id']." AND cid=".$info['cid']." ");
		//判断是否已经申请
		$num = $myjobmodel->count("uid=".$this->uid." AND jobid={$jobid}");
		if($num>0 || $rnum>0){
			$this->showmsg("您已经申请了该职业，请不要重复申请。",$backurl);
		}

		$binfo['cid'] = $info['cid'];
		$binfo['jid'] = $info['id'];
		$binfo['rid'] = $resume['id'];
		$binfo['posttime'] = time();
		$binfo['status'] = 1;

		if($resume_box->save($binfo) === false){
			$this->showmsg($resume_box->getError(),1);
		}

		$pinfo['uid'] = $this->uid;
		$pinfo['eid'] = $info['cid'];
		$pinfo['jobid'] = $jobid;
		$pinfo['job_expiry_date'] = $info['enddate'];

		if($myjobmodel->save($pinfo) === false){
			$this->showmsg($myjobmodel->getError(),1);
		}
		
		$this->showmsg("职位“".$info['title']."”申请成功",$backurl,null,null,"yes");
	}

	function setresumestatusAction(){
		$this->postCheck($_POST);
		$info['resume_status'] = (int)$this->_get('resume_status',0);
		$info['id'] = $this->uid;
		$userinfo = $this->user->find($this->uid);
		$nowtime = time();
		if($userinfo['resume_status']==2&&($nowtime-$userinfo['edatetime']<2592000)){
			$this->showmsg('你已经被企业录取，一个月内不能再更改求职状态，或者联系网站管理员解决。',BASE_URL."/member/");
		}
		if($this->user->save($info) === false){
			$this->showmsg($this->user->getError(),1);
		}
		$resumemodel = Load::model('resume');
		$resumemodel->update(array('status'=>1),'uid='.$this->uid);
		F::setlogininfo('resume_status',$info['resume_status']);
		$this->showmsg('恭喜，求职状态更新成功。',BASE_URL."/member/");
	}

	function lingAction(){
		$web = $this->cache->getConfig();
		$useraccountmodel = Load::model('user_account');
		$row = $useraccountmodel->fetchRow("uid='".$this->uid."'",null,"sum(`money`*`doact`) as allmoney");
		$allmoney = $row['allmoney'];
		if($allmoney<$web['txmoney']){
			$this->wajaxmsg('您的推广奖励还没满1000分，无法申领。');
		}

		$user_bank_model = Load::model('user_bank');
		$row = $user_bank_model->fetchRow('uid='.$this->uid);
		if(!$row){
			$this->wajaxmsg('您没有填写银行账户信息，无法申领。',2);
		}
		
		$minfo = array('uid'=>$this->uid,'xid'=>0,'money'=>$allmoney,'doact'=>-1,'aclog'=>'申请领款“&yen;'.($allmoney/10).'元”','status'=>1);
		if($useraccountmodel->save($minfo) === false){
			$this->wajaxmsg($useraccountmodel->getError(),1);
		}
		$this->wajaxmsg('您成功申领“￥'.($allmoney/10).'元”，请等待管理员审核，审核通过后会在每月最后三天内统一发放。',1);
	}

}
?>
