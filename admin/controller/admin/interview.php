<?php

class interview_Controller extends Controller{
	function init(){
		$this->app_video_interview = Load::model('app_video_interview');
		$this->app_person_interview = Load::model('app_person_interview');
		$this->e_user = Load::model('e_user');
		$this->myjob_int = Load::model('myjob_int');
		$this->resume = Load::model('resume');
		$this->mtsms = Load::model('mtsms');
		$this->conf = Load::conf('conf');
		$this->vodrooms = $this->conf['vodrooms'];
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$status = $this->_get('s',0);
		$all = $this->_get('a',1);
		//$arows = $this->app_video_interview->fetchAll(' starttime > '.time()." and status = ".intval($status)." ");
		if($all){
			$url = $this->getPageUrl().'/list.do?s='.$status."&a=".$all;
			$wheres = " status = ".intval($status);
			$orderby = 'createtime desc';
		}else{
			$url = $this->getPageUrl().'/list.do?s='.$status;
			$wheres = ' starttime > '.time()." and status = ".intval($status);
			$orderby = 'createtime desc';
		}
		$page = $this->_get('page',1);
		$rows = $this->app_video_interview->pageAll($page, 50, $url,$wheres,$orderby);
		if($rows){
			foreach($rows as $key => $val){
				$user = $this->e_user->find($val['cid']);
				$rows[$key]['company'] = $user['company'];
				$myjob_int = $this->myjob_int->fetchAll(" aid = ".$val['id']." and interview_type=2 and eid = ".$val['cid']);
				$rows[$key]['uname'] = '';
				$tmp = array();
				foreach($myjob_int as $k => $v){
					$resume = $this->resume->fetchRow('uid='.$v['uid']);
					if(!in_array($resume['uname'],$tmp)){
						$rows[$key]['uname'] .= " ".$resume['uname'];
						$tmp[] = $resume['uname'];
					}
				}
				$rows[$key]['hours'] = ceil(($val['endtime']-$val['starttime'])/3600);
			}
		}
		$this->assign('page',$page);
		$this->assign('s',$status);
		$this->assign('rows', $rows);
		$this->assign('url', $url);
		$this->assign('turl',$url.'&page='.$page);
		$this->display('interview_list.tpl');
	}

	function editAction(){
		//error_reporting(E_ALL);
		$ids = $this->_get('ids');
		$status = intval($this->_get('status'));
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
						$this->showmsg('无空闲房间，不能通过申请','list.do');
					}
				}else{
					$info['room'] = "";
					$info['nopasstime'] = date("Y-m-d H:i:s");
				}
				//print_r($info);exit;
				$this->app_video_interview->save($info);
			}
		}
		$this->showmsg('操作成功','list.do');
		//$this->wajaxmsg('操作成功',1);
	}

	function delAction(){
		$ids = $this->_get('ids');
		if(!is_array($ids)){
			$x[] = intval($ids);
			$ids = $x;
		}
		if($ids){
			foreach($ids as $key => $val){
				$info = $this->app_video_interview->find(intval($val));
				$info['status'] = 2;
				$this->app_video_interview->save($info);
			}
		}
		//$this->showmsg('操作成功','list.do');
		$this->wajaxmsg('操作成功',1);
	}

	function initleaderAction(){
		$nowtime = time();
		$intdate = (int)date("Ymd");
		//$this->vodrooms
		$phone = trim($this->_get('mobile'));
		$aid = intval($this->_get('aid'));
		if($phone=='' || $aid==0){
			$this->ajaxmsg('error');
		}

		$info = $this->app_video_interview->find(intval($aid));
		if(!isset($info)){
			$this->ajaxmsg('error');
		}

		$leadermodel = Load::model('leader');
		//验证
		$check = $leadermodel->fetchRow("eid=".$info['cid']." AND roomid=".$info['id']." AND room='".$info['room']."'");
		$had = false;
		if($check&&$check['id']>0){
			if($check['phone']==$phone){
				$had = true;
				$id = $check['id'];
				$passwd = $check['passwd'];
			}else{
				$check['phone']=$phone;
				$passwd = $check['passwd'] = F::getRandomstr(6,'number');
				$id = $check['id'];
				$leadermodel->save($check);
				$this->ajaxmsg('had');
			}
		}
		if(!$had){
			$passwd = F::getRandomstr(6,'number');
			$llinfo = array('eid'=>$eid,'roomid'=>$room['info'],'room'=>$info['room'],'phone'=>$phone,'startdate'=>$info['starttime'],'enddate'=>$info['endtime'],'passwd'=>$passwd);
			$id = $leadermodel->save($llinfo);
		}
		$str = "您好，请您于".date("m-d H:i",$room['starttime'])."登录".str_replace('http://','',BASE_URL.'/i/'.$id)."，密码:".$passwd;
		//发短信
		$content = $this->mtsms->send($phone,$str);
		//$content = $this->mtsms->httpsend($resume['phone'],$str);
		//短信接口 发送短信 目前没有
		$this->ajaxmsg('success');
	}

	function addleaderAction(){
		error_reporting(E_ALL);
		$aid = intval($this->_get('aid'));
		$info = $this->app_video_interview->find(intval($aid));
		if(!isset($info['id'])){
			$this->wajaxmsg('非法操作',1);
		}
		$this->assign('aid', $aid);
		$this->display('addleader.tpl');
	}
}
?>