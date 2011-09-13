<?php
class mailtask_Model extends Model{
	function init(){
		$this->mailtask = Load::table('mailtask');
		$this->cache_file = Load::lib('cache_file');
		$this->key = 'mailtask';
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->mailtask->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->mailtask->find($id);
	}

	function fetchAll($where,$order=null){
		return $this->mailtask->fetchAll($where,$order);
	}

	function remove($id){
		return $this->mailtask->delete($id);
	}

	function fetchRow($where){
		return $this->mailtask->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->mailtask->removeBy($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		if($this->mailtask->save($info)===false){
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
			$ut = explode(",",$item['usertype']);
			foreach($ut as $u){
				$rows[$item['action'].$u] = $item;
			}
		}
		$this->cache_file->set($key,$rows);
		if($return) return $rows;
	}
}
?>