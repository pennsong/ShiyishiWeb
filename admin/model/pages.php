<?php
class pages_Model extends Model{
	function init(){
		$this->pages = Load::table('pages');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->pages->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where,$order=null){
		return $this->pages->fetchAll($where, $order);
	}

	function find($id){
		return $this->pages->find($id);
	}

	function remove($id){
		return $this->pages->delete($id);
	}

	function fetchRow($where){
		return $this->pages->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->pages->removeBy($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		return $this->pages->save($info);
	}
}
?>