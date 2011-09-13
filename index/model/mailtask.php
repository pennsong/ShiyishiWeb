<?php
class mailtask_Model extends Model{
	function init(){
		$this->mailtask = Load::table('mailtask');
	}

	function find($id){
		return $this->mailtask->find($id);
	}

	function fetchAll($where = null, $order = null,$fields=null){
		$where = (array)$where;
		$where[] = "status='show'";
		return $this->mailtask->fetchAll($where, $order, $fields);
	}

	function fetchRow($where){
		$where = (array)$where;
		$where[] = "status='show'";
		return $this->mailtask->fetchRow($where);
	}
}
?>