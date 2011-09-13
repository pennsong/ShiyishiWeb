<?php
class mailconfig_Model extends Model{
	function init(){
		$this->mailconfig = Load::table('mailconfig');
		$this->cache_file = Load::lib('cache_file');
		$this->key = 'mail';
	}
	
	function find($id){
		return $this->mailconfig->find($id);
	}

	function fetchRow($where,$order=null){
		return $this->mailconfig->fetchRow($where,$order);
	}

	function fetchAll($where=null,$order='id asc'){
		return $this->mailconfig->fetchAll($where,$order);
	}

	function update($info){		
		return $this->mailconfig->update($info);
	}

	function getcache(){
		if(!$row = $this->cache->get($this->key,'conf')){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$rows = $this->fetchAll();
		foreach($rows as $val){
			$mail[$val['m_type']][$val['m_key']] = $val['m_value'];
		}
		$this->cache_file->set($key,$mail,'conf');
		if($return) return $mail;
	}
}
?>