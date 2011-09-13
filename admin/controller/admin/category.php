<?php
class category_Controller extends Controller{

	function init(){
		$this->cat = Load::model('category');
		$this->assign('citys',$this->cache->getAreaDatas());
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$pid = (int)$this->_get('pid',0);
		if($pid>0){
			$info = $this->cat->find($pid);
			$deep = 3-$info['level'];
		}else{
			$pid = 0;
			$deep = 3;
		}
		$rows = $this->cat->children($pid,$deep);
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->cat->order($orderid) === false){
			$this->showmsg($this->cat->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$cats = $this->cat->children(0,1);
		$info['active'] = 1;
		$this->assign('info', $info);
		$this->assign('cats', $cats);
		$this->display('category_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->cat->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$cats = $this->cat->children(0,1);
		$info['cityids'] = trim($info['cityids'],',');
		$this->assign('cats', $cats);
		$this->assign('info', $info);
		$this->display('category_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(!$info['active'])$info['active']=0;
		if(empty($info['cityids'])){
			$this->showmsg('必须选择一个城市！',1);
		}
		$info['cityids'] = ','.implode(',',$info['cityids']).',';

		if($info['parent_id']>0){
			$info['level'] = 2;
		}else{
			$info['level'] = 1;
		}
		
		if($this->cat->save($info) === false){
			$this->showmsg($this->cat->getError(),1);
		}
		$this->showmsg('操作成功','list.do?pid='.$info['parent_id']);
	}

	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->cat->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->cat->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>