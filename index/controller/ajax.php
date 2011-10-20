<?php

class ajax_Controller extends Controller{

	function init(){
		$this->mem = Load::lib('cache','mem');
	}
	//根据省份获取城市
	function getcitysbypidAction(){
		$pid = intval($this->_get('pid',0));
		$html = array();
		if($pid>0){
			$areamodel = Load::model('area');
			$prows = $areamodel->fetchAll("parent_id = '".$pid."'","order_id ASC","id,area_name");
			if(!empty($prows)){
				foreach($prows as $k1=>$v1){
					$html[] = $v1['id'].'|'.$v1['area_name'];
				}
			}
		}
		$this->ajaxmsg(implode(":",$html));
	}
	
	function getZhiweileibieAction(){
		$zhiweishuxin = intval($this->_get('zhiweishuxin',0));
		$this->zhiweileibie=Load::model('funtype');
		$rows = $this->zhiweileibie->fetchAll("parent_id=$zhiweishuxin and parent_id<>0");
		if(!empty($rows)){
			foreach($rows as $k1=>$v1){
				$html[] = $v1['id'].'|'.$v1['thename'];
			}
		}
		$this->ajaxmsg(implode(":",$html));
	}
	
	//根据一级分类获取二级分类
	function getsubdatabypidAction(){
		$pid = intval($this->_get('pid',0));
		$type = trim($this->_get('type'));
		$rtype = trim($this->_get('rtype','cn'));
		$html = array();
		if($pid>0){
			if($type=='funtype'){
				$prows = $this->cache->getFuntypeDatas('funtype_level2');
			}elseif($type=='dustrytype'){
				$prows = $this->cache->getDustrytypeDatas('dustrytype_level2');
			}else{
				$prows = $this->cache->getMajorDatas('major_level2');
			}
			$prows = $prows[$pid];
			if(!empty($prows)){
				foreach($prows as $k1=>$v1){
					$html[] = $v1['id'].'|'.($rtype=='cn' ? $v1['name'] : $v1['en']);
				}
			}
		}
		$this->ajaxmsg(implode(":",$html));
	}

	function checkAction(){
		if($username = $this->_get('username')){
			$usermodel = Load::model('user');
			$this->ajaxmsg($usermodel->checkinfo('username',$username));
		}
		if($useremail = $this->_get('useremail')){
			$usermodel = Load::model('user');
			$this->ajaxmsg($usermodel->checkinfo('useremail',$useremail));
		}
		if($username = $this->_get('loginname')){
			$usermodel = Load::model('member');
			$this->ajaxmsg($usermodel->checkinfo('loginname',$username));
		}
	}

	function delmycartAction(){
		$id = $this->_get('id');
		if(empty($id))
			$this->ajaxmsg('fail');
		if(!$this->logininfo['uid']){
			$this->ajaxmsg('fail');
		}
		$shopcartmodel = Load::model('shopcart');
		$info = $shopcartmodel->find($id);
		if(!$info || $info['uid']!=$this->logininfo['uid']){
			$this->ajaxmsg('fail');
		}
		if(!$shopcartmodel->remove($id)){
			$this->ajaxmsg('fail');
		}
		$pticketmodel = Load::model('showticket');
		$tinfo = $pticketmodel->find($info['ticketid']);
		$shopcartnum = $_SESSION['user_info']['shopcartnum'] - 1;
		$shopcartfee = $_SESSION['user_info']['shopcartfee'] - ($tinfo['newprice']*$info['ticketnum']);
		F::setlogininfo('shopcartnum',$shopcartnum);
		F::setlogininfo('shopcartfee',$shopcartfee);
		$this->ajaxmsg('success');
	}

