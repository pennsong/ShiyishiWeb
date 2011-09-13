<?php
class news_Model extends Model{
	function init(){
		$this->news = Load::table('news');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->news->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->news->find($id);
	}

	function remove($id){
		return $this->news->delete($id);
	}

	function fetchRow($where){
		return $this->news->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->news->removeBy($where);
	}

	function save($info){
		return $this->news->save($info);
	}
}
?>