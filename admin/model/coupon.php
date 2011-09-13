<?php
class coupon_Model extends Model{
	function init(){
		$this->coupon = Load::table('coupon');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->coupon->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where,$order=null){
		return $this->coupon->fetchAll($where, $order);
	}

	function find($id){
		return $this->coupon->find($id);
	}

	function remove($id){
		return $this->coupon->delete($id);
	}

	function fetchRow($where){
		return $this->coupon->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->coupon->removeBy($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		return $this->coupon->save($info);
	}
}
?>