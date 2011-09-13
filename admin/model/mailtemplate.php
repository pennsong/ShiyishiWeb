<?php
class mailtemplate_Model extends Model{
	function init(){
		$this->mailtemplate = Load::table('mailtemplate');
		$this->cache_file = Load::lib('cache_file');
		$this->key = 'mailtemplate';
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->mailtemplate->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->mailtemplate->find($id);
	}

	function fetchAll($where,$order=null){
		return $this->mailtemplate->fetchAll($where,$order);
	}

	function remove($id){
		return $this->mailtemplate->delete($id);
	}

	function fetchRow($where){
		return $this->mailtemplate->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->mailtemplate->removeBy($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		if($this->mailtemplate->save($info)===false){
			return false;
		}else{
			$this->flushcache($this->key);
			return true;
		}
	}

	function getcache(){
		if(!$row = $this->cache_file->get($this->key)){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$items = $this->fetchAll("status='show'",'id ASC');
		if(!$items)return false;
		foreach($items as $item){
			$rows[$item['id']] = $item;
		}
		$this->cache_file->set($key,$rows);
		if($return) return $rows;
	}
}
?>