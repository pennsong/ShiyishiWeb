<?php
class user_bank_Model extends Model{
	
	function init(){
		$this->user_bank = Load::table('user_bank');
	}

	function find($id){
		return $this->user_bank->find($id);
	}

	function fetchRow($where=null){
		return $this->user_bank->fetchRow($where);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->user_bank->fetchAll($where, $order, $fields, $limit,$groupby);
	}
	
	function save($info){
		return $this->user_bank->save($info);
	}

	function update($info,$where=null){
		return $this->user_bank->update($info,$where);
	}

	function insert($info){
		return $this->user_bank->save($info);
	}
}
?>