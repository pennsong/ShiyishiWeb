<?php
//在线视频面试大厅面试官页面。
class interview_Controller extends Controller{

	function init(){
		$this->logincheck("enterp");
		$this->user = Load::model('user');
		$this->e_user = Load::model('e_user');
		$this->jobs = Load::model('jobs');
		$this->vodroom = Load::model('app_video_interview');
		$this->vodroomhold = Load::model('app_video_interview_mans');
		$this->logininfo = F::logininfo("enterp");
		$this->resume = Load::model('resume');
		$this->mem = Load::lib('cache','mem');
	}
	
	function indexAction(){
		$eid = $this->logininfo['uid'];
		//1 验证该企业是否已成功申请该时间段的视频面试室		
		$goin = array();
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
		if(!($room = $this->mem->get($cachekey1))){
			$room = $this->vodroom->fetchRow("cid=".$eid." AND starttime <= ".($nowtime+1200)." AND endtime > ".$nowtime);
			
			if(empty($room)){
				$this->showmsg('抱歉，您还没有申请该时间段内的视频面试室。',BASE_URL."/enterp/resume/downlist.html");
			}
			
			if($room['status']!=1){
				$this->showmsg('抱歉，您申请视频面试室还未通过审核，您可以联系管理员解决。',BASE_URL."/enterp/resume/alist.html");
			}

			$room['ename'] = $this->logininfo['company'];
			$this->mem->set($cachekey1,$room,($room['endtime']-$nowtime));
		}
		if($room['intstart']==0){
			$this->vodroom->update(array('id'=>$room['id'],'intstart'=>$nowtime));
		}
		//获取受邀面试者列表
		$cachekey2 = 'interview_intusers_eid_'.$eid.'_date_'.$intdate;
		if(!($intusers = $this->mem->get($cachekey2))){
			$jobintmodel = Load::model('myjob_int');
			$introws = $jobintmodel->fetchAll("eid=".$eid." AND status=1 AND interview_date>=".($room['starttime']-1200)." AND interview_date<=".$room['endtime'],'interview_date ASC');
			if(empty($introws)){
				$this->showmsg('抱歉，您还未邀请任何面试者。',BASE_URL."/enterp/resume/downlist.html");
			}
			foreach($introws as $u){
				$u['uname'] = $this->resume->getUname($u['uid']);
				$u['gender'] = $u['gender']==2 ? 'woman' : 'men';
				$u['online'] = 'off';
				$u['mszt'] = '';
				$intusers[$u['uid']] = $u;
			}
			$this->mem->set($cachekey2,$intusers,($room['endtime']-$nowtime));
		}

		$curow = $this->vodroomhold->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND status>0");
		$intnum = count($curow);
		$uname = $resumeTxt = '';
		if($intnum>0 && $curow['uid']>0){
			$uid = $curow['uid'];
			//判断该用户是否离开房间
			if($curow['lastactivetime']<($nowtime-30)){
				//该用户已经离开房间
				$this->vodroomhold->update(array('id'=>$curow['id'],'status'=>0));
				$intnum = 0;
			}else{
				$resume = $this->resume->fetchRow(" rtype='cn' and uid = ".$uid);
				if(!$resume){
					$resume = $this->resume->fetchRow(" rtype='en' and uid = ".$uid );
				}
				$areamodel = Load::model('area');
				$uname = $resume['uname'];
				$resumeTxt = $resume['uname']."：".($resume['gender']==1 ? '男' : '女')."，出生于".$resume['birth_year']."年".$resume['birth_month']."月，现居住于".$areamodel->getNameByIds($resume['live_gnd'])."，手机：".$resume['phone']."，Email：".$resume['email']."，自我评价：".$resume['introduction'];
			}
		}else{
			$intnum = 0;
		}

		$this->assign('roominfo',$room);
		$this->assign('uid','e'.$eid);
		$this->assign('roleid',1);
		$this->assign('intnum',$intnum);
		$this->assign('userid',$uid);
		$this->assign('uname',$uname);
		$this->assign('resumeTxt',$resumeTxt);
		$this->assign('roomid',$room['id']);
		$this->assign('room',$room['room']);
		$this->assign('user',$room['ename'] ? $room['ename'] : '人力经理');
		$this->assign('pagetitle','在线视频面试大厅');
		$this->display();
	}

	function overAction()
	{
		$id = (int)$this->_get('id',0);
		$eid = $this->logininfo['uid'];
		$nowtime = time();
		$intdate = (int)date("Ymd");
		if($id>0){
			$this->vodroom->update(array('id'=>$id,'intend'=>$nowtime));
			$this->vodroomhold->update(array('intend'=>$nowtime),"roomid=".$id);
		}else{
			$room = $this->vodroom->fetchRow("cid=".$eid." AND intdate='{$intdate}' AND intend=0 AND intstart>0");
			$id = $room['id'];
			$this->vodroom->update(array('id'=>$id,'intend'=>$nowtime));
			$this->vodroomhold->update(array('intend'=>$nowtime),"roomid=".$id." AND intend=0");
		}
		$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
		$this->mem->remove($cachekey1);
		$this->showmsg("本次面试已成功结束，感谢您使用视一视面试大厅。");
	}
}
?>