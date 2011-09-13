<?php

class ajax_Controller extends Controller{

	function init(){
		if(!(F::islogin())){
			$this->ajaxmsg('');
		}
		$this->uid = $this->logininfo['uid'];
		$this->mem = Load::lib('cache','mem');
	}

	function getholdnumAction(){
		$roomids = $this->_get('roomids');
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$html = array();
		if($roomids){
			$roomids = explode(":",$roomids);
			$vodroom = Load::model('app_video_interview');
			$vodroomhold = Load::model('app_video_interview_mans');
			foreach($roomids as $roomid){
				$row = $vodroomhold->fetchRow("roomid=".$roomid." AND uid=".$this->uid." AND intdate=".$intdate);
				if(!$row){
					continue;
				}elseif($row['status']==-1){
					$html[] = $roomid.'|over';
				}elseif($row['status']==1){
					$html[] = $roomid.'|ing';
				}elseif($row['status']==2){
					$html[] = $roomid.'|yqing';
				}else{
					$cachekey = 'roomstatus_'.$roomid;
					if(!($roomstatus = $this->mem->get($cachekey))){
						$room = $vodroom->find($roomid);
						if($room['intstart']>0){
							$roomstatus = '已开始';
						}else{
							$roomstatus = '未开始';
						}
						$this->mem->set($cachekey,$roomstatus,($room['endtime']-$nowtime));
					}
					$holdnum = $vodroomhold->count("roomid=".$roomid." AND status=0 AND intdate=".$intdate." AND logintime<".$row['logintime']);
					$html[] = $roomid.'|'.$holdnum.'|'.$roomstatus;
				}
				$vodroomhold->update(array('id'=>$row['id'],'lastactivetime'=>$nowtime));
			}
		}
		$this->ajaxmsg(implode(":",$html));
	}

	function startintAction(){
		$roomid = (int)$this->_get('roomid',0);
		if($roomid<=0)return '';
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$vodroomhold = Load::model('app_video_interview_mans');
		$vodroomhold->update(array('intstart'=>$nowtime,'status'=>1),"roomid=".$roomid." AND intdate=".$intdate." AND uid=".$this->uid);
		$this->ajaxmsg('success');
	}

	function cancelintAction(){
		$roomid = (int)$this->_get('roomid',0);
		if($roomid<=0)return '';
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$vodroomhold = Load::model('app_video_interview_mans');
		$vodroomhold->update(array('logintime'=>$nowtime,'lastactivetime'=>$nowtime,'status'=>0),"roomid=".$roomid." AND intdate=".$intdate." AND status=2 AND uid=".$this->uid);
		$this->ajaxmsg('success');
	}

	function endintAction(){
		$roomid = (int)$this->_get('roomid',0);
		if($roomid<=0)return '';
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$vodroomhold = Load::model('app_video_interview_mans');
		$vodroomhold->update(array('intend'=>$nowtime,'status'=>'-1'),"roomid=".$roomid." AND intdate=".$intdate." AND uid=".$this->uid);
		$this->ajaxmsg('success');
	}

	function curuserAction(){
		$roomid = (int)$this->_get('roomid',0);
		if($roomid<=0)$this->ajaxmsg('over');
		$intdate = (int)date("Ymd");
		$vodroomholdmodel = Load::model('app_video_interview_mans');
		$row = $vodroomholdmodel->fetchRow("roomid=".$roomid." AND intdate='".$intdate."' AND uid=".$this->uid);
		if($row['status']==-1){
			$this->ajaxmsg('over');
		}
	}
}
?>