	function showcommentAction(){
		$itemid = (int)$this->_get('itemid');
		$typeid = (int)$this->_get('typeid',1);
		$page = (int)$this->_get('page',1);
		$perpage = 10;
		$start = ($page-1) * $perpage;
		$where = "a.itemid=$itemid AND a.typeid=$typeid AND a.status=1";
		$comments = $prows = $subrows = array();
		$html = '';
		//获取评论
		$commentmodel = Load::model('comment');
		$prows = $commentmodel->fetchUnionAll('user','a.uid=b.id',$where." AND a.pid=0",'order_id DESC,id DESC','a.id,a.uid,a.content,b.username,b.email,b.userphoto',$start.','.$perpage);
		if(!empty($prows)){
			foreach($prows as $k1=>$v1){
				$pids[] = $v1['id'];
				$v1['username'] = $v1['username'] ? $v1['username'] : $v1['email'];
				$v1['userphoto'] = $v1['userphoto'] ? IMG_DOMAIN.'/'.$v1['userphoto'] : BASE_URL.'/images/ad/50x50.jpg';
				$v1['content'] = nl2br($v1['content']);//str_replace("\n","，",$v1['content']);
				$v1['child'] = array();
				$comments[$v1['id']] = $v1;
			}
			$subrows = $commentmodel->fetchUnionAll('user','a.uid=b.id',$where." AND a.pid IN (".implode(',',$pids).")",'order_id DESC','a.id,a.uid,a.content,a.pid,b.username,b.email,b.userphoto');
			foreach($subrows as $k2=>$v2){
				$v2['username'] = $v2['username'] ? $v2['username'] : $v2['email'];
				$v2['userphoto'] = $v2['userphoto'] ? IMG_DOMAIN.'/'.$v2['userphoto'] : BASE_URL.'/images/ad/50x50.jpg';
				$comments[$v2['pid']]['child'][$v2['id']] = $v2;
			}
			$i=1;
			foreach($comments as $item){
				$html .= '<div class="pinglun"'.($i==count($comments) ? ' style="border:none;"' : '').'>';
				$html .= '<img onerror="this.src=\''.BASE_URL.'/images/ad/50x50.jpg\'" src="'.$item['userphoto'].'" />
        <div class="info">'.($item['username']?$item['username']:'网友').'：'.$item['content'].' <a onclick="subComent('.$item['id'].');">回复该评论</a>('.count($item['child']).') </div>
        <div id="pl_view_'.$item['id'].'"'.(count($item['child'])==0 ? ' style="display:none;"' : '').'>
          <div class="global_big_height"></div>
          <div class="fb_k">
            <div class="fb_k0">
              <div class="k">
                <div id="plkuangkuang_'.$item['id'].'" style="display:none;"><textarea class="small_area" id="subcoment_'.$item['id'].'"></textarea>
                <span class="btn"><a onclick="pubcomment($(\'#subcoment_'.$item['id'].'\').val(),'.$item['id'].');">评论</a></span></div>';
				if(count($item['child'])>0){
					foreach($item['child'] as $row){
						$html .= '<div class="small_pinglun"> <img src="'.$row['userphoto'].'" />
					  <div class="info">'.($row['username']?$row['username']:'网友').'：'.$row['content'].' </div>
					</div>';
					}
				}
				$html .= '<div style="clear:both;height:5px;">&nbsp;</div>
              </div>
            </div>
          </div>
        </div></div>';
				$i++;
			}
		}
		$this->ajaxmsg($html);
	}

	function intlistAction(){
		$eid = (int)$this->_get('eid',0);
		if($eid<=0)$this->ajaxmsg("over");
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
		$rows = $vodroomholdmodel->fetchAll("roomid=".$room['id']." AND intdate='".$intdate."'",'logintime ASC');
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
			$html .= '<li><img src="'.BASE_URL.'/images/ms'.$iu['gender'].$iu['online'].'.jpg" align="absmiddle" /> <a href="'.BASE_URL.'/enterp/resume/view.html?uid='.$iu['uid'].'" target="_blank">'.$iu['uname'].'</a>'.($iu['online']=='on'&&$iu['mszt']!='start' ? ' <img src="'.BASE_URL.'/images/ms'.$iu['mszt'].'.jpg" align="absmiddle" />' : '').'</li>';
		}
		$this->ajaxmsg($html);
	}

	function curuserAction(){
		$eid = (int)$this->_get('eid',0);
		if($eid<=0)$this->ajaxmsg("over");
		$nowtime = time();
		$intdate = (int)date("Ymd");
		$uid = (int)$this->_get('uid',0);
		$cachekey1 = 'interview_room_eid_'.$eid.'_date_'.$intdate;
		if(!($room = $this->mem->get($cachekey1))){
			$this->ajaxmsg("over");
		}
		$vodroomholdmodel = Load::model('app_video_interview_mans');
		$row = $vodroomholdmodel->fetchRow("roomid=".$room['id']." AND intdate='".$intdate."' AND status=1");
		if(empty($row)){
			$this->ajaxmsg('wait');
		}
		$resumemodel = Load::model('resume');
		$uname = $resumemodel->getUname($row['uid']);
		$this->ajaxmsg($uname.'|:::|'.$row['uid']);
	}
}
?>