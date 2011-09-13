<?php
class chargecard_Model extends Model{
	function init(){
		$this->chargecard = Load::table('chargecard');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->chargecard->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where,$order=null,$field=null,$limit=null){
		return $this->chargecard->fetchAll($where,$order,$field,$limit);
	}

	function find($id){
		return $this->chargecard->find($id);
	}

	function remove($id){
		return $this->chargecard->delete($id);
	}

	function fetchRow($where,$order=null,$field='*'){
		return $this->chargecard->fetchRow($where,$order,$field);
	}
	
	function removeBy($where){
		return $this->chargecard->removeBy($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		return $this->chargecard->save($info);
	}

	function update($info,$where=null){
		return $this->chargecard->update($info,$where);
	}
}
?>