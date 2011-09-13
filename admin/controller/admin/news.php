<?php
class news_Controller extends Controller{

	function init(){
		$this->news = Load::model('news');
		$this->news_cat = Load::model('news_cat');
		$this->catgory = $this->news_cat->getcache();
		$this->editor = Load::lib('editor');
		$this->assign('cats',$this->catgory);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['catid'] = $this->_get('catid');
		$s['cityid'] = $this->_get('cityid');
		$s['startdate'] = $this->_get('startdate');
		$s['enddate'] = $this->_get('enddate');
		$s['kw'] = trim($this->_get('kw'));
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.urlencode($val);
			if($key=='startdate'){
				$wheres[] = "createdate > '{$val} 00:00:00'";
			}elseif($key=='enddate'){
				$wheres[] = "createdate <= '{$val} 23:59:59'";
			}elseif($key=='cityid'){
				$wheres[] = "cityids LIKE '%,".$val.",%'";
			}elseif($key=='kw'){
				$wheres[] = "`subject` LIKE '%$val%'";
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->news->pageAll($page, 20, $url,$wheres,'id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['catname'] = $this->catgory[$val['catid']];
			$rows[$key]['citys'] = $this->cache->getcitynames(explode(',',trim($val['cityids'],',')));
			$rows[$key]['createdate'] = date("Y-m-d H:i:s",$val['createdate']);
		}	
		$this->assign('citys',$this->cache->getAreaDatas());
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$content = $this->editor->create();
		$this->assign('info', array('content'=>$content,'createdate'=>date("Y-m-d H:i:s")));
		$citys = $this->cache->getAreaDatas();
		$citys[0] = array('id'=>0,'name'=>'全国');
		ksort($citys);
		$this->assign('citys',$citys);
		$this->assign('uploadsimplezone', F::uploadsimplezone('st=1&type=news'));
		$this->display('news_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->news->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['content'] = $this->editor->create($info['content']);

		$info['cityids'] = explode(',',trim($info['cityids'],','));
		$citys = $this->cache->getAreaDatas();
		$citys[0] = array('id'=>0,'name'=>'全国');
		ksort($citys);
		if(!empty($info['cityids'])){
			foreach($info['cityids'] as $k=>$v){
				$citys[$v]['checked'] = ' checked';
			}
		}
		$info['createdate'] = date("Y-m-d H:i:s",$info['createdate']);
		$this->assign('citys',$citys);
		$this->assign('info', $info);
		$this->assign('uploadsimplezone', F::uploadsimplezone('st=1&type=news&smallimg='.urlencode($info['thumb'])));
		$this->display('news_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(empty($info['cityids'])){
			$this->showmsg('必须选择一个城市！',1);
		}
		$content = $this->_get('content');
		if(!$content){
			$this->showmsg('内容不能为空！',1);
		}
		$info['content'] = $content;
		$info['cityids'] = ','.implode(',',$info['cityids']).',';
		$info['keywords'] = F::chars2dou($info['keywords']);
		$info['createdate'] = $info['createdate'] ? strtotime($info['createdate']) : time();
		if($this->news->save($info) === false){
			$this->showmsg($this->news->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->news->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->news->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功',"list.do?page=$page");
	}
}
?>