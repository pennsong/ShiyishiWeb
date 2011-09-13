<?php
class friendlinks_Model extends Model{
	function init(){
		$this->friendlinks = Load::table('friendlinks');
		$this->cache_file = Load::lib('cache_file');
		$this->key = 'friendlinks';
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->friendlinks->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->friendlinks->find($id);
	}

	function all($where=null,$order='id ASC'){		
		return $this->friendlinks->fetchAll($where, $order);
	}

	function remove($id){
		$return = $this->friendlinks->delete($id);
		$this->flushcache();
		return $return;
	}

	function fetchRow($where){
		return $this->friendlinks->fetchRow($where);
	}

	function update($info,$where=null){
		$return = $this->friendlinks->update($info,$where);
		return $return;
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->friendlinks->update(array('id' => $id, 'displayorder' => $orderid));
		}
		$this->flushcache();
		return true;
	}
	
	function removeBy($where){
		$return = $this->friendlinks->removeBy($where);
		$this->flushcache();
		return $return;
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		$return = $this->friendlinks->save($info);
		$this->flushcache();
		return $return;
	}

	function getcache(){
		if(!$row = $this->cache->get($this->key)){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$rows = $this->all('enddate>UNIX_TIMESTAMP(NOW()) AND startdate<=UNIX_TIMESTAMP(NOW())','displayorder asc');
		$newrows = array();
		foreach($rows as $row){
			if($row['status']!=1)continue;
			if($row['linkimg']!=''){
				$newrows['img'][$row['id']] = $row;
			}else{
				$newrows['txt'][$row['id']] = $row;
			}
		}
		$this->cache_file->set($key,$newrows);
		if($return) return $rows;
	}
}
?>