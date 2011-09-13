<?php
class adminlogext_Model extends Model{
	function init(){
		$this->adminlogext = Load::table('admin_log_ext');
	}

	function find($id){
		return $this->adminlogext->find($id);
	}

	function remove($id){
		return $this->adminlogext->delete($id);
	}

	function save($data){
		$this->adminlogext->save($data);
	}

	function fetchRow($where){
		return $this->adminlogext->fetchRow($where);
	}
}
?>