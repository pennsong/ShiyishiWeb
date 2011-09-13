<?php
class userlog_Model extends Model{
	function init(){
		$this->userlog = Load::table('user_log');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->userlog->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->userlog->find($id);
	}

	function remove($id){
		$this->userlog->delete($id);
		$userlogext = Load::model('userlogext');
		return $userlogext->remove($id);
	}

	function removeBy($where){
		return $this->userlog->removeBy($where);
	}

	function fetchRow($where){
		return $this->userlog->fetchRow($where);
	}
}
?>