<?php
class order_Model extends Model{
	function init(){
		$this->order = Load::table('order');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->order->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where,$order=null,$field=null,$limit=null){
		return $this->order->fetchAll($where, $order,$field,$limit);
	}

	function find($id){
		return $this->order->find($id);
	}

	function remove($id){
		return $this->order->update(array('id'=>$id,'status'=>'hide'));
	}

	function fetchRow($where=null,$order=null,$field='*'){
		return $this->order->fetchRow($where,$order,$field);
	}

	function count($where=null){
		return $this->order->count($where);
	}
	
	function removeBy($where){
		return $this->order->removeBy($where);
	}

	function save($info){
		return $this->order->save($info);
	}

	function update($info,$where=null){
		return $this->order->update($info,$where);
	}
}
?>