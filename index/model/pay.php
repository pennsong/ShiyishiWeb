<?php
class pay_Model extends Model{
	
	function init(){
		$this->pay = Load::table('pay');
	}
	
	function fetchAll($where,$order=null){
		return $this->pay->fetchAll($where,$order);
	}

	function find($id){
		return $this->pay->find($id);
	}

	function save($info){
		return $this->pay->save($info);
	}

	function update($info,$where=null){
		return $this->pay->update($info,$where);
	}

	function insert($info){
		return $this->pay->save($info);
	}
}
?>