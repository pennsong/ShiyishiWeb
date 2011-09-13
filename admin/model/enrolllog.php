<?php
class enrolllog_Model extends Model{
	
	function init(){
		$this->enrolllog = Load::table('enrolllog');
	}

	function find($id){
		return $this->enrolllog->find($id);
	}

	function fetchRow($where=null){
		return $this->enrolllog->fetchRow($where);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->enrolllog->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->enrolllog->pageAll($page, $count, $url, $where, $order);
	}

	function pageUnionAll($page, $count, $url,$rtable,$on, $where = null, $order = null,$field=null){
		return $this->enrolllog->pageUnionAll($page, $count, $url,$rtable,$on, $where, $order,$field);
	}
	
	function save($info){
		return $this->enrolllog->save($info);
	}

	function update($info,$where=null){
		return $this->enrolllog->update($info,$where);
	}

	function insert($info){
		return $this->enrolllog->save($info);
	}
}
?>