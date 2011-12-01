<?php
//招聘
class resume_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
//		session_unregister();
//		session_destroy();
		$this->logincheck("enterp");
		$this->funtype=Load::model('funtype');
		$this->resume_box = Load::model('resume_box');
		$this->resume = Load::model('resume');
		$this->major = Load::model('major');
		$this->resume_work = Load::model('resume_work');
		$this->resume_tmp = Load::model('resume_tmp');
		$this->resume_download = Load::model('resume_download');
		$this->resume_ctf = Load::model('resume_ctf');
		$this->resume_it = Load::model('resume_it');
		$this->resume_lang = Load::model('resume_lang');
		$this->resume_edu = Load::model('resume_edu');
		$this->resume_vod = Load::model('resume_vod');
		$this->contract = Load::model('contract');
		$this->admit = Load::model('admit');
		$this->resume_lock = Load::model('resume_lock');

		$this->app_video_interview = Load::model('app_video_interview');
		$this->app_person_interview = Load::model('app_person_interview');
		$this->area = Load::model('area');
		$this->myjob_rviewd = Load::model('myjob_rviewd');
		$this->funtype = Load::model('funtype');
		$this->conf_db = Load::conf('db');
		$this->dbpre = $this->conf_db['default']['prefix'];
		$this->uid = $this->logininfo['uid'];
		$this->conf = Load::conf('conf');
		$this->degrees = $this->conf['degrees'];
		$this->vodrooms = $this->conf['vodrooms'];
		$this->ftdata = $this->cache->getFuntypeDatas('funtype_level1');//一级职位
		$this->dtdata = $this->cache->getDustrytypeDatas('dustrytype_level1');//一级行业
		$this->adata = $this->cache->getAreaDatas('area_province');//省份
		$this->languages = $this->conf['languages'];
		$this->companytypes = $this->conf['companytypes'];
	}
	
	function indexAction(){
		$this->_forward('boxlist');
	}

	function boxlistAction(){
		$page = $this->_get('page',1);
		$days = $this->_get('days',0);
		$startdate = $this->_get('startdate','');
		$enddate = $this->_get('enddate','');
		$keyword = $this->_get('key','');

		$keyword = htmlspecialchars($keyword, ENT_QUOTES);

		$url = $this->getPageUrl().'/boxlist.html';
		
		$urls = array();
		$orderby = " posttime asc ";
		$where = " b.cid = ".$this->uid." and b.status = 1" ;
		if($days == 3){
			$where .= "  and b.posttime >= ".strtotime("-3 day");
		}else if($days == 7){
			$where .= "  and b.posttime >= ".strtotime("-7 day");
		}else if($days == 14){
			$where .= "  and b.posttime >= ".strtotime("-2 week");
		}else if($days == 30){
			$where .= "  and b.posttime >= ".strtotime("-1 month");
		}else{

		}
		if($days)
			$urls[] = "days=".$days;
		
		if($startdate){
			$where .= " b.posttime >= ".strtotime($startdate);
			$urls[] = "startdate=".$startdate;
		}
		if($enddate){
			$where .= " b.posttime <= ".strtotime($enddate);
			$urls[] = "enddate=".$enddate;
		}

		$where_f = "";
		if($keyword){
			$sql="select id,parent_id  from ".$this->dbpre."funtype  where  thename like '%".$keyword."%' and parent_id >0 ";
			$rows = $this->resume_box->queryAll($sql);
			if($rows){
				$tmp=array();
				foreach( $rows as $key => $val){
					$tmp[] = $val['parent_id'].",".$val['id'];
				}
				if($tmp){
					if(count($tmp)>1){
						$where_f = " and r.funtype in (".implode(",",$tmp).")";
					}else{
						$where_f = " and r.funtype = ".$tmp[0]." ";
					}
				}
			}
			$urls[] = "key=".$keyword;
		}
		
		
//		$sql = "select r.*,f.thename ,b.posttime,b.id as bid , r.id as rid,j.id as jid from ".$this->dbpre."resume_box b 
//		left join ".$this->dbpre."resume r on r.id = b.rid 
//		left join ".$this->dbpre."jobs j on j.id = b.jid ". $where_f."
//		left join ".$this->dbpre."funtype f on f.id = j.funtype_2 
//		where ".$where." order by ".$orderby;
//
//		$rowall = $this->resume_box->queryAll($sql);
//		$total = count($rowall);
//		$rows=array();
//		if($rowall){
//			for( $i=($page-1)*25;$i<$page*25;$i++){
//				if(isset($rowall[$i])){
//					$rowall[$i]['area'] = $this->area->getNameByIds($rowall[$i]['live_gnd']);
//					$rowall[$i]['age'] = date("Y") - $rowall[$i]['birth_year'];
//					$rows[] = $rowall[$i];
//				}
//			}
//		}

		$subftdatasall = $this->cache->getFuntypeDatas('funtype_level2');
		$subdtdatasall = $this->cache->getFuntypeDatas('dustrytype_level2');
		$subftdatasall1 = $this->cache->getFuntypeDatas('funtype_level1');
		$subdtdatasall1 = $this->cache->getFuntypeDatas('dustrytype_level1');
		$aldatasall = $this->cache->getAreaDatas('area_citys');

		$down = $this->resume_download->fetchAll(" cid =".$this->uid." and status = 1 ");
		$tmp=array();
		foreach($down as $key => $val){
			$tmp[] = $val['rid'];
		}
		$dids = implode(",",$tmp);

		$sql = "select r.*,b.posttime,b.id as bid  from ".$this->dbpre."resume_box b 
		left join ".$this->dbpre."resume r on r.id = b.rid 
		where ".$where." ".($dids?'and b.rid not in('.$dids.')':'')." order by ".$orderby;

		$total = count($this->resume->queryAll($sql));

		$sql .= " limit ".(($page-1)*25).", 25 ";
		$rows = $this->resume->queryAll($sql);
		if($rows){
			foreach($rows as $key => $val){
				$rows[$key]['area'] = $this->area->getNameByIds($val['live_gnd']);
				$tmp = explode(",",$val['live_gnd']);
				$rows[$key]['a2'] = $aldatasall[$tmp[1]];
				$tmp = explode(",",$val['funtype']);
				if($tmp[1]){
					if($subftdatasall[$tmp[0]]){
						foreach($subftdatasall[$tmp[0]] as $k => $v ){
							if($v['id']==$tmp[1])
								$rows[$key]['f2'] = $v['name'];
						}
					}
				}else{
					foreach($subftdatasall1 as $k => $v ){
						if($v['id']==$tmp[0])
							$rows[$key]['f2'] = $v['name'];
					}
				}
				$rows[$key]['age'] = date("Y") - $val['birth_year'];

				$query = "select min(fromdate) as f from ".$this->dbpre."resume_work  
				where uid= ".$val['uid'];
				$re = $this->resume->queryAll($query);
				if($re[0]["f"]){
					$rows[$key]['work'] = date('Y')-date("Y",strtotime($re[0]["f"]));
				}else{
					$rows[$key]['work'] = '无';
				}

				$query = "select schoolname, degree, major from ".$this->dbpre."resume_edu  
				where uid= ".$val['uid']." and rtype='cn' order by degree limit 1 ";
				$re = $this->resume->queryAll($query);
				$rows[$key]['schoolname'] = $re[0]["schoolname"]?$re[0]["schoolname"]:'无';
				$rows[$key]['degree'] = $re[0]["degree"]?$re[0]["degree"]:'无';
				$rows[$key]['major'] = $re[0]["major"]?$re[0]["major"]:'无';				
				
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);

		$totalpage = @ceil($total / 25);
		$this->assign('totalpage',$totalpage);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('url',$url);
		$this->assign('resume',$rows);
		$this->assign('key',htmlspecialchars_decode($keyword, ENT_QUOTES));
		$this->assign('degrees',$this->degrees);
		$this->assign('days',$days);
		$this->assign('startdate',$startdate);
		$this->assign('enddate',$enddate);
		$this->display('hr_rbox.tpl');
	}

	function downlistAction(){
		$page = $this->_get('page',1);
		$aid = intval($this->_get('aid',0));
		$url = $this->getPageUrl().'/downlist.html';
		$urls = array();
		$orderby = " posttime asc ";
		$where = " b.cid = ".$this->uid." and b.status = 1" ;

		$subftdatasall = $this->cache->getFuntypeDatas('funtype_level2');
		$subdtdatasall = $this->cache->getFuntypeDatas('dustrytype_level2');
		$subftdatasall1 = $this->cache->getFuntypeDatas('funtype_level1');
		$subdtdatasall1 = $this->cache->getFuntypeDatas('dustrytype_level1');
		$aldatasall = $this->cache->getAreaDatas('area_citys');

		$sql = "select r.*,b.posttime,b.id as bid from ".$this->dbpre."resume_download b 
		left join ".$this->dbpre."resume r on r.id = b.rid 
		where ".$where." order by ".$orderby;

		$total = count($this->resume->queryAll($sql));
		$n=25;
		$sql .= " limit ".(($page-1)*$n).", ".$n;
		$rows = $this->resume->queryAll($sql);
		if($rows){
			foreach($rows as $key => $val){
				$rows[$key]['area'] = $this->area->getNameByIds($val['live_gnd']);
				$tmp = explode(",",$val['live_gnd']);
				$rows[$key]['a2'] = $aldatasall[$tmp[1]];
				$tmp = explode(",",$val['funtype']);
				if($tmp[1]){
					if($subftdatasall[$tmp[0]]){
						foreach($subftdatasall[$tmp[0]] as $k => $v ){
							if($v['id']==$tmp[1])
								$rows[$key]['f2'] = $v['name'];
						}
					}
				}else{
					foreach($subftdatasall1 as $k => $v ){
						if($v['id']==$tmp[0])
							$rows[$key]['f2'] = $v['name'];
					}
				}
				$rows[$key]['age'] = date("Y") - $val['birth_year'];

				$query = "select min(fromdate) as f from ".$this->dbpre."resume_work  
				where uid= ".$val['uid'];
				$re = $this->resume->queryAll($query);
				$rows[$key]['work'] = date('Y')-date("Y",strtotime($re[0]["f"]));

				$query = "select schoolname from ".$this->dbpre."resume_edu  
				where uid= ".$val['uid']." order by todate desc limit 1 ";
				$re = $this->resume->queryAll($query);
				$rows[$key]['schoolname'] = $re[0]["schoolname"];

				$query = "select rtype from ".$this->dbpre."resume_download
				where cid= ".$this->uid." and rid = ".$val['id']." and status = 1 ";
				$re = $this->resume->queryAll($query);
				$rows[$key]['rtype'] = isset($re[0]["rtype"])?$re[0]["rtype"]:0;

			}
		}

		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$totalpage = @ceil($total / $n);

		if($aid){
			$r=$this->app_video_interview->find($aid);
			if(isset($r['id'])){
				$pidrows = $this->app_person_interview->fetchAll(' aid = '.intval($aid),null,'uid',null,null);
				$tmp=array();
				foreach($pidrows as $key => $val){
					$tmp[] = $val['uid'];
				}
				$uids = implode(",",$tmp);
				$resumes = $this->resume->fetchAll(' uid in ('.$uids.')',null,'id',null,null);
				$tmp=array();
				foreach($resumes as $key => $val){
					$tmp[] = $val['id'];
				}
				$rids = implode(",",$tmp);
				$down = $this->resume_download->fetchAll(' rid in ('.$rids.') and cid = '.$this->uid,null,'id',null,null);
				$tmp=array();
				foreach($down as $key => $val){
					$tmp[] = $val['id'];
				}
				$dids = implode(",",$tmp);
				$this->assign('dids',$dids);
				$this->assign('aid',$aid);
			}
		}else{
				$dids = $this->_get('interview','');
				$this->assign('dids',$dids);
		}

		//获取职位
		$jobs_model = Load::model('jobs');
		$zwrows = $jobs_model->fetchAll('cid='.$this->uid,"startdate desc",'id,title');
		$this->assign('zwrows',$zwrows);

		$this->assign('totalpage',$totalpage);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('url',$url);
		$this->assign('resume',$rows);
		$this->assign('degrees',$this->degrees);
		$this->display('hr_dresume.tpl');
	}

	function alistAction(){
		if(isset($_POST['action']) && $_POST['action']=='action'){
			//error_reporting(E_ALL);
			$starttime = $this->_get('starttime');
			$endtime = $this->_get('endtime');
			$startdate = $this->_get('startdate');
			$enddate = $this->_get('enddate');
			$info = array();
			$info['starttime'] = strtotime($startdate." ".$starttime.":00");
			$info['endtime'] = strtotime($enddate." ".$endtime.":00");

			if($info['endtime'] > $info['starttime']){
				$info['cid'] = $this->uid;
				$info['status'] = 0;
				$info['createtime'] = '';
				$s = $this->app_video_interview->fetchRow( $info['starttime'].' > starttime and endtime > '.$info['starttime']." and status = 1 and cid = ".$info['cid']);
				$e = $this->app_video_interview->fetchRow( $info['endtime'].' > starttime and endtime > '.$info['endtime']." and status = 1 and cid = ".$info['cid']);
				//$e = $this->app_video_interview->fetchRow( $info['endtime'].' > starttime and status = 1 and cid = '.$info['cid']);

				if($s || $e){
					$str = "该时间段您已经申请";
				}else{
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
					if(!empty($vodrooms)){
						//$info['room'] = $vodrooms[0];
						$info['room'] = "";
						if($this->app_video_interview->save($info) === false){
							$this->showmsg($this->user->getError(),1);
						}
						$str = "申请已提交，请耐心等待";
					}else{
						$str = "该时间段已无空闲视频房间";
					}
				}
			}else{
				$str = "内容填写错误";
			}
			$this->showmsg($str,BASE_URL."/enterp/resume/alist.html");
		}
		$time = array();

		for($i=6;$i<22;$i++){
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

		$page = $this->_get('page',1);
		$url = $this->getPageUrl().'/alist.html';
		$sql = "select * from ".$this->dbpre."app_video_interview  where  cid =".$this->uid."  order by status, createtime desc ";

		$total = count($this->resume->queryAll($sql));
		$n=25;
		$sql .= " limit ".(($page-1)*$n).", ".$n." ";
		$rows = $this->resume->queryAll($sql);
		$totalpage = @ceil($total / $n);
		$this->assign('totalpage',$totalpage);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('url',$url);
		$this->assign('interview',$rows);
		$this->assign('time',$time);
		$this->display('hr_interview.tpl');
	}

	function appinvitedAction(){
		$str = $this->_get('str');
		if(isset($_POST['action']) && $_POST['action']=='action'){
			//error_reporting(E_ALL);
			$starttime = $this->_get('starttime');
			$endtime = $this->_get('endtime');
			$startdate = $this->_get('startdate');
			$enddate = $this->_get('enddate');
			$info = array();
			$info['starttime'] = strtotime($startdate." ".$starttime.":00");
			$info['endtime'] = strtotime($enddate." ".$endtime.":00");

			if($info['endtime'] > $info['starttime']){
				$info['cid'] = $this->uid;
				$info['status'] = 0;
				$info['createtime'] = '';
				$s = $this->app_video_interview->fetchRow( $info['starttime'].' > starttime and endtime > '.$info['starttime']." and status = 1 and cid = ".$info['cid']);
				$e = $this->app_video_interview->fetchRow( $info['endtime'].' > starttime and endtime > '.$info['endtime']." and status = 1 and cid = ".$info['cid']);
				//$e = $this->app_video_interview->fetchRow( $info['endtime'].' > starttime and status = 1 and cid = '.$info['cid']);

				if($s || $e){
					$str = "该时间段您已经申请";
				}else{
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
					if(!empty($vodrooms)){
						//$info['room'] = $vodrooms[0];
						$info['room'] = "";
						if($this->app_video_interview->save($info) === false){
							$this->showmsg($this->user->getError(),1);
						}
						//$str = "申请，请耐心等待";
						$this->showmsg('房间申请已提交',BASE_URL."/enterp/send_interview/?str=".$str);
					}else{
						$str = "该时间段已无空闲视频房间";
					}
				}
			}else{
				$str = "内容填写错误";
			}
			$this->showmsg($str,BASE_URL."/enterp/resume/downlist.html");
		}
		$time = array();

		for($i=6;$i<22;$i++){
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

		$this->assign('str',$str);
		$this->assign('time',$time);
		$this->display('app_interview.tpl');
	}


	function downAction(){
		//error_reporting(E_ALL);
		$PositionID = $this->_get('PositionID');
		$type = $this->_get('type',"all");
		$vtmp = $this->_get('tmp',0);
		if(is_array($PositionID)){
			foreach($PositionID as $key => $val){
				$info['cid'] = $this->uid;
				$info['rid'] = intval($val);
				$info['posttime'] = time();
				$info['status'] = 1;
				$is_contract = 0;
				//$sql="select * from  ".$this->dbpre."resume_download where cid = ".$info['cid']." and rid = ".$info['rid'];
				$rows = $this->resume_download->fetchAll("cid = ".$info['cid']." and rid = ".$info['rid']);
				$rows = $rows[0];
				//print_r($rows);exit;
				if($type=='doc'){
					$info['rtype'] = 1;
					$contract = $this->contract->fetchAll(" uid = ".$this->uid." and enddate >= ".time()." and word>10 ", " enddate asc");
					if(!isset($rows['rtype'])){
						if(count($contract) && $contract[0]['word']>10){
							$contract = $contract[0];
							$contract['word'] = $contract['word']-10;
							$this->contract->save($contract);
							$is_contract = 1;
						}
					}else{
						if($rows['rtype']==1 || $rows['rtype'] == 3){
							$is_contract = 1;
						}
						else if($rows['rtype']==2)
						{
							$info['rtype'] = 3;
							if(count($contract) && $contract[0]['word']>10){
								$contract = $contract[0];
								$contract['word'] = $contract['word']-10;
								$this->contract->save($contract);
								$is_contract = 1;
							}
						}
					}
				}else if ($type=='vod'){
					$info['rtype'] = 2;
					$contract = $this->contract->fetchAll(" uid = ".$this->uid." and enddate >= ".time()." and  word>20 ", " enddate asc");
					if(!isset($rows['rtype'])){
						if(count($contract) && $contract[0]['word']>20){
							$contract = $contract[0];
							$contract['word'] = $contract['word']-20;
							$this->contract->save($contract);
							$is_contract = 1;
						}
					}else{
						if($rows['rtype']==2 || $rows['rtype']==3){
							$is_contract = 1;
						}else if($rows['rtype']==1){
							$info['rtype'] = 3;
							if(count($contract) && $contract[0]['word']>20){
								$contract = $contract[0];
								$contract['word'] = $contract['word']-20;
								$this->contract->save($contract);
								$is_contract = 1;
							}
						}
					}
				}
				if($is_contract){
					if($rows){
						$info['id'] = $rows['id'];
						//$info['posttime'] = $rows['posttime'];
					}
					$rows = $this->resume_download->save($info); 
					//resume_tmp
					if($vtmp==1){
						$sql="update ".$this->dbpre."resume_tmp set  status=0 where  rid=".$val." and cid=".$this->uid." ";
						$this->resume_tmp->queryAll($sql);
					}
					$str = "该简历下载成功";
				}else{
					$str = "";
				}
			}
			if($str){
				$this->showmsg($str,BASE_URL."/enterp/resume/downlist.html");
			}else{
				$this->showmsg('您没有购买下载权限',BASE_URL."/enterp/resume/downlist.html");
			}
		}else{
			$str = "参数错误";
		}
		$this->showmsg($str,BASE_URL."/enterp/resume/downlist.html");
	}

	function delAction(){
		$PositionID = $this->_get('PositionID',0);
		$type = $this->_get('type','');
		$table = "";
		if($type == 'box'){
			$table = "resume_box";
		}
		if($type == 'down'){
			$table = "resume_download";
		}
		if($type == 'tmp'){
			$table = "resume_tmp";
		}
		if($table != ""){
			if(is_array($PositionID)){
				$ids=implode(",",$PositionID);
				$sql="update ".$this->dbpre.$table." set  status=0 where  rid in (".$ids.") ";
				$rows = $this->resume_box->queryAll($sql);
			}else{
				$sql="update ".$this->dbpre.$table." set  status=0 where  rid=".$PositionID." ";
				$rows = $this->resume_box->queryAll($sql);
			}
			$this->showmsg("删除简历成功",BASE_URL."/enterp/resume/".$type."list.html");
		}
	}

	function tmpAction(){
		$PositionID = $this->_get('PositionID');
		$type = $this->_get('type',"tmp");
		if(is_array($PositionID)){
			foreach($PositionID as $key => $val){
				$info['cid'] = $this->uid;
				$info['rid'] = intval($val);
				$info['status'] = 1;
				$info['createdate'] =date('Y-m-d H:i:s');

				$sql="select * from  ".$this->dbpre."resume_tmp where cid = ".$info['cid']." and rid = ".$info['rid'];
				$rows = $this->resume_download->queryAll($sql);
				if($rows){
					$info['id'] = $rows[0]['id'];
					$info['createdate'] = $rows[0]['createdate'];
				}
				$rows = $this->resume_tmp->save($info);
			}
			$str = "该简历暂存成功";
		}else{
			$str = "参数错误";
		}
		$this->showmsg($str,BASE_URL."/enterp/resume/tmplist.html");
	}


	function searchAction(){
		$url = $this->getPageUrl().'/search.html';
		$page = $this->_get('page',1);
		$years = array();
		$urls = array();
		$where = " 1 ";
		$funtype_1 = $this->_get('funtype_1',0);
		$funtype_2 = $this->_get('funtype_2',0);
//		if($funtype_2==0){
//			$funtype_2 = $funtype_1;
//		}
		$live_gnd_p = $this->_get('live_gnd_p',0);
		$live_gnd_c = $this->_get('live_gnd_c',0);
		$year = $this->_get('year',0);
		$days = $this->_get('days',0);
		$degree = $this->_get('degree',0);
		$dustrytype_1 = $this->_get('dustrytype_1',0);
		$dustrytype_2 = $this->_get('dustrytype_2',0);
		$keywords = $this->_get('keywords','');

		$subftdatasall = $this->cache->getFuntypeDatas('funtype_level2');
		$subdtdatasall = $this->cache->getFuntypeDatas('dustrytype_level2');
		$subftdatasall1 = $this->cache->getFuntypeDatas('funtype_level1');
		$subdtdatasall1 = $this->cache->getFuntypeDatas('dustrytype_level1');
		$aldatasall = $this->cache->getAreaDatas('area_citys');

		if($funtype_2>0){
			$subftdatas = $subftdatasall[$funtype_1];
			$this->assign('subftdatas',$subftdatas);
			$urls[] = "funtype_1=".$funtype_1;
			$urls[] = "funtype_2=".$funtype_2;
			$where .= " and funtype = '".$funtype_1.",".$funtype_2."'";
		}else{
			if($funtype_1){
				$subftdatas = $subftdatasall[$funtype_1];
				$this->assign('subftdatas',$subftdatas);
				$urls[] = "funtype_1=".$funtype_1;
				$where .= " and funtype = '".$funtype_1.",'";
			}
		}

		if($dustrytype_2>0){
			$subdtdatas = $subdtdatasall[$dustrytype_1];
			$this->assign('subdtdatas',$subdtdatas);
			$urls[] = "dustrytype_1=".$dustrytype_1;
			$urls[] = "dustrytype_2=".$dustrytype_2;
			$where .= " and dustrytype = '".$dustrytype_1.",".$dustrytype_2."'";
		}else{
			if($dustrytype_1){
				$subdtdatas = $subdtdatasall[$dustrytype_1];
				$this->assign('subdtdatas',$subdtdatas);
				$urls[] = "dustrytype_1=".$dustrytype_1;
				$where .= " and dustrytype = '".$dustrytype_1.",'";
			}
		}

		if($live_gnd_c>0){
			$aldatas = $aldatasall[$live_gnd_p];
			$this->assign('aldatas',$aldatas);
			$urls[] = "live_gnd_p=".$live_gnd_p;
			$urls[] = "live_gnd_c=".$live_gnd_c;
			$where .= " and live_gnd = '".$live_gnd_p.",".$live_gnd_c."'";
		}
		
		if($year>0){
			$urls[] = "year=".$year;
			//$where .= " and fromdate <= '".$year."-1-1' ";
			$select = " and  u.id in ( select distinct uid from ".$this->dbpre."resume_work where fromdate <= '".$year."-1-1' )";
		}

		if($degree){
			$urls[] = "degree=".$degree;
			$where .= " and degree = ".$degree." ";
		}

		if($days){
			$urls[] = "days=".$days;
			if($days == 3){
				$where .= "  and modifydate >= ".strtotime("-3 day");
			}else if($days == 7){
				$where .= "  and modifydate >= ".strtotime("-7 day");
			}else if($days == 14){
				$where .= "  and modifydate >= ".strtotime("-2 week");
			}else if($days == 30){
				$where .= "  and modifydate >= ".strtotime("-1 month");
			}
		}

		if($keywords!=''){
			$keywords = preg_replace("/[\s]+/", "/\s/", $keywords);
			$urls[] = "keywords=".$keywords;
			$key_array = explode(" ",$keywords);
		}

		$resume_download = $this->resume_download->fetchAll(" cid='".$this->uid."' and  status = 1 ");
		$resume_tmp = $this->resume_tmp->fetchAll(" cid='".$this->uid."' and  status = 1 ");
		$no_ids = array();
		if($resume_download){
			foreach($resume_download as $key => $val){
				$no_ids[] = $val['rid'];
			}
		}

		if($resume_tmp){
			foreach($resume_tmp as $key => $val){
				$no_ids[] = $val['rid'];
			}
		}

//		echo "<!--";
//		print_r($resume_tmp);
//		echo "-->";

		$orderby = " modifydate desc ";
		//$where .= " and status = 1" ;

		
		$sql = "select r.* from ".$this->dbpre."resume r 
		left join ".$this->dbpre."user u on u.id = r.uid
		where ".$where." and u.status = 1 and u.resume_status = 1 and rtype= 'cn' ".$select." ".(empty($no_ids)?'':' and r.id not in ('.implode(',',$no_ids).')')."order by ".$orderby;
		$total = count($this->resume->queryAll($sql));
		//echo "<!--{$sql}-->";
		$sql .= " limit ".(($page-1)*25).", 25 ";
		$rows = $this->resume->queryAll($sql);
		if($rows){
			foreach($rows as $key => $val){
				$rows[$key]['area'] = $this->area->getNameByIds($val['live_gnd']);
				$tmp = explode(",",$val['live_gnd']);
				$rows[$key]['a2'] = $aldatasall[$tmp[1]];
				$tmp = explode(",",$val['funtype']);
				if($tmp[1]){
					if($subftdatasall[$tmp[0]]){
						foreach($subftdatasall[$tmp[0]] as $k => $v ){
							if($v['id']==$tmp[1])
								$rows[$key]['f2'] = $v['name'];
						}
					}
				}else{
					foreach($subftdatasall1 as $k => $v ){
						if($v['id']==$tmp[0])
							$rows[$key]['f2'] = $v['name'];
					}
				}
//				$tmp = explode(",",$val['dustrytype']);
//				$rows[$key]['d2'] = $subdtdatasall[$tmp[1]];
				$rows[$key]['age'] = date("Y") - $val['birth_year'];

				$query = "select min(fromdate) as f from ".$this->dbpre."resume_work  
				where uid= ".$val['uid'];
				$re = $this->resume->queryAll($query);
				if($re[0]["f"]){
					$rows[$key]['work'] = date('Y')-date("Y",strtotime($re[0]["f"]));
				}else{
					$rows[$key]['work'] = '无';
				}

				$query = "select schoolname from ".$this->dbpre."resume_edu  
				where uid= ".$val['uid']." order by todate desc limit 1 ";
				$re = $this->resume->queryAll($query);
				$rows[$key]['schoolname'] = $re[0]["schoolname"]?$re[0]["schoolname"]:'无';
			}
		}

		$y = date("Y");
		for($i=$y-1;$i>=($y-30);$i--){
			$years[$i] = $y-$i;
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$totalpage = @ceil($total / 25);
		
		$funtype = $this->funtype->fetchAll('parent_id = 0');

		$this->assign('funtype', $funtype);
		$this->assign('totalpage',$totalpage);
		$this->assign('total',$total);
		$this->assign('page',$page);

		$this->assign('dustrytype_1',$dustrytype_1);
		$this->assign('dustrytype_2',$dustrytype_2);
		$this->assign('funtype_1',$funtype_1);
		$this->assign('funtype_2',$funtype_2);
		$this->assign('live_gnd_p',$live_gnd_p);
		$this->assign('live_gnd_c',$live_gnd_c);
		$this->assign('degree',$degree);
		$this->assign('year',$year);
		$this->assign('days',$days);
		$this->assign('resumes',$rows);

		$this->assign('years',$years);
		$this->assign('url',$url);
		$this->assign('adatas',$this->adata);
		$this->assign('ftdatas',$this->ftdata);
		$this->assign('dtdatas',$this->dtdata);
		$this->assign('degrees',$this->degrees['cn']);
		$this->display('resume_search.tpl');
	}

	function tmplistAction(){
		$url = $this->getPageUrl().'/tmplist.html';
		$page = $this->_get('page',1);
		$subftdatasall = $this->cache->getFuntypeDatas('funtype_level2');
		$subdtdatasall = $this->cache->getFuntypeDatas('dustrytype_level2');
		$subftdatasall1 = $this->cache->getFuntypeDatas('funtype_level1');
		$subdtdatasall1 = $this->cache->getFuntypeDatas('dustrytype_level1');
		$aldatasall = $this->cache->getAreaDatas('area_citys');

		$orderby = " createdate desc ";
		$where .= "  t.status = 1 and t.cid = ".$this->uid ;

		$resume_download = $this->resume_download->fetchAll(" cid='".$this->uid."' and  status = 1 ");
		if($resume_download){
			foreach($resume_download as $key => $val){
				$resume = $this->resume_tmp->fetchRow(" cid='".$this->uid."' and rid = ".$val['rid'] );
				$resume['status'] = 0;
				$rows = $this->resume_tmp->save($resume);
			}
		}
		
		$sql = "select r.* from ".$this->dbpre."resume_tmp t left join ".$this->dbpre."resume r on r.id=t.rid where ".$where." ".$select."  order by ".$orderby;
		$total = count($this->resume_tmp->queryAll($sql));

		$sql .= " limit ".(($page-1)*25).", 25 ";
		$rows = $this->resume_tmp->queryAll($sql);
		if($rows){
			foreach($rows as $key => $val){
				$rows[$key]['area'] = $this->area->getNameByIds($val['live_gnd']);
				$tmp = explode(",",$val['live_gnd']);
				$rows[$key]['a2'] = $aldatasall[$tmp[1]];
				$tmp = explode(",",$val['funtype']);
				if($tmp[1]){
					if($subftdatasall[$tmp[0]]){
						foreach($subftdatasall[$tmp[0]] as $k => $v ){
							if($v['id']==$tmp[1])
								$rows[$key]['f2'] = $v['name'];
						}
					}
				}else{
					foreach($subftdatasall1 as $k => $v ){
						if($v['id']==$tmp[0])
							$rows[$key]['f2'] = $v['name'];
					}
				}
				$rows[$key]['age'] = date("Y") - $val['birth_year'];

				$query = "select min(fromdate) as f from ".$this->dbpre."resume_work  
				where uid= ".$val['id'];
				$re = $this->resume->queryAll($query);
				if($re[0]["f"]){
					$rows[$key]['work'] = date('Y')-date("Y",strtotime($re[0]["f"]));
				}else{
					$rows[$key]['work'] = '无';
				}

				$query = "select schoolname from ".$this->dbpre."resume_edu  
				where uid= ".$val['id']." order by todate desc limit 1 ";
				$re = $this->resume->queryAll($query);
				$rows[$key]['schoolname'] = $re[0]["schoolname"]?$re[0]["schoolname"]:'无';
			}
		}


		$totalpage = @ceil($total / 25);
		$this->assign('totalpage',$totalpage);
		$this->assign('url',$url);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('resumes',$rows);
		$this->assign('degrees',$this->degrees['cn']);
		$this->display('hr_tmpbox.tpl');
	}

	function viewAction(){
		//error_reporting(E_ALL);
		$id = (int)$this->_get('id',0);
		$uid = (int)$this->_get('uid',0);
		$rtype = $this->_get('t','cn');
		if($id>0){
			$resume = $this->resume->fetchRow(" rtype='".$rtype."' and id = ".$id );
		}elseif($uid>0){
			$resume = $this->resume->fetchRow(" rtype='".$rtype."' and uid = ".$uid );
		}else{
			$resume = array();
		}
		if(!empty($resume) && $resume['uid']>0){
			$works = $this->resume_work->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$edus = $this->resume_edu->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$langs = $this->resume_lang->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$its = $this->resume_it->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$ctfs = $this->resume_ctf->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");

			$myjob_rviewd = Load::model('myjob_rviewd');
			$myjob_info['uid'] = $resume['uid'];
			$myjob_info['eid'] = $this->uid;
			$myjob_info['status'] = 1;
			$myjob_rviewd->save($myjob_info);
			$down = 0;
			$resume_download = $this->resume_download->fetchRow(" cid='".$this->uid."' AND rid='".$resume['id']."' and  status = 1 ");
			if(isset($resume_download['rtype']) && $resume_download['rtype'])
				$down = count($resume_download);

			$citydatas = $this->cache->getAreaDatas('area_citys');

			if($resume['speciality']){
//				$submjdatas = $this->cache->getMajorDatas('major_level2');
//				$tmp = explode(",",$resume['speciality']);
//				$resume['speciality_1_name'] = $this->mjdata[$tmp[0]]['name'];
//				$resume['speciality_1'] = $tmp[0];
//				$resume['speciality_2'] = $tmp[1];
//				foreach($submjdatas[$tmp[0]] as $k => $v){
//					if($v['id'] == $tmp[1])
//						$resume['speciality_2_name'] = $v['name'];
//				}
				$resume['speciality_1_name'] = $resume['speciality'];
				$resume['speciality_2_name'] = '';
			}

			if($resume['funtype']){
				//$resume['funtype_name'] = $this->funtype->getNameByIds($resume['funtype']);
				$subftdatas = $this->cache->getFuntypeDatas('funtype_level2');
				$tmp = explode(",",$resume['funtype']);
				$resume['funtype_1'] = $tmp[0];
				$resume['funtype_2'] = $tmp[1];
				$resume['funtype_1_name'] = $this->ftdata[$tmp[0]]['name'];
				foreach($subftdatas[$tmp[0]] as $k => $v){
					if($v['id'] == $tmp[1])
						$resume['funtype_2_name'] = $v['name'];
				}
			}
			if($resume['dustrytype']){
				$subdtdatas = $this->cache->getFuntypeDatas('dustrytype_level2');
				$tmp = explode(",",$resume['dustrytype']);
				$resume['dustrytype_1_name'] = $this->dtdata[$tmp[0]]['name'];
				$resume['dustrytype_1'] = $tmp[0];
				$resume['dustrytype_2'] = $tmp[1];
				foreach($subdtdatas[$tmp[0]] as $k => $v){
					if($v['id'] == $tmp[1])
						$resume['dustrytype_2_name'] = $v['name'];
				}
			}

			$resume['live_gnd_name'] = $this->area->getNameByIds($resume['live_gnd']);

			$resume['work_gnd_name'] = $this->area->getNameByIds($resume['work_gnd']);
			
			if(empty($works)){
				$works = '';
			}else{
				$tmp = array();
				foreach($works as $k=>$row){
					//$row['fromdate']." - ".$row['todate']."  ".$row['company']." ".$row['position']." ".$this->companytypes[$rtype][$row['companytype']]." ".$this->salarys[$rtype][$row['income']]." ".$row['responsiblity'];

					$tmp[] = '<tr><td width=100px>'.$row['fromdate'].' - '.$row['todate'].' </td><td>'.$row['company'].'</td></tr><tr><td>企业性质：</td><td>'.$this->companytypes[$rtype][$row['companytype']].'</td></tr><tr><td>职位：</td><td>'.$row['position'].'</td></tr><tr><td>工作描述：</td><td>'.$row['responsiblity'].'</td></tr><tr><td colspan="2" align="center">&nbsp;</td></tr>';
				}
				$works = $tmp;
			}

			if(empty($edus)){
				$edus = '';
			}else{
				$tmp = array();
				foreach($edus as $k=>$row){
//					$tmp[] = $row['fromdate']." - ".$row['todate']."  ".$row['schoolname']." ".$this->major->getNameByIds($row['major'])." ".$this->degrees[$rtype][$row['degree']];
					$tmp[] = $row['fromdate']." - ".$row['todate']."  ".$row['schoolname']." ".$row['major']." ".$this->degrees[$rtype][$row['degree']];

				}
				$edus = $tmp;
			}

			if(empty($langs)){
				$langs = '';
			}

			if(empty($its)){
				$its = '';
			}else{
				$tmp = array();
				foreach($its as $k=>$row){
					$tmp[] = $row['skillname'] ." ".$row['ability']." ".$row['usetime']."月";
				}
				$its = $tmp;
			}

			if(empty($ctfs)){
				$ctfs = '';
			}else{
				$tmp = array();
				foreach($ctfs as $k=>$row){
					$tmp[] = $row['awarddate'] ." ".$row['ctfname']." ".$row['awardorg'];
				}
				$ctfs = $tmp;
			}
			$video = $this->resume_vod->fetchRow(" uid = ".$resume['uid']." and status=1" );
			if(isset($video['id']) && $video['id']){
				$resume['video'] = 1;
			}else{
				$resume['video'] = 0;
			}
			$contract = $this->contract->fetchAll(" uid = ".$this->uid." and enddate >= ".time()."  ", " enddate asc"," sum(word) as w ,sum(video) as v ");
			$resume['age'] = $resume['birth_month']>=date('n')?(date('Y')-$resume['birth_year']-1):(date('Y')-$resume['birth_year']);

			$this->assign('years',F::getYears());//年
			$this->assign('months',F::getMonths());//月
			$this->assign('days',F::getDays());//日
			$this->assign('adatas',$this->adata);//省份
			$this->assign('ftdatas',$this->ftdata);//一级职位
			$this->assign('dtdatas',$this->dtdata);//一级行业
			$this->assign('mjdatas',$this->mjdata);//一级专业
			$this->assign('degrees',$this->degrees[$rtype]);
			$this->assign('entrytimes',$this->entrytimes[$rtype]);
			$this->assign('salarys',$this->salarys[$rtype]);
			$this->assign('companytypes',$this->companytypes[$rtype]);
			$this->assign('languages',$this->languages[$rtype]);

			$this->assign('wordnum',isset($contract[0]['w'])?$contract[0]['w']:0);
			$this->assign('videonum',isset($contract[0]['v'])?$contract[0]['v']:0);		
			$this->assign('rtype',isset($resume_download['rtype'])?$resume_download['rtype']:0);					
			$this->assign('info',$resume);
			$this->assign('works',$works);
			$this->assign('edus',$edus);
			$this->assign('its',$its);
			$this->assign('ctfs',$ctfs);
			$this->assign('langs',$langs);
			$this->assign('down',$down);
			$this->assign('worknum',count($works));
			$this->assign('edunum',count($edus));
			$this->assign('itnum',count($its));
			$this->assign('ctfnum',count($ctfs));
			$this->assign('langnum',count($langs));
			$this->display('resume.tpl');
		}else{
			$str = "参数错误";
		}
	}

	function videoAction(){
		/*
			$video = $this->resume_vod->fetchRow(" uid = 11 and status=1" );
			$this->assign('video',$video);
			$this->assign('img_domain',IMG_DOMAIN."/");
			$this->display('resume_video.tpl');
		*/
		$id = intval($this->_get('id',0));
		if($id){
			$resume = $this->resume->fetchRow(" id = ".$id );
			$row = $this->resume_download->fetchRow(" rid = ".$id." and cid = ".$this->uid." and status = 1 and (rtype=3 or rtype=2)");
			if(isset($row['id']) && $row['id']){
				$video = $this->resume_vod->fetchRow(" uid = ".$resume['uid']." and status=1" );
				$this->assign('video',$video);
				$this->assign('img_domain',IMG_DOMAIN."/");
				$this->display('resume_video.tpl');
			}else{
				$this->showmsg("数据不存在",BASE_URL."/enterp/resume/downlist.html");
			}
		}else{
			$this->showmsg("非法操作",BASE_URL."/enterp/resume/downlist.html");
		}
	}

	function dlistAction(){
		//error_reporting(E_ALL);
		$page = $this->_get('page',1);
		$url = $this->getPageUrl().'/dlist.html';
		$urls = array();
		$orderby = " posttime desc ";
		$where = " b.cid = ".$this->uid." and b.status = 1" ;
		$subftdatasall = $this->cache->getFuntypeDatas('funtype_level2');
		$subdtdatasall = $this->cache->getFuntypeDatas('dustrytype_level2');
		$subftdatasall1 = $this->cache->getFuntypeDatas('funtype_level1');
		$subdtdatasall1 = $this->cache->getFuntypeDatas('dustrytype_level1');
		$aldatasall = $this->cache->getAreaDatas('area_citys');
		$enrolllogmodel = Load::model('enrolllog');
		$sql = "select r.*,b.posttime,b.id as bid from ".$this->dbpre."resume_download b 
		left join ".$this->dbpre."resume r on r.id = b.rid 
		where ".$where." order by ".$orderby;
		$n=25;
		$total = count($this->resume->queryAll($sql));
		$sql .= " limit ".(($page-1)*$n).", ".$n;
		$rows = $this->resume->queryAll($sql);
		if($rows){
			foreach($rows as $key => $val){
				$rows[$key]['lqstat'] = 0;
				if($enrolllogmodel->check($this->uid,$val['uid'])){
					$rows[$key]['lqstat'] = 1;
				}
				$rows[$key]['resumetype'] = $val['rtype'];
				$rows[$key]['area'] = $this->area->getNameByIds($val['live_gnd']);
				$tmp = explode(",",$val['live_gnd']);
				$rows[$key]['a2'] = $aldatasall[$tmp[1]];
				$tmp = explode(",",$val['funtype']);
				if($tmp[1]){
					if($subftdatasall[$tmp[0]]){
						foreach($subftdatasall[$tmp[0]] as $k => $v ){
							if($v['id']==$tmp[1])
								$rows[$key]['f2'] = $v['name'];
						}
					}
				}else{
					foreach($subftdatasall1 as $k => $v ){
						if($v['id']==$tmp[0])
							$rows[$key]['f2'] = $v['name'];
					}
				}
				$rows[$key]['age'] = date("Y") - $val['birth_year'];

				$query = "select min(fromdate) as f from ".$this->dbpre."resume_work  
				where uid= ".$val['uid'];
				$re = $this->resume->queryAll($query);
				$rows[$key]['work'] = date('Y')-date("Y",strtotime($re[0]["f"]));

				$query = "select schoolname from ".$this->dbpre."resume_edu  
				where uid= ".$val['uid']." order by todate desc limit 1 ";
				$re = $this->resume->queryAll($query);
				$rows[$key]['schoolname'] = $re[0]["schoolname"];

				$query = "select rtype from ".$this->dbpre."resume_download
				where cid= ".$this->uid." and rid = ".$val['id']." and status = 1 ";
				$re = $this->resume->queryAll($query);
				$rows[$key]['rtype'] = isset($re[0]["rtype"])?$re[0]["rtype"]:0;

				$resume_download = $this->resume_download->fetchRow(" rid = ".$val['id']." and cid = ".$this->uid." and status = 1 and (rtype=3 or rtype=2) ");
				if(isset($resume_download['id']) && $resume_download['id']){
					$video = $this->resume_vod->fetchRow(" uid = ".$val['uid']." and status=1" );
					$rows[$key]['video'] = IMG_DOMAIN."/".$video['vodurl'];
					$rows[$key]['videoShiyishi'] = IMG_DOMAIN."/".$video['vodurl'].'shiyishi';					
				}else{
					$rows[$key]['video'] = '';
					$rows[$key]['videoShiyishi'] = '';
				}
				
			}
		}

		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$totalpage = @ceil($total / $n);
		$this->assign('totalpage',$totalpage);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('resume',$rows);
		$this->assign('degrees',$this->degrees);
		if(!$_SESSION['enterp_info']['uid']){
			echo '<script>window.location.href="/enterp/login.html";</script>';
		}else{
			echo $Content = '1'.'<_@S#S@_>'.$this->tpl->fetch('enterp/dlist.tpl');
		}
	}

	function enrollAction(){
		//error_reporting(E_ALL);
		$page = $this->_get('page',1);
		$url = $this->getPageUrl().'/enroll.html';
		$urls = $uids = array();
		$enrolllogmodel = Load::model('enrolllog');
		$es = $enrolllogmodel->pageAll($page, 20, $url,"eid=".$this->uid." AND status=1","id desc");
		if(!empty($es)){
			foreach($es as $e){
				$uids[] = $e['uid'];
			}
		}
		if(!empty($uids)){
			$orderby = " posttime desc ";
			$where = " b.cid = ".$this->uid." and b.status = 1 AND r.uid IN (".implode(',',$uids).")" ;
			$subftdatasall = $this->cache->getFuntypeDatas('funtype_level2');
			$subdtdatasall = $this->cache->getFuntypeDatas('dustrytype_level2');
			$subftdatasall1 = $this->cache->getFuntypeDatas('funtype_level1');
			$subdtdatasall1 = $this->cache->getFuntypeDatas('dustrytype_level1');
			$aldatasall = $this->cache->getAreaDatas('area_citys');
			
			$sql = "select r.*,b.posttime,b.id as bid from ".$this->dbpre."resume_download b 
			left join ".$this->dbpre."resume r on r.id = b.rid 
			where ".$where." order by ".$orderby;
	//		$n=25;
	//		$total = count($this->resume->queryAll($sql));
	//		$sql .= " limit ".(($page-1)*$n).", ".$n;
			$rows = $this->resume->queryAll($sql);
			if($rows){
				foreach($rows as $key => $val){
					$rows[$key]['lqstat'] = 0;
					if($enrolllogmodel->check($this->uid,$val['uid'])){
						$rows[$key]['lqstat'] = 1;
					}
					$rows[$key]['resumetype'] = $val['rtype'];
					$rows[$key]['area'] = $this->area->getNameByIds($val['live_gnd']);
					$tmp = explode(",",$val['live_gnd']);
					$rows[$key]['a2'] = $aldatasall[$tmp[1]];
					$tmp = explode(",",$val['funtype']);
					if($tmp[1]){
						if($subftdatasall[$tmp[0]]){
							foreach($subftdatasall[$tmp[0]] as $k => $v ){
								if($v['id']==$tmp[1])
									$rows[$key]['f2'] = $v['name'];
							}
						}
					}else{
						foreach($subftdatasall1 as $k => $v ){
							if($v['id']==$tmp[0])
								$rows[$key]['f2'] = $v['name'];
						}
					}
					$rows[$key]['age'] = date("Y") - $val['birth_year'];

					$query = "select min(fromdate) as f from ".$this->dbpre."resume_work  
					where uid= ".$val['uid'];
					$re = $this->resume->queryAll($query);
					$rows[$key]['work'] = date('Y')-date("Y",strtotime($re[0]["f"]));

					$query = "select schoolname from ".$this->dbpre."resume_edu  
					where uid= ".$val['uid']." order by todate desc limit 1 ";
					$re = $this->resume->queryAll($query);
					$rows[$key]['schoolname'] = $re[0]["schoolname"];

					$query = "select rtype from ".$this->dbpre."resume_download
					where cid= ".$this->uid." and rid = ".$val['id']." and status = 1 ";
					$re = $this->resume->queryAll($query);
					$rows[$key]['rtype'] = isset($re[0]["rtype"])?$re[0]["rtype"]:0;

				}
			}
		}
		$this->assign('page',$page);
		$this->assign('resume',$rows);
		$this->assign('degrees',$this->degrees);
		$this->display('resume_enroll.tpl');
	}

	function admitAction(){
		$id = intval($this->_get('id',0));
		if($id){
			$where = " b.cid = ".$this->uid." and b.rid = ".$id."" ;
			$sql = "select r.*,b.posttime,b.id as bid from ".$this->dbpre."resume_download b 
			left join ".$this->dbpre."resume r on r.id = b.rid 
			where ".$where."  ";
			$rows = $this->resume->queryAll($sql);
			if($rows){
				//print_r($rows);
				$this->assign('info',$rows[0]);
				$this->display('admit.tpl');
			}else{
				$this->showmsg("数据不存在",BASE_URL."/enterp/resume/downlist.html");
			}
		}else{
			$this->showmsg("非法操作",BASE_URL."/enterp/resume/downlist.html");
		}
	}

	function admitdoAction(){
		$info = $this->_get('info');
		$linfo['rid'] = $info['rid'] = intval($info['rid']);
		$linfo['cid'] = $info['cid'] = intval($info['cid']);
		$linfo['uid'] = $info['uid'] = intval($info['uid']);
		if($info['cid'] == $this->uid){
			$where = " b.cid = ".$this->uid." and b.rid = ".$info['rid']."" ;
			$sql = "select r.*,b.posttime,b.id as bid from ".$this->dbpre."resume_download b 
			left join ".$this->dbpre."resume r on r.id = b.rid 
			where ".$where."  ";
			$rows = $this->resume->queryAll($sql);
			if($rows){
				$info['name']=$rows[0]['uname'];
				$info['personid']=$rows[0]['idcard'];
				$linfo['uid'] = time();
				$linfo['uid'] = strtotime("+1 month ");
				if($this->admit->save($info) === false){
					$this->showmsg($this->admit->getError(),1);
				}
				if($this->resume_lock->save($linfo) === false){
					$this->showmsg($this->resume_lock->getError(),1);
				}

				$this->showmsg("添加成功",BASE_URL."/enterp/resume/downlist.html");
			}else{
				$this->showmsg("数据不存在",BASE_URL."/enterp/resume/downlist.html");
			}
		}else{
			$this->showmsg("非法操作",BASE_URL."/enterp/resume/downlist.html");
		}
	}

}
?>
