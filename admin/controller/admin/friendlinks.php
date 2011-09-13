<?php
class friendlinks_Controller extends Controller{

	function init(){
		$this->friendlinks = Load::model('friendlinks');
		$this->flstatus = array('0'=>'无效','1'=>'有效');
		$this->assign('status',$this->flstatus);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$page = $this->_get('page',1);
		$s['catid'] = $this->_get('catid','');
		$s['status'] = $this->_get('status','');
		$s['s_date'] = trim($this->_get('s_date'));
		$s['e_date'] = trim($this->_get('e_date'));
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if($val=='')continue;
			$urls[] = $key.'='.$val;
			if($key=='s_date'){
				$wheres[] = "startdate >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = "enddate <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->friendlinks->pageAll($page, 20, $url,$wheres,'status desc,displayorder asc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['status'] = $this->flstatus[$val['status']];
			$rows[$key]['startdate'] = date("Y-m-d",$val['startdate']);
			$rows[$key]['enddate'] = $val['enddate']>0&&$val['enddate']<2000000000 ? date("Y-m-d",$val['enddate']) : '长期';
		}	
		$page = $this->_get('page');
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$this->assign('info', array('startdate'=>date("Y-m-d")));
		$this->display('friendlinks_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->friendlinks->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}

		$info['startdate'] = date("Y-m-d",$info['startdate']);
		$info['enddate'] = $info['enddate']>0&&$val['enddate']<2000000000 ? date("Y-m-d",$info['enddate']) : '';
		$this->assign('info', $info);
		$this->display('friendlinks_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$info['catid'] = 0;
		$info['startdate'] = empty($info['startdate']) ? time() : strtotime($info['startdate'].' 00:00:00');
		$info['enddate'] = empty($info['enddate']) ? '2000000000' : strtotime($info['enddate'].' 23:59:59');

		if($this->friendlinks->save($info) === false){
			$this->showmsg($this->friendlinks->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->friendlinks->order($orderid) === false){
			$this->wajaxmsg($this->friendlinks->getError(),1);
		}
		$this->wajaxmsg('操作成功',1);
	}

	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->friendlinks->remove($id)){
			if($rowCount === false)
				$this->wajaxmsg($this->friendlinks->getError());
			else
				$this->wajaxmsg('您请求的数据不存在');
		}
		$this->wajaxmsg('删除成功',1);
	}
}
?>