<?php

class ajax_Controller extends Controller{

	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->mem = Load::lib('cache','mem');
		$this->mtsms = Load::model('mtsms');
	}

	function vodnext(){
		$roomid = (int)$this->_get('roomid',0);
		$nowtime = time();
		$st = 'fail';
		if($roomid>0){
			$vodroomholdmodel = Load::model('app_video_interview_mans');
			$vodroomholdmodel->update(array('status'=>0,'intend'=>$nowtime),"roomid=".$roomid." AND status > 0");
			$st = 'success';
		}
		$this->ajaxmsg($st);
	}

	function intlistAction(){
		$eid = $this->logininfo['uid'];
		$goin = array();
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
		if(!($room = $this->mem->get($cachekey1))){
			$this->ajaxmsg("over");
		}
		$cachekey2 = 'interview_intusers_eid_'.$eid.'_date_'.$intdate;
		if(!($intusers = $this->mem->get($cachekey2))){
			$this->ajaxmsg("over");
		}
		$vodroomholdmodel = Load::model('app_video_interview_mans');
		//读取已经进入房间排队的面试者
		$rows = $vodroomholdmodel->fetchAll("roomid=".$room['id']." AND intdate='".$intdate."' AND lastactivetime > ".($nowtime-30),'logintime ASC');
		$mszts = array('-1'=>'over','0'=>'start','1'=>'ing','2'=>'yqing');
		foreach($rows as $key=>$row){  
			$intusers[$row['uid']]['online'] = 'on';
			$intusers[$row['uid']]['mszt'] = $row['intend']>0 ? 'over' : $mszts[$row['status']];//$row['intend']>0 ? 'over' : ($row['status']==1&&$row['intstart']>0 ? 'ing' : 'start');
			$goin[$row['uid']] = $intusers[$row['uid']];
			unset($intusers[$row['uid']]);
		}
		$goin = array_merge($goin,$intusers);
		$html = '';
		foreach($goin as $iu){
			$html .= '<li><img src="'.BASE_URL.'/images/ms'.$iu['gender'].$iu['online'].'.jpg" align="absmiddle" /> <a href="'.BASE_URL.'/enterp/resume/view.html?uid='.$iu['uid'].'" target="_blank">'.$iu['uname'].'</a>'.($iu['online']=='on' ? ' <img src="'.BASE_URL.'/images/ms'.$iu['mszt'].'.jpg"'.($iu['mszt']=='start' ? 'onclick="intStart('.$iu['uid'].');" style="cursor:pointer;"' : '').' align="absmiddle" />' : '').'</li>';
		}
		$this->ajaxmsg($html);
	}

	function intstartAction(){
		$eid = $this->logininfo['uid'];
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$uid = (int)$this->_get('uid',0);
		$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
		if(!($room = $this->mem->get($cachekey1))){
			$this->ajaxmsg("over");
		}
		$ing = (int)$this->_get('ing',0);
		$int = (int)$this->_get('int',0);
		$vodroomholdmodel = Load::model('app_video_interview_mans');
		$row = array();
		if($ing<=0){
			//获取当前面试者
			$row = $vodroomholdmodel->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND status=1");
			if(!empty($row)){
				$this->ajaxmsg("warn1");
			}
		}else{
			$vodroomholdmodel->update(array('intend'=>$nowtime,'status'=>-1),"roomid=".$room['id']." AND intdate='".$intdate."' AND status=1");
		}
		if($int<=0){
			//获取当前已邀请的面试者
			$row = $vodroomholdmodel->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND status=2");
			if(!empty($row)){
				$this->ajaxmsg("warn2");
			}
		}else{
			$vodroomholdmodel->update(array('status'=>0),"roomid=".$room['id']." AND intdate='".$intdate."' AND status=2");
		}

		if($uid<=0){
			//获取第一位进入房间的面试者
			$row = $vodroomholdmodel->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND status=0",'logintime ASC');
		}else{
			$row = $vodroomholdmodel->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND uid=".$uid);
		}

		if(empty($row)){
			$this->ajaxmsg("none");
		}

		if($row['intend']>0){
			$this->ajaxmsg("msover");
		}
		$resumemodel = Load::model('resume');
		if($row['status']==0){
			$vodroomholdmodel->update(array('status'=>-1,'intend'=>$nowtime),"roomid=".$room['id']." AND status > 0");
			//发出邀请
			$vodroomholdmodel->update(array('id'=>$row['id'],'status'=>2));
		}
		$resume = $resumemodel->fetchRow(" rtype='cn' and uid = ".$row['uid'] );
		if(!$resume){
			$resume = $resumemodel->fetchRow(" rtype='en' and uid = ".$row['uid'] );
		}
		$areamodel = Load::model('area');
		$uname = $resume['uname'];
		$resumeTxt = $resume['uname']."：".($resume['gender']==1 ? '男' : '女')."，出生于".$resume['birth_year']."年".$resume['birth_month']."月，现居住于".$areamodel->getNameByIds($resume['live_gnd'])."，手机：".$resume['phone']."，Email：".$resume['email']."，自我评价：".$resume['introduction'];
		$this->ajaxmsg($uname."|:::|".$resumeTxt."|:::|".$row['uid']);
	}

	function curuserAction(){
		$eid = $this->logininfo['uid'];
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$uid = (int)$this->_get('uid',0);
		$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
		if(!($room = $this->mem->get($cachekey1))){
			$this->ajaxmsg("over");
		}
		$vodroomholdmodel = Load::model('app_video_interview_mans');
		$row = $vodroomholdmodel->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND uid=".$uid);
		if($row['status']==-1){
			$this->ajaxmsg('over');
		}
	}

	function yqldAction(){
		$eid = $this->logininfo['uid'];
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
		if(!($room = $this->mem->get($cachekey1))){
			$this->ajaxmsg("over");
		}
		$phone = trim($this->_get('mobile'));
		$leadermodel = Load::model('leader');
		//验证
		$check = $leadermodel->fetchRow("eid=".$eid." AND roomid=".$room['id']." AND room='".$room['room']."'");
		$had = false;
		if($check&&$check['id']<0){
			if($check['phone']==$phone){
				$had = true;
				$id = $check['id'];
				$passwd = $check['passwd'];
			}else{
				$this->ajaxmsg('had');
			}
		}
		if(!$had){
			$passwd = F::getRandomstr(6,'number');
			$linfo = array('eid'=>$eid,'roomid'=>$room['id'],'room'=>$room['room'],'phone'=>$phone,'startdate'=>$room['starttime'],'enddate'=>$room['endtime'],'passwd'=>$passwd);
			$id = $leadermodel->save($linfo);
		}
		$str = "您好，请您于".date("m-d H:i",$room['starttime'])."登录".str_replace('http://','',BASE_URL.'/i/'.$id)."，密码:".$passwd;
		/*
		$str = iconv('UTF-8','GBK',$str);
		$str = urlencode($str);
		$content = file_get_contents('http://3tong.cn:8082/ema_new/http/SendSms?Account=88010110&Password=cbff36039c3d0212b3e34c23dcde1456&SubCode=&Phone='.$phone.'&Content='.$str);
		*/
		$content = $this->mtsms->send($phone,$str);
		//$content = $this->mtsms->httpsend($phone,$str);
		//短信接口 发送短信 目前没有
		$this->ajaxmsg('success');
	}
}
?>