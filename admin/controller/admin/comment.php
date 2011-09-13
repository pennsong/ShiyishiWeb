<?php
class comment_Controller extends Controller{

	function init(){
		$this->comment = Load::model('comment');
		$this->show = Load::model('show');
		$this->types = array('showcm'=>array(1,'演出'),'venuecm'=>array(2,'场馆'));
		$this->typeid = $this->types[$this->_request->getControllerUName()][0];
		$this->typename = $this->types[$this->_request->getControllerUName()][1];
		$this->assign('typename', $this->typename);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$status = (int)$this->_get('status',0);
		$url = $this->getPageUrl().'/list.do?status='.$status;
		$s['itemid'] = $this->_get('itemid');
		$s['startdate'] = $this->_get('startdate');
		$s['enddate'] = $this->_get('enddate');
		$s['kw'] = trim($this->_get('kw'));
		$urls = $wheres = array();
		$wheres[] = "a.typeid='".$this->typeid."'";
		foreach($s as $key=>$val){
			if($val){
				$urls[] = $key.'='.urlencode($val);
				if($key=='startdate'){
					$wheres[] = "a.createdate > '{$val} 00:00:00'";
				}elseif($key=='enddate'){
					$wheres[] = "a.createdate <= '{$val} 23:59:59'";
				}elseif($key=='kw'){
					$wheres[] = "a.content LIKE '%$val%'";
				}else{
					$wheres[] = "a.$key = '$val'";
				}
			}
		}
		$wheres[] = "a.status = '".$status."'";
		$url .= !empty($urls) ? '?'.implode('&',$urls) : '';
		$page = $this->_get('page',1);
		$rows = $this->comment->pageUnionAll($page, 20, $url,'user','a.uid=b.id',$wheres,'id desc','a.*,b.username,b.email,b.userphoto');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['itemname'] = $this->show->getName($val['itemid']);
			$rows[$key]['content'] = str_replace("\n","，",$val['content']);
			$rows[$key]['createdate'] = $val['createdate'];
		}
		$s['status'] = $status;
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->assign('turl',$url.'&page='.$page);
		$this->display();
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->comment->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$this->assign('info', $info);
		$this->display('comment_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->comment->save($info) === false){
			$this->showmsg($this->comment->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function checkAction(){
		$ids = $this->_get('ids');
		$isactive = $this->_get('status');
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		if($isactive==10){
			$this->comment->removeBy("id IN (".implode(',',$ids).")");
			$this->wajaxmsg('批量删除成功',1);
		}else{
			$this->comment->update(array('status'=>$isactive),"id IN (".implode(',',$ids).")");
			$this->wajaxmsg('操作成功',1);
		}
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->comment->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->comment->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功',"list.do?page=$page");
	}
}
?>