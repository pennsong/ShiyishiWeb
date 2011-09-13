<?php
class netbank_Model extends Model{
	function init(){
		$this->netbank = Load::table('netbank');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->netbank->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where,$order=null){
		return $this->netbank->fetchAll($where, $order);
	}

	function find($id){
		return $this->netbank->find($id);
	}

	function remove($id){
		return $this->netbank->delete($id);
	}

	function fetchRow($where){
		return $this->netbank->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->netbank->removeBy($where);
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->netbank->update(array('id' => $id, 'displayorder' => $orderid));
		}
		return true;
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		return $this->netbank->save($info);
	}
}
?>