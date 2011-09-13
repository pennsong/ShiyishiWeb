<?php
class ads_Controller extends Controller{

	function init(){
		$this->ads = Load::model('ads');
		$this->adtypes = array('1'=>'超链接','2'=>'图片','3'=>'Flash','4'=>'html代码');
		$this->assign('adtypes',$this->adtypes);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$rows = $this->ads->pageAll($this->_get('page',1), 20, $url,'','id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['adtype'] = $this->adtypes[$val['adtype']];
			$rows[$key]['begintime'] = date("m-d H:i:s",$val['begintime']);
			$rows[$key]['endtime'] = $val['endtime']>0&&$val['endtime']<2000000000 ? date("m-d H:i:s",$val['endtime']) : '长期';
		}	
		$page = $this->_get('page');
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}
	
	function searchAction(){
		$url = $this->getPageUrl().'/search.do';
		$subject = $this->_get('subject');
		$adtype = $this->_get('adtype');
		$begintime = $this->_get('begintime');
		$endtime = $this->_get('endtime');
		$s = array('subject'=>$subject,'adtype'=>$adtype,'startdate'=>$startdate,'enddate'=>$enddate);
		if(empty($s)){
			$this->_forward('list');
			exit();
		}
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='begintime'){
				$wheres[] = "begintime > '".strtotime($val)."'";
			}elseif($key=='endtime'){
				$wheres[] = "endtime <= '".strtotime($val)."'";
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->ads->pageAll($page, 20, $url,$wheres,'id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['adtype'] = $this->adtypes[$val['adtype']];
			$rows[$key]['begintime'] = date("m-d H:i:s",$val['begintime']);
			$rows[$key]['endtime'] = $val['endtime']>0&&$val['endtime']<2000000000 ? date("m-d H:i:s",$val['endtime']) : '长期';
		}
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display('ads_list.tpl');
	}

	function addAction(){
		$citys = $this->cache->getAreaDatas();
		$citys[0] = array('id'=>0,'name'=>'全国');
		ksort($citys);
		$this->assign('citys',$citys);
		$this->assign('info', array('adtype'=>1,'begintime'=>date("Y-m-d")));
		$this->assign('uploadsimplezone', F::uploadsimplezone());
		$this->display('ads_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->ads->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['cityids'] = explode(',',trim($info['cityids'],','));
		$citys = $this->cache->getAreaDatas();
		$citys[0] = array('id'=>0,'name'=>'全国');
		ksort($citys);
		if(!empty($info['cityids'])){
			foreach($info['cityids'] as $k=>$v){
				$citys[$v]['checked'] = ' checked';
			}
		}
		
		$this->assign('citys',$citys);
		$info['begintime'] = date("Y-m-d",$info['begintime']);
		$info['endtime'] = $info['endtime']>0&&$val['endtime']<2000000000 ? date("Y-m-d",$info['endtime']) : '';
		$info['content'] = unserialize($info['content']);
		$this->assign('info', $info);
		$this->assign('uploadsimplezone', F::uploadsimplezone('smallimg='.urlencode($info['content']['img_src'])));
		$this->display('ads_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$content = $this->_get('content');
		if(empty($info['cityids'])){
			$this->showmsg('必须选择一个城市！',1);
		}
		$info['cityids'] = ','.implode(',',$info['cityids']).',';
		$info['begintime'] = empty($info['begintime']) ? $timestamp : strtotime($info['begintime'].' 00:00:00');
		$info['endtime'] = empty($info['endtime']) ? '2000000000' : strtotime($info['endtime'].' 23:59:59');
		$info['code'] = addslashes(stripslashes($this->ads->convertToCode($info['adtype'], $info['content'])));
		$info['content'] = addslashes(serialize($info['content']));

		if($this->ads->save($info) === false){
			$this->showmsg($this->ads->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function viewAction(){
		$adid = $this->_get('id');
		if(!$info = $this->ads->find($adid)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$this->assign('adid', $info['adplace']);
		$this->assign('textlink', '<!--{datacall id='.$info['adplace'].' cityid=$cityinfo.id}-->');
		$this->display('ads_view.tpl');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->ads->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->ads->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
    	$this->showmsg('操作成功',"list.do?page=$page");
	}
}
?>