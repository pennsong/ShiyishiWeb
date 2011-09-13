<?php
class ads_Model extends Model{
	function init(){
		$this->ads = Load::table('ads');
		$this->cache_file = Load::lib('cache_file');
		$this->key = 'ads';
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->ads->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->ads->find($id);
	}

	function all($where=null){		
		return $this->ads->fetchAll($where, 'id ASC');
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->ads->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function remove($id){
		$return = $this->ads->delete($id);
		$this->flushcache();
		return $return;
	}

	function fetchRow($where){
		return $this->ads->fetchRow($where);
	}
	
	function removeBy($where){
		$return = $this->ads->removeBy($where);
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
		$return = $this->ads->save($info);
		$this->flushcache();
		return $return;
	}

	function convertToCode($adtype, $params) {
		$code='';
		if($adtype==1) {
			$code='<a href="'.$params['font_href'].'" target="_blank"><span style="font-size:'.$params['font_size'].'px;">'.$params['font_title'].'</span></a>';
		} elseif($adtype==2) {
			$code='<a href="'.$params['img_href'].'" title="'.$params['img_title'].'" target="_blank"><img src="'.$params['img_src'].'" width="'.$params['img_width'].'" height="'.$params['img_height'].'" /></a>';
		} elseif($adtype==3) {
			$code='<embed width="'.$params['flash_width'].'" height="'.$params['flash_height'].'" src="'.$params['flash_src'].'" type="application/x-shockwave-flash"></embed>';
		} elseif($adtype==4) {
			$code=$params['code'];
		}
		return $code;
	}

	function getcache(){
		if(!$row = $this->cache->get($this->key)){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$rows = $this->fetchAll('endtime>UNIX_TIMESTAMP(NOW()) AND begintime<=UNIX_TIMESTAMP(NOW())','id asc','adplace,cityids,code');
		$newrows = array();
		foreach($rows as $row){
			$tmp = explode(",",trim($row['cityids'],','));
			foreach($tmp as $cityid){
				$newrows[$row['adplace']][$cityid] = $row['code'];
			}
		}
		$this->cache_file->set($key,$newrows);
		if($return) return $rows;
	}
}
?>