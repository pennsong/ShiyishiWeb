<?php
class news_Model extends Model{
	function init(){
		$this->news = Load::table('news');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->news->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->news->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->news->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->news->fetchRow($where, $order, $fields);
	}
}
?>