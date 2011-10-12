<?php
/*
* 用户系统 @Author Guoli
*/
class e_user_Controller extends Controller{

	function init(){
		$this->user = Load::model('e_user');
		$this->jobs = Load::model('jobs');
		$this->area = Load::model('area');
		$this->dustrytype = Load::model('dustrytype');
		$this->subcompany = Load::model('subcompany');
		$this->conf_db = Load::conf('db');
		$this->conf = Load::conf('conf');
		$this->dbpre = $this->conf_db['default']['prefix'];
		$this->dtdata = $this->dustrytype->flushcache('dustrytype_level1',true);
		//$this->dtdata = $this->cache->getDustrytypeDatas('dustrytype_level1');//一级行业	
		//print_r($this->dtdata);
		//$this->adata = $this->cache->getAreaDatas('area_province');//省份
		$this->companyscales = $this->conf['companyscales'];
		$this->companytypes = $this->conf['companytypes'];
		$this->companyproperties = $this->conf['companyproperties'];

	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$status = $this->_get('status',1);
		$url = $this->getPageUrl().'/list.do?status='.$status;
		$s['id'] = intval($this->_get('id'));
		$s['username'] = trim($this->_get('username'));
		$s['email'] = trim($this->_get('email'));
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		$sdate = 'createtime';
		$orderby = 'id DESC';
		$wheres[] = ' status = '.$status.' ';
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='s_date'){
				$wheres[] = $sdate." >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = $sdate." <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "$key LIKE '%".$val."%'";
			}
		}
		$url .= empty($urls) ? '' : '&'.implode('&',$urls);
		$rows = $this->user->pageAll($page, 20, $url,$wheres,$orderby);
		foreach($rows as $k=>$v){
			$rows[$k]['proname'] = $this->area->getName($v['live_gnd_p']);
			$rows[$k]['cityname'] = $this->area->getName($v['live_gnd_c']);
			$rows[$k]['image'] = explode("|||",$v['live_gnd_c']); 
		}
		$nopass = $this->user->count('status=1');
		$pass = $this->user->count('status=2');

		$this->assign('pass',$pass);
		$this->assign('nopass',$nopass);
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->assign('status', $status);
		$this->assign('turl',$url.'&page='.$page);
		$this->display('e_user_list.tpl');
	}

	function enrollAction(){
		$opt = trim($this->_get('opt'));
		if($opt=='cancel'){
			$id = (int)$this->_get('id');
			if($id<=0){
				$this->wajaxmsg('参数错误',1);
			}
			$enrolllogmodel = Load::model('enrolllog');
			$usermodel = Load::model('user');
			$check = $enrolllogmodel->find($id);
			$eid = $check['eid'];
			if($check){
				if($check['status']!=1){
					$this->wajaxmsg('该录用信息已被驳回。');
				}
				$info['id'] = $id;
				$info['status'] = 0;
				if($enrolllogmodel->save($info) === false){
					$this->wajaxmsg($enrolllogmodel->getError(),1);
				}
				$userinfo = $usermodel->find($check['uid']);
				if($userinfo){
					$uinfo['id'] = $userinfo['id'];
					$uinfo['eid'] = 0;
					$uinfo['resume_status'] = 0;
					$uinfo['edatetime'] = 0;
					$uinfo['jobid'] = 0;
					$uinfo['etimes'] = 0;
					$usermodel->update($uinfo);
					$ename = $this->user->getCompanyName($eid);
					//判断是否存在上级
					if($userinfo['puid']>0){
						$useraccountmodel = Load::model('user_account');
						$row = $useraccountmodel->fetchRow("eid='".$eid."' AND xid='".$userinfo['id']."' AND status=1","id desc");
						if($row)$useraccountmodel->update(array('id'=>$row['id'],'status'=>0));
						$useraccountmodel->save(array('uid'=>$userinfo['puid'],'xid'=>$userinfo['id'],'eid'=>$eid,'money'=>'100','doact'=>-1,'aclog'=>$ename.' 录用您的朋友：'.$userinfo['email'].'被驳回'));
					}
					//发短信
					$str = "系统已驳回“企业".$ename."”对您的录用。您可以登录http://www.shiyishi.cn/修改求职状态";
					$mtsmsmodel = Load::model('mtsms');
					$mtsmsmodel->send($userinfo['mobile'],$str);
				}
				$this->wajaxmsg('成功驳回！',1);
			}else{
				$this->wajaxmsg('参数错误',1);
			}
		}
		$url = $this->getPageUrl().'/enroll.do';
		$s['eid'] = (int)$this->_get('id');
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='s_date'){
				$wheres[] = "a.createdate >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = "a.createdate <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "a.{$key} = '$val'";
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);

		$enrolllogmodel = Load::model('enrolllog');
		$rows = $enrolllogmodel->pageUnionAll($page, 20, $url,'user','a.uid=b.id',$wheres,'a.id desc','a.*,b.email');
		if($s['eid']<=0){
			$s['eid']=$ename='';
		}else{
			$ename = $this->user->getCompanyName($s['eid']);
		}
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('ename',$ename);
		$this->assign('rows', $rows);
		$this->display();
	}


	function addAction(){
		$this->display('user_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!($info = $this->user->find($id))){
			$this->showmsg('您请求的数据不存在',1);
		}
		//$info['password'] = '********';
		$password=$info['password'];
		$info['password'] = '********';
		$this->assign('info', $info);
		$this->assign('password', $password);
		$this->display('p_user_info.tpl');
	}

	function saveAction(){
		$pinfo = $this->_get('info');
		if(!$pinfo['id']){
			$info = $pinfo;
			$info['createtime'] = time();
			$info['lasttime'] = time();
			$info['gip'] = F::onlineip();
			$info['password'] = md5($info['password']);
		}else{
			if(!($info = $this->user->find($pinfo['id']))){
				$this->showmsg('您请求的数据不存在',1);
			}
			if($info['username']==''){
				$tmp_user = $this->user->fetchAll(" username = '".mysql_escape_string(trim($pinfo['username']))."'");
				if(count($tmp_user)){
					$this->showmsg('该用户名已经存在',1);
					exit();
				}
			}


//			if(($info['username']=='' || $info['password']=='') && $pinfo['username']!='' && $info['status']==1){
//				$info['status'] = 2;
//			}
			if(!$this->_get('modpass')){
				unset($info['password']);
			}else{
				$info['password'] = md5($pinfo['password']);
			}

			$info['email'] = $pinfo['email'];
			$info['username'] = $pinfo['username'];
			$info['lasttime'] = time();
		}

		if(($uid = $this->user->save($info)) === false){
			$this->showmsg($this->user->getError(),1,"380");
		}
		$this->showmsg('操作成功','list.do');
	}

	function checkAction(){
		$ids = $this->_get('ids');
		$status = $this->_get('status');
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		$this->user->update(array('status'=>$status),"id IN (".implode(',',$ids).")");
		$this->wajaxmsg('操作成功',1);
	}

	function usersubdelAction(){
		$ids = $this->_get('ids');
		$cid = intval($this->_get('cid'));
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		foreach($ids as $k => $v){
			$rowCount = $this->subcompany->remove($v);
		}
		//$this->user->update(array('status'=>$status),"id IN (".implode(',',$ids).")");
		$this->wajaxmsg('操作成功',1);
	}

	function delAction(){
		$id = $this->_get('id');
		$rowCount = $this->user->remove($id);
		if(!$rowCount){
			if($rowCount === false)
				$this->wajaxmsg($this->user->getError());
			else
				$this->showmsg('您请求的数据不存在','list.do');
		}
		$sql = " delete from ".$this->dbpre."jobs  where cid = ".intval($id)." " ;
		$this->jobs->queryAll($sql);
    	$this->showmsg('删除成功','list.do');
	}

	function removeAction(){
		$id = intval($this->_get('id'));
		$info = $this->user->find($id);
		if($info['id']){
			$info['status'] = -1;
			$info['username'] = '';
			$info['password'] = '';
			if(($uid = $this->user->save($info)) === false){
				$this->showmsg($this->user->getError(),1,"380");
			}
			$sql = " update ".$this->dbpre."jobs set status = 0  where cid = ".$info['id']." " ;
			$this->jobs->queryAll($sql);
			$this->showmsg('删除成功','list.do');
		}else{
			$this->showmsg('您请求的数据不存在','list.do');
		}
	}

	function passAction(){
		$id = intval($this->_get('id'));
		$info = $this->user->find($id);
		if($info['id']){
			if($info['status'] == 1){
				$info['status'] = 2;
			}else{
				$info['status'] = 1;
			}
			if(($uid = $this->user->save($info)) === false){
				$this->showmsg($this->user->getError(),1,"380");
			}
			$this->showmsg('审核成功','list.do');
		}else{
			$this->showmsg('您请求的数据不存在','list.do');
		}
	}



	function userjobAction(){
		$cid = intval(trim($this->_get('cid')));
		if($cid){
			$url = $this->getPageUrl().'/userjob.do?cid='.$cid;
			//$s['jid'] = trim($this->_get('jid'));
			$s['startdate'] = $this->_get('startdate');
			$s['enddate'] = $this->_get('enddate');
			$s['title'] = $this->_get('title');
			$page = $this->_get('page',1);
			$urls = $wheres = array();
			$sdate = 'createtime';
			$orderby = 'id DESC';
			foreach($s as $key=>$val){
				if(!$val)continue;
				$urls[] = $key.'='.$val;
				if($key=='startdate'){
					$wheres[] = $sdate." >= ".strtotime($val.' 00:00:00');
				}elseif($key=='enddate'){
					$wheres[] = $sdate." <= ".strtotime($val.' 23:59:59');
				}else{
					$wheres[] = "$key LIKE '%".$val."%'";
				}
			}
			$wheres[] = " cid = ".$cid." ";
			$url .= implode('&',$urls);
			$rows = $this->jobs->pageAll($page, 20, $url,$wheres,$orderby);

			$this->assign('page',$page);
			$this->assign('cid',$cid);
			$this->assign('s',$s);
			$this->assign('rows', $rows);
			$this->assign('turl',$url.'&page='.$page);
			$this->display('userjobs_list.tpl');	
		}else{
			$this->wajaxmsg('您请求的数据不存在');
		}
	}

	function userareaAction(){
		$cid = intval(trim($this->_get('cid')));
		if($cid){
			$pid = intval(trim($this->_get('pid')));
			$cityid = intval(trim($this->_get('cityid')));
			$url = $this->getPageUrl().'/userarea.do?cid='.$cid;
			//$s['jid'] = trim($this->_get('jid'));
			$s['startdate'] = $this->_get('startdate');
			$s['enddate'] = $this->_get('enddate');
			$s['title'] = $this->_get('title');
			$page = $this->_get('page',1);
			$urls = $wheres = array();
			$sdate = 'createtime';
			$orderby = 'id DESC';
			foreach($s as $key=>$val){
				if(!$val)continue;
				$urls[] = $key.'='.$val;
				if($key=='startdate'){
					$wheres[] = $sdate." >= ".strtotime($val.' 00:00:00');
				}elseif($key=='enddate'){
					$wheres[] = $sdate." <= ".strtotime($val.' 23:59:59');
				}else{
					$wheres[] = "$key LIKE '%".$val."%'";
				}
			}
			$wheres[] = " cid = ".$cid." ";
			$url .= implode('&',$urls);
			if($pid){
				$wheres[] = " live_gnd_p = ".$pid." ";
				$url .= '&pid='.$pid;
			}
			if($cityid){
				$wheres[] = " live_gnd_c = ".$cityid." ";
				$url .= '&cityid='.$cityid;
			}
			$rows = $this->jobs->pageAll($page, 20, $url,$wheres,$orderby);

			$this->assign('page',$page);
			$this->assign('cid',$cid);
			$this->assign('s',$s);
			$this->assign('rows', $rows);
			$this->assign('turl',$url.'&page='.$page);
			$this->display('userarea_list.tpl');		
		}else{
			$this->wajaxmsg('您请求的数据不存在');
		}
	}

	function removejobsAction(){
		$ids = $this->_get('ids');
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		foreach($ids as $k => $v){
			$rowCount = $this->jobs->remove($v);
		}
		$this->wajaxmsg('操作成功',1);
	}

	function usersubAction(){
		$cid = intval(trim($this->_get('cid')));
		if($cid){
			$url = $this->getPageUrl().'/usersub.do?cid='.$cid;
			$orderby = 'id DESC';
			$wheres = " cid = ".$cid." ";
			$rows = $this->subcompany->pageAll(1, 2000, $url,$wheres,$orderby);
			$this->assign('cid',$cid);
			$this->assign('rows', $rows);
			$this->display('usersub_list.tpl');		
		}else{
			$this->wajaxmsg('您请求的数据不存在');
		}
	}

	function infoAction(){
		$id = intval($this->_get('id'));
		if($id){
			$user = $this->user->find($id);
			$aldatasall = $this->cache->getAreaDatas('area_citys');
			if($user['live_gnd_c']>0){
				$aldatas = $aldatasall[$user['live_gnd_p']];
				$this->assign('aldatas',$aldatas);
			}

			if(strpos($user['dustrytype'],",")===false){
				if($user['dustrytype'])
					$darray[0] = $user['dustrytype'];
			}else{
				$darray = explode(",",$user['dustrytype']);
			}

			$undtdata = array();
			$dtdata = array();
			if($darray){
				foreach($this->dtdata as $k => $v){
					if(in_array($v['id'],$darray)){
						$undtdata[] = $v;
					}else{
						$dtdata[] = $v;
					}
				}
			}else{
				$dtdata = $this->dtdata;
			}

			$image = explode("|||",$user['durl']);

			$this->assign('companyscales',$this->companyscales['cn']);
			$this->assign('companytypes',$this->companytypes['cn']);
			$this->assign('companyproperties',$this->companyproperties['cn']);
			$this->assign('adatas',$this->adata);
			$this->assign('dtdatas',$dtdata);
			$this->assign('undtdata',$undtdata);
			$this->assign('image',$image);
			$this->assign('img_domain',IMG_DOMAIN."/");
			$this->assign('info',$user);
			$this->display('company_info.tpl');
		}else{
			$this->wajaxmsg('您请求的数据不存在');
		}
	}

}
?>