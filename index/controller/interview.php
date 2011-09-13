<?php
//在线面试大厅主页
class interview_Controller extends Controller{

	function init(){
		$this->vodroom = Load::model('app_video_interview');
		$this->vodroomhold = Load::model('app_video_interview_mans');
		$this->resume = Load::model('resume');
		$this->mem = Load::lib('cache','mem');
	}
	
	function indexAction(){
		//判断用户身份
		if(F::islogin()){
			$this->_redirect(BASE_URL.'/member/interview.html');
		}elseif(F::islogin('enterp')){
			$this->_redirect(BASE_URL.'/enterp/interview.html');
		}else{
			$this->assign('pagetitle','在线面试大厅主页');
			$this->display();
		}
	}

	function onlineAction(){
		$id = (int)$this->_get('id',0);
		if($id<=0){
			$this->showmsg('抱歉，该URL不可用！',BASE_URL."/");
		}

		if($_SESSION['leaderpasswd']!='ok'){
			$this->assign('id',$id);
			$this->assign('pagetitle','请输入进入密码');
			$this->display();
		}else{
			$nowtime = time();
			$intdate = (int)date("Ymd");
			$leadermodel = Load::model('leader');
			//验证
			$check = $leadermodel->find($id);
			if($check){
				$eid = $check['eid'];
				$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
				if(!($room = $this->mem->get($cachekey1))){
					$this->showmsg("抱歉，该面试还没开始 请等待面试官开始面试。");
				}
				$curow = $this->vodroomhold->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND status>0");
				$intnum = count($curow);
				$uname = $resumeTxt = '';
				if($intnum>0 && $curow['uid']>0){
					$uid = $curow['uid'];
					$resume = $this->resume->fetchRow(" rtype='cn' and uid = ".$uid);
					if(!$resume){
						$resume = $this->resume->fetchRow(" rtype='en' and uid = ".$uid );
					}
					$areamodel = Load::model('area');
					$uname = $resume['uname'];
					$resumeTxt = $resume['uname']."：".($resume['gender']==1 ? '男' : '女')."，出生于".$resume['birth_year']."年".$resume['birth_month']."月，现居住于".$areamodel->getNameByIds($resume['live_gnd'])."，手机：".$resume['phone']."，Email：".$resume['email']."，自我评价：".$resume['introduction'];
				}else{
					$intnum = 0;
				}
				$this->assign('eid',$eid);
				$this->assign('uid','l'.$eid);
				$this->assign('roleid',2);
				$this->assign('userid',$uid);
				$this->assign('uname',$uname);
				$this->assign('intnum',$intnum);
				$this->assign('resumeTxt',$resumeTxt);
				$this->assign('roomid',$room['id']);
				$this->assign('room',$room['room']);
				$this->assign('user','高级管理');
				$this->assign('pagetitle','在线视频面试大厅');
				$this->display("interview_leader.tpl");
			}
		}
	}
}
?>