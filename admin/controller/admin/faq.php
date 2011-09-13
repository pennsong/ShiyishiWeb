<?php
class faq_Controller extends Controller{

	function init(){
		$this->faq = Load::model('faq');
		$this->faq_cat = Load::model('faq_cat');
		$this->catgory = $this->faq_cat->getcache();
		$this->editor = Load::lib('editor');
		$this->assign('cats',$this->catgory);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['catid'] = $this->_get('catid');
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
			}elseif($key=='kw'){
				$wheres[] = "`subject` LIKE '%$val%'";
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->faq->pageAll($page, 100, $url,$wheres,'id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['catname'] = $this->catgory[$val['catid']]['name'];
		}	
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$content = $this->editor->create();
		$this->assign('info', array('content'=>$content,'createdate'=>date("Y-m-d H:i:s")));
		$this->display('faq_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->faq->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['content'] = $this->editor->create($info['content']);
		$this->assign('info', $info);
		$this->display('faq_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$content = $this->_get('content');
		if(!$content){
			$this->showmsg('内容不能为空！',1);
		}
		if(!$info['id'])$info['adminid'] = $_SESSION['admin_info']['id'];
		$info['content'] = $content;
		$info['keywords'] = F::chars2dou($info['keywords']);
		if($this->faq->save($info) === false){
			$this->showmsg($this->faq->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function checkAction(){
		$ids = $this->_get('ids');
		$catid = $this->_get('catid',0);
		if(empty($ids)){
			$this->wajaxmsg('没有选择要操作的对象');
		}
		if($catid>0){
			$this->faq->update(array('status'=>0),"catid=".$catid);
		}else{
			$this->faq->update(array('status'=>0),"id > 0");
		}
		$this->faq->update(array('status'=>1),"id IN (".implode(',',$ids).")");
		$this->faq->flushcache();
		$this->wajaxmsg('操作成功',1);
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->faq->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->faq->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功',"list.do?page=$page");
	}
}
?>