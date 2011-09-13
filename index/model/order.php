<?php
class order_Model extends Model{
	
	function init(){
		$this->order = Load::table('order');
	}

	function find($id){
		return $this->order->find($id);
	}

	function fetchRow($where,$order=null){
		return $this->order->fetchRow($where,$order);
	}

	function count($where){
		return $this->order->count($where);
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->order->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->order->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function save($info){
		return $this->order->save($info);
	}

	function update($info,$where=null){
		return $this->order->update($info,$where);
	}

	function insert($info){
		return $this->order->save($info);
	}
}
?>