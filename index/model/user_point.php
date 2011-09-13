<?php
class user_point_Model extends Model{
	function init(){
		$this->user_point = Load::table('user_point');
	}

	function find($id){
		return $this->user_point->find($id);
	}

	function fetchRow($where=null){
		return $this->user_point->fetchRow($where);
	}

	function pageUnionAll($page, $count, $url,$rtable,$on, $where = null, $order = null,$field=null){
		return $this->user_point->pageUnionAll($page, $count, $url,$rtable,$on, $where, $order,$field);
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->user_point->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->user_point->fetchAll($where, $order, $fields, $limit,$groupby);
	}
	
	function save($info){
		return $this->user_point->save($info);
	}

	function update($info,$where=null){
		return $this->user_point->update($info,$where);
	}

	function insert($info){
		return $this->user_point->save($info);
	}
}
?>