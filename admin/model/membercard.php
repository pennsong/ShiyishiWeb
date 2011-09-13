<?php
class membercard_Model extends Model{
	function init(){
		$this->membercard = Load::table('membercard');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->membercard->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where,$order=null,$field=null,$limit=null){
		return $this->membercard->fetchAll($where,$order,$field,$limit);
	}

	function find($id){
		return $this->membercard->find($id);
	}

	function remove($id){
		return $this->membercard->delete($id);
	}

	function fetchRow($where,$order=null,$field='*'){
		return $this->membercard->fetchRow($where,$order,$field);
	}
	
	function removeBy($where){
		return $this->membercard->removeBy($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		return $this->membercard->save($info);
	}

	function update($info,$where=null){
		return $this->membercard->update($info,$where);
	}
}
?>