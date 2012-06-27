<?php
//企业面试
class send_interview_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
		$this->myjob_int = Load::model('myjob_int');
		$this->app_video_interview = Load::model('app_video_interview');
		$this->app_person_interview = Load::model('app_person_interview');
		$this->resume = Load::model('resume');
		$this->resume_tmp = Load::model('resume_tmp');
		$this->e_user = Load::model('e_user');
		$this->jobs = Load::model('jobs');
		$this->resume_box = Load::model('resume_box');
		$this->resume_download = Load::model('resume_download');
		$this->contract = Load::model('contract');
		//uname
		$this->uid = $this->logininfo['uid'];
		$this->conf_db = Load::conf('db');
		$this->dbpre = $this->conf_db['default']['prefix'];
		$this->conf = Load::conf('conf');
		$this->vodrooms = $this->conf['vodrooms'];
		$this->resume = Load::model('resume');
		$this->mtsms = Load::model('mtsms');
	}
	

/*
<li><span class="glogintext">联系人：</span><!--{$e_user.contact}--></li>
<li><span class="glogintext">联系电话：</span><!--{$e_user.tel}--></li>
<li><span class="glogintext">地址：</span>><!--{$e_user.address}--></li>
*/
	function indexAction(){
		//error_reporting(E_ALL);
		$id = $this->_get('id');
		$aid = $this->_get('aid',0);
		if($aid){
			$app = $this->app_video_interview->find($aid);
			if(!isset($app['id'])){
				$aid=0;
			}
			if(isset($app['status']) && $app['status']){
				$aid=0;
			}
		}

		if(!$id){
			$PositionID = $this->_get('interview');
			if($PositionID){
				$PositionID = explode(",",$PositionID);
				$this->assign('interview_arr',$PositionID);
				$id = array();
				if(count($PositionID)>1){
					$str = implode(",",$PositionID);
				}else{
					$str = $PositionID[0];
				}
				$resume_box = $this->resume_download->fetchAll(' cid='.$this->uid.' and id in ('.$str.')');
				foreach($resume_box as $k => $v){
					$id[] = $v['rid'];
				}
			}else{
				$str = $this->_get('str');
				$id = explode(",",$str);
				$this->assign('interview_arr',$id);
			}
		}

		if($id){
			$ids = implode(",",$id);
			$download = $this->resume_download->fetchAll("cid = ".$this->uid." and rid in ( ".$ids.") ");
			if(count($download) == count($id)){
				//$interview = $this->app_video_interview->fetchAll( time().' <= starttime and status = 0 and cid = '.$this->uid);
				$resume = $this->resume->fetchAll(' id in ('.$ids.') ');
				$jobs = $this->jobs->fetchAll(" cid = ".$this->uid);
				$e_user = $this->e_user->find($this->uid);
				for($i=0;$i<24;$i++){
					if($i<10){
						$j = "0".$i;
					}else{
						$j = $i;
					}
					for($x=0;$x<60;$x=$x+15){
						if($x<10){
							$n = "0".$x;
						}else{
							$n = $x;
						}
						$time[] = $j.":".$n;
					}
				}
				if($aid){
//					$tmp = array();
//					foreach($resume as $key => $val){
//						$tmp[] = $val['uid'];
//					}
//					$uids = implode(",",$tmp);
					$pidrows = $this->app_person_interview->fetchAll(' aid = '.$aid.' ');
					foreach($pidrows as $key => $val){
						$pidrows[$key]['startdate_p'] = date('Y-m-d',$val['starttime']);
						$pidrows[$key]['starttime_p'] = date('H:i',$val['starttime']);
						$pidrows[$key]['enddate_p'] = date('Y-m-d',$val['endtime']);
						$pidrows[$key]['endtime_p'] = date('H:i',$val['endtime']);
					}
					$app['startdate'] = date('Y-m-d',$app['starttime']);
					$app['starttime'] = date('H:i',$app['starttime']);
					$app['enddate'] = date('Y-m-d',$app['endtime']);
					$app['endtime'] = date('H:i',$app['endtime']);
					//print_r($pidrows);exit;
					$this->assign('app',$app);
					$this->assign('pidrows',$pidrows);
				}


				//$this->_forward('list');
				$this->assign('resume',$resume);
				$this->assign('e_user',$e_user);
				$this->assign('time',$time);
				$this->assign('jobs',$jobs);
				$this->assign('ids',$ids);
				$this->assign('aid',$aid);
				$this->assign('day',date('Y-m-d'));
				$this->display('send_interview.tpl');
			}else{
				$this->showmsg("非法操作",BASE_URL."/enterp/resume/downlist.html");
			}
		}else{
			$this->showmsg("非法操作",BASE_URL."/enterp/resume/downlist.html");
		}
	}

	//copied from admin/interview.php then modified it
	function edit2Action($ids, $status=1){
		if(!is_array($ids)){
			$x[] = intval($ids);
			$ids = $x;
		}
		if($ids){
			foreach($ids as $key => $val){
				$info = $this->app_video_interview->find(intval($val));
				$info['status'] = $status;
				if($status == 1){
					$okrooms = array();
					//验证是否还有空闲房间
					$arows = $this->app_video_interview->fetchAll($info['endtime'].' > starttime and endtime > '.$info['starttime']." and status = 1 ");
					if(!empty($arows)){
						foreach($arows as $ar){
							$okrooms[] = $ar['room'];
						}
					}
					if($okrooms){
						$vodrooms = array_diff($this->vodrooms,$okrooms);
					}else{
						$vodrooms = $this->vodrooms;
					}
					//print_r($vodrooms);
					if(!empty($vodrooms)){
						$info['room'] = array_pop($vodrooms);
						$info['passtime'] = date("Y-m-d H:i:s");
						$person = $this->app_person_interview->fetchAll(' aid = '.$info['id']);
						foreach($person as $k => $v){
							$app_video_interview = $this->app_video_interview->fetchRow('id='.$v['aid']);
							$e_user = $this->e_user->fetchRow('id='.$app_video_interview['cid']);
							$str = $e_user['company']."邀请您 ".date('Y-m-d H:i',$v['starttime']).'至'.date('Y-m-d H:i',$v['endtime']).'参加在线面试 http://www.shiyishi.cn/';
							$resume = $this->resume->fetchRow('uid='.$v['uid']);
							/*
							$str = iconv('UTF-8','GBK',$str);
							$str = urlencode($str);
							$content = file_get_contents('http://3tong.cn:8082/ema_new/http/SendSms?Account=88010110&Password=cbff36039c3d0212b3e34c23dcde1456&SubCode=&Phone='.$resume['phone'].'&Content='.$str);
							if($content!=''){
								$v['status'] = 1;
								$this->app_person_interview->save($v);
							}
							*/
							
							//发短信
							$content = $this->mtsms->send($resume['phone'],$str);
							//$content = $this->mtsms->httpsend($resume['phone'],$str);
							$v['status'] = 1;
							$this->app_person_interview->save($v);
							$myjobint = Load::model('myjob_int');
							$myjobint->update(array('status'=>1),'aid='.$info['id']);
							//发邮件
							$m = Load::model('smtp');
							$m->sendmail('invite',array('username'=>$resume['uname'],'email'=>$resume['email'],'datetime'=>date('Y-m-d H:i:s',$v['starttime']).'至'.date('Y-m-d H:i:s',$v['endtime']),'company'=>$e_user['company']));
						}
					}else{
						//$this->showmsg('无空闲房间，不能通过申请','list.do');
						return false;
					}
				}else{
					$info['room'] = "";
					$info['nopasstime'] = date("Y-m-d H:i:s");
				}
				//print_r($info);exit;
				$this->app_video_interview->save($info);
			}
		}
		//$this->showmsg('操作成功','list.do');
		return true;
		//$this->wajaxmsg('操作成功',1);
	}
	
	function saveAction(){
		//error_reporting(E_ALL);
		$info = $this->_get('info');
		$jobid = $info['jobid'];
		$starttime = $this->_get('starttime');
		$endtime = $this->_get('endtime');
		$startdate = $this->_get('startdate');
		$enddate = $this->_get('enddate');
		$info['interview_date'] = strtotime($startdate." ".$starttime);
		$interview['starttime'] = strtotime($startdate." ".$starttime.":00");
		$interview['endtime'] = strtotime($enddate." ".$endtime.":00");
		$info['interview_enddate'] = $interview['endtime'];
		//计算费用不足一小时按1小时算，1小时100积分
		$needPoint = ceil(($interview['endtime'] - $interview['starttime']) / 3600) * 100;
		$leftPoint = 0;
		$contract = $this->contract->fetchAll(" uid = ".$this->uid." and enddate >= ".time(), " enddate asc");
		foreach($contract as $item)
		{
			$leftPoint += $item['word'];
		}

		if ($leftPoint < $needPoint)
		{
			$str = "积分不足，请购买!";
			$this->showmsg($str,BASE_URL."/enterp/resume/downlist.html");
		}			

		if($interview['endtime'] > $interview['starttime']){
			$interview['cid'] = $this->uid;
			$interview['status'] = 0;
			$aid = intval($this->_get('aid',0));
			if(!$aid){
				//$interview['createtime'] = '';
				$s = $this->app_video_interview->fetchRow( $interview['starttime'].' > starttime and endtime > '.$interview['starttime']." and status < 2  and cid = ".$interview['cid']);
				$e = $this->app_video_interview->fetchRow( $interview['endtime'].' > starttime and endtime > '.$interview['endtime']." and status < 2 and cid = ".$interview['cid']);
				$o = $this->app_video_interview->fetchRow( $interview['endtime'].' > endtime and starttime > '.$interview['starttime']." and status < 2 and cid = ".$interview['cid']);
	//			echo $interview['starttime'].' > starttime and endtime > '.$interview['starttime']." and status = 1 and cid = ".$interview['cid'];echo"|";
	//			echo $interview['endtime'].' > starttime and endtime > '.$interview['endtime']." and status = 1 and cid = ".$interview['cid'];echo"|";
	//			echo $interview['endtime'].' > endtime and starttime > '.$interview['starttime']." and status = 1 and cid = ".$interview['cid'];
	//			exit;
			}
			if($s || $e || $o){
				$str = "该时间段您已经申请";
				$this->showmsg($str,BASE_URL."/enterp/resume/downlist.html");
			}else{
				if($aid){
					$app = $this->app_video_interview->find($aid);
					if(!isset($app['id'])){
						$aid=0;
					}
					if(isset($app['status']) && $app['status']){
						$aid=0;
					}
				}
				$okrooms = array();
				//验证是否还有空闲房间
				$arows = $this->app_video_interview->fetchAll($interview['endtime'].' > starttime and endtime > '.$interview['starttime']." and status = 1 ");
				if(!empty($arows)){
					foreach($arows as $ar){
						$okrooms[] = $ar['room'];
					}
				}
				if($okrooms){
					$vodrooms = array_diff($this->vodrooms,$okrooms);
				}else{
					$vodrooms = $this->vodrooms;
				}
				//print_r($vodrooms);exit;

				if(!empty($vodrooms)){
					//$info['room'] = $vodrooms[0];
					$interview['room'] = "";
					if($aid){
						$interview['id'] = $aid;
					}
					//print_r($interview);exit;
					if(($aid=$this->app_video_interview->save($interview)) === false){
						$this->showmsg($this->user->getError(),1);
					}
					$video_interview_id=$aid;
					$pidrows = array();
					if(isset($interview['id'])){
						$aid = $interview['id'];
						$pidrows = $this->app_person_interview->fetchAll(' aid = '.intval($aid));
//						foreach($pidrows as $key => $val){
//							$this->app_person_interview->remove($val['id']);
//						}
						$query = "delete from ".$this->dbpre."app_person_interview  where aid= ".$aid." ";
						$this->resume->queryAll($query);
						$query = "delete from ".$this->dbpre."myjob_int  where aid= ".$aid." and eid = ".$this->uid." ";
						$this->resume->queryAll($query);
					}
					

					$gender = substr($info['gender'] ,0,-1);
					$genders = explode(',',$gender);
					$uid = $this->_get('uid','');
					$uid = substr($info['uid'],0,-1);
					$uids = explode(',',$uid);
					$starttime_p = $this->_get('starttime_p');
					$endtime_p = $this->_get('endtime_p');
					$startdate_p = $this->_get('startdate_p');
					$enddate_p = $this->_get('enddate_p');
					//print_r($starttime_p);print_r($endtime_p);
					foreach($uids as $k => $v){
						$info['uid'] = $uids[$k];
						$info['aid'] = $aid;
						$info['status'] = -1;
						$info['gender'] = $genders[$k];
						$info['interview_date'] = strtotime($startdate_p[$k]." ".$starttime_p[$k].":00");
						$info['interview_enddate'] = strtotime($enddate_p[$k]." ".$endtime_p[$k].":00");
						$info['jobid'] = $jobid[$k];
						if(($uid = $this->myjob_int->save($info)) === false){
							$this->showmsg($this->myjob_int->getError(),1);
						}
						if($aid){
								$ainfo['starttime'] = strtotime($startdate_p[$k]." ".$starttime_p[$k].":00");
								$ainfo['endtime'] = strtotime($enddate_p[$k]." ".$endtime_p[$k].":00");
								if($ainfo['starttime']<$interview['starttime'] || $ainfo['starttime']>$interview['endtime']){
									$ainfo['starttime'] = $interview['starttime'];
								}
								if($ainfo['endtime']<$interview['starttime'] || $ainfo['endtime']>$interview['endtime']){
									$ainfo['endtime'] = $interview['endtime'];
								}
								$ainfo['uid'] = $uids[$k];
								$ainfo['aid'] = $aid;
								if(($pid = $this->app_person_interview->save($ainfo)) === false){
								$this->showmsg($this->app_person_interview->getError(),1);
							}
						}
					}
					//扣除积分
					$executePoint = 0;
					$i = 0;
					while ($executePoint < $needPoint)
					{
						$curContract = $contract[$i++];
						if ($curContract['word'] >= $needPoint)
						{
							$curContract['word'] = $curContract['word']-$needPoint;
							$this->contract->save($curContract);
							break;							
						}
						else {
								$needPoint -= $curContract['word'];								
								$curContract['word'] = 0;								
								$this->contract->save($curContract);						
						}
					}
					$str = "预约成功！";
					$this->edit2Action($video_interview_id, 1);
				}else{
					$str = "该时间段已无空闲视频房间";
				}
				$this->showmsg($str,BASE_URL."/enterp/resume/downlist.html");
			}
		}else{
			$str = "内容填写错误";
			$this->showmsg($str,BASE_URL."/enterp/resume/downlist.html");
		}
	}

	function editAction(){
		$id = intval($this->_get('id',0));
		if($id){
			$myjob_int = $this->myjob_int->fetchRow(' eid = '.$this->uid." and id=".$id);
			if(isset($myjob_int['id']) && $myjob_int['id']){
				$interview = $this->app_video_interview->fetchAll( time().' >= starttime and endtime > '.time()." and status = 1 and cid = ".$this->uid);
				$resume = $this->resume->fetchAll(' uid = '.$myjob_int['uid']);
				$jobs = $this->jobs->fetchAll(" cid = ".$this->uid);
				$e_user = $this->e_user->find($this->uid);
				for($i=0;$i<24;$i++){
					if($i<10){
						$j = "0".$i;
					}else{
						$j = $i;
					}
					for($x=0;$x<60;$x=$x+15){
						if($x<10){
							$n = "0".$x;
						}else{
							$n = $x;
						}
						$time[] = $j.":".$n;
					}
				}
				//$this->_forward('list');
				$this->assign('resume',$resume);
				$this->assign('e_user',$e_user);
				$this->assign('time',$time);
				$this->assign('jobs',$jobs);
				$this->assign('info',$myjob_int);
				$this->assign('interview',$interview);
				$this->assign('startdate',date("Y-m-d",$myjob_int['interview_date']));
				$this->assign('starttime',date("H:i",$myjob_int['interview_date']));
				$this->display('send_interview.tpl');
			}else{
				$this->showmsg("非法操作",BASE_URL."/enterp/resume/downlist.html");
			}
		}else{
			$this->showmsg("非法操作",BASE_URL."/enterp/resume/downlist.html");
		}
	}

	function listAction(){
		if(isset($_GET['s'])){
			$status = intval($_GET['s']);
		}else{
			$status = 1;
		}
		$page = intval($this->_get('page',1));
		$url = $this->getPageUrl().'/list.html?s='.$status;
		$orderby = " invite_date desc ";
		$where .= "  m.status = ".$status." and m.eid = ".$this->uid ;
		$sql = "select m.*,r.uname,r.gender,j.title from ".$this->dbpre."myjob_int m
		left join ".$this->dbpre."resume r on m.uid=r.uid
		left join ".$this->dbpre."jobs j on m.jobid=j.id
		where ".$where." order by ".$orderby;
		$total = count($this->resume_tmp->queryAll($sql));
		$n=25;
		$sql .= " limit ".(($page-1)*$n).", ".$n." ";
		$rows = $this->resume_tmp->queryAll($sql);

		$totalpage = @ceil($total / $n);
		$this->assign('totalpage',$totalpage);
		$this->assign('url',$url);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('s',$status);
		$this->assign('send_interview',$rows);
		$this->display('send_interview_list.tpl');
	}

	function delAction(){
		$PositionID = $this->_get('PositionID',0);
		$table = "myjob_int";
		if($PositionID){
			if(is_array($PositionID)){
				$ids=implode(",",$PositionID);
				$sql="update ".$this->dbpre.$table." set  status=0 where  id in (".$ids.") ";
				$rows = $this->resume_tmp->queryAll($sql);
			}else{
				$sql="update ".$this->dbpre.$table." set  status=0 where  id=".$PositionID." ";
				$rows = $this->resume_tmp->queryAll($sql);
			}
			$this->showmsg("操作成功",BASE_URL."/enterp/send_interview/list.html");
		}else{
			$this->showmsg("非法操作",BASE_URL."/enterp/send_interview/list.html");
		}
	}

	function passAction(){
		$PositionID = $this->_get('PositionID',0);
		$table = "myjob_int";
		if($PositionID){
			if(is_array($PositionID)){
				$ids=implode(",",$PositionID);
				$sql="update ".$this->dbpre.$table." set  status=1 where  id in (".$ids.") ";
				$rows = $this->resume_tmp->queryAll($sql);
			}else{
				$sql="update ".$this->dbpre.$table." set  status=1 where  id=".$PositionID." ";
				$rows = $this->resume_tmp->queryAll($sql);
			}
			$this->showmsg("操作成功",BASE_URL."/enterp/send_interview/list.html");
		}else{
			$this->showmsg("非法操作",BASE_URL."/enterp/send_interview/list.html");
		}
	}

	function videolistAction(){
		$url = $this->getPageUrl().'/list.html';
		$orderby = " invite_date desc ";
		$where .= "  m.status = 1 and m.eid = ".$this->uid ;
		$sql = "select m.*,r.uname,r.gender,j.title from ".$this->dbpre."myjob_int m
		left join ".$this->dbpre."resume r on m.uid=r.uid
		left join ".$this->dbpre."jobs j on m.jobid=j.id
		where ".$where." order by ".$orderby;
		$rows = $this->resume_tmp->queryAll($sql);
		$interview = $this->app_video_interview->fetchAll( "  status = 1 and cid = ".$this->uid);
		$tmp = array();
		if($rows){
			foreach($rows as $key => $val){
				foreach($interview as $k => $v){
					//echo APP_DATA_DIR."/vods/".$v['id']."_".$val['id'].".flv";
					if(file_exists(APP_DATA_DIR."/vods/".$v['id']."_".$val['id'].".flv")){
						$val['vid'] = $v['id']."_".$val['id'];
						$tmp[] = $val;
					}
				}
			}
		}
		$this->assign('recode_video',$tmp);
		$this->display('recode_video_list.tpl');

	}

	function videoAction(){
		$id = $this->_get('id','');
		$this->assign('video',$id.".flv");
		$this->assign('video_domain',"http://video.channelwin.info/");
		$this->display('recode_video.tpl');
	}

}
?>
