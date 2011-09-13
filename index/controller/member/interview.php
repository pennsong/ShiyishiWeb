<?php
//在线视频面试大厅面试者页面。
class interview_Controller extends Controller{

	function init(){
		$this->logincheck();
		$this->user = Load::model('user');
		$this->myjob_int = Load::model('myjob_int');
		$this->e_user = Load::model('e_user');
		$this->jobs = Load::model('jobs');
		$this->vodroom = Load::model('app_video_interview');
		$this->vodroomhold = Load::model('app_video_interview_mans');
	}
	
	function indexAction(){
		$uid = $this->logininfo['uid'];
		$nowtime = time();
		$intdate = (int)date("Ymd");
		//1 验证该用户是否有被邀请视频面试
		$myjobints = $this->myjob_int->fetchAll("uid=".$uid." AND status=1 AND interview_type=2 AND interview_date<=".($nowtime+1200));
		if(empty($myjobints)){
			$this->showmsg('抱歉，您暂时没有被任何公司邀请参加视频面试。',BASE_URL."/member/");
		}
		$goin = array();
		$intok = 0;
		$introomid = 0;
		$introom = '';
		foreach($myjobints as $int){  
			$gocheck = false;
			$room = $this->vodroom->fetchRow("cid=".$int['eid']." AND status=1 AND intend=0 AND starttime <= ".($nowtime+1200)." AND endtime >= ".$nowtime);
			if($room){
				if($int['interview_date']>=$room['starttime'] && $int['interview_date']<=$room['endtime']){
					$int['vodroom'] = $room;
					$int['msstatus'] = 0;
					$intok++;
					//排队处理
					$check = $this->vodroomhold->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND uid=".$uid);
					if($check){
						if($check['intend']>0){
							$int['msstatus'] = -1;
							$this->vodroomhold->update(array('id'=>$check['id'],'status'=>-1));
						}else{
							if($check['status']>0){
								$introomid = $room['id'];
								$introom = $room['room'];
							}
							$int['msstatus'] = $check['status'];
							$this->vodroomhold->update(array('id'=>$check['id'],'lastactivetime'=>$nowtime));
							$interviewlogintime = $check['logintime'];
						}
					}else{
						$this->vodroomhold->save(array('roomid'=>$room['id'],'uid'=>$uid,'intdate'=>$intdate,'logintime'=>$nowtime,'lastactivetime'=>$nowtime));
						$interviewlogintime = $nowtime;
					}
					$int['roomid'] = $room['id'];
					$int['room'] = $room['room'];
					$int['roomstatus'] = $room['intstart']>0 ? '正在面试' : '未开始';
					if($int['msstatus'] != -1){
						$int['holdnums'] = $this->vodroomhold->count("roomid=".$room['id']." AND status=0 AND intdate='".$intdate."' AND logintime<".$interviewlogintime);
					}
					$gocheck = true;
				}
			}else{
				$dvalue = abs($int['interview_date'] - $nowtime);
				if($dvalue <= 1800 ){
					$gocheck = true;
				}
			}
			if($gocheck){
				$int['ename'] = $this->e_user->getCompanyName($int['eid']);
				$int['jobname'] = $this->jobs->getJobName($int['jobid']);
				$goin[] = $int;
			}
		}
		if(empty($goin)){
			$this->showmsg('抱歉，您暂时没有该时间段要参加的视频面试。',BASE_URL."/member/");
		}

		if($intok<1){
			$this->showmsg('抱歉，邀请您面试的企业还没成功申请面试房间，请稍后再来，或通知面试方申请开通。',BASE_URL."/member/");
		}

		$intviewnum = count($goin);

		$resumemodel = Load::model('resume');
		$uname = $resumemodel->getUname($uid);
		$this->assign('uid',$uid);
		$this->assign('user',$uname ? $uname : $uid);
		$this->assign('introomid',$introomid);
		$this->assign('introom',$introom);
		$this->assign('intviewnum',$intviewnum);
		$this->assign('goin',$goin);
		$this->assign('pagetitle','在线视频面试大厅');
		$this->display();
	}
}
?>