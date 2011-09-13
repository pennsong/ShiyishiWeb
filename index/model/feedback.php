<?php
class feedback_Model extends Model{
	function init(){
		$this->feedback = Load::table('feedback');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->feedback->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where,$order=null){
		return $this->feedback->fetchAll($where, $order);
	}

	function find($id){
		return $this->feedback->find($id);
	}

	function remove($id){
		return $this->feedback->delete($id);
	}

	function fetchRow($where){
		return $this->feedback->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->feedback->removeBy($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}
		setcookie('formhash', '', -86400, '/');
		return $this->feedback->save($info);
	}
}
?>