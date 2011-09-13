<?php
class hdp_Controller extends Controller{

	function init(){
		$this->hdp = Load::model('home_hdp');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['cityid'] = (int)$this->_get('cityid');
		$urls = $wheres = array();
		//if($s['cityid']>0){
		$urls[] = 'cityid='.$s['cityid'];
		$wheres[] = "cityids LIKE '%,".$s['cityid'].",%'";
		//}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->hdp->pageAll($page, 20, $url,$wheres,'order_id DESC');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['citys'] = $this->cache->getcitynames(explode(',',trim($val['cityids'],',')));
			$rows[$key]['createdate'] = $val['createdate'];
		}	
		$this->assign('citys',$this->cache->getAreaDatas());
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$citys = $this->cache->getAreaDatas();
		$citys[0] = array('id'=>0,'name'=>'全国');
		ksort($citys);
		$this->assign('citys',$citys);
		$this->assign('info',array('expiredtime'=>date("Y-m-d",time()+86400*30)));
		$this->assign('uploadsimplezone', F::uploadsimplezone('st=1&type=hdp'));
		$this->display('hdp_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->hdp->find($id)){
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
		$info['expiredtime'] = $info['expiredtime']>0 ? date("Y-m-d",$info['expiredtime']) : date("Y-m-d",strtotime($info['createdate'])+86400*30);
		$this->assign('citys',$citys);
		$this->assign('info', $info);
		$this->assign('uploadsimplezone', F::uploadsimplezone('st=1&type=hdp&smallimg='.urlencode($info['piclink'])));
		$this->display('hdp_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(empty($info['cityids'])){
			$this->showmsg('必须选择一个城市！',1);
		}
		$info['cityids'] = ','.implode(',',$info['cityids']).',';
		$info['expiredtime'] = strtotime($info['expiredtime']);
		if($this->hdp->save($info) === false){
			$this->showmsg($this->faq->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->hdp->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->hdp->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功',"list.do?page=$page");
	}
}
?>