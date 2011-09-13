<?php
class user_account_Model extends Model{
	function init(){
		$this->user_account = Load::table('user_account');
	}

	function find($id){
		return $this->user_account->find($id);
	}

	function fetchRow($where=null,$order = null,$fields=null){
		return $this->user_account->fetchRow($where,$order,$fields);
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->user_account->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->user_account->fetchAll($where, $order, $fields, $limit,$groupby);
	}
	
	function save($info){
		return $this->user_account->save($info);
	}

	function update($info,$where=null){
		return $this->user_account->update($info,$where);
	}

	function insert($info){
		return $this->user_account->save($info);
	}
}
?>