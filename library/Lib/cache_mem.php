<?php
class cache_mem_Lib{
	private $_mem = null;
	private $_expires = 86400;
	private $_prefix = '';
	function __construct(array $config){
		if(!empty($config['expires'])){
			$this->_expires = $config['expires'];
		}
		if(!empty($config['prefix'])){
			$this->_prefix = $config['prefix'];
		}
		$this->_mem = new Memcache;
		foreach($config['servers'] as $server){
			$this->_mem->addServer($server['host'], $server['port'],true,$server['weight']);
		}
	}

	function get($key){
		return $this->_mem->get($key);
	}

	function set($key, $value = null, $expires = null){
		$expires = $expires ?  $expires: $this->_expires;
		if($this->_mem->set($key, $value,MEMCACHE_COMPRESSED,$expires)){
			//$mem_allkeys_value = array();
			//$mem_allkeys_value = $this->_mem->get($this->_prefix.'allkeys');
			//$mem_allkeys_value[$key] = $expires == 0 ? 0 : time()+$expires;
			//$this->_mem->set($this->_prefix.'allkeys',$mem_allkeys_value,MEMCACHE_COMPRESSED,0);
			return true;
		}else{
			return false;
		}
	}

	function remove($key = null){
		if($key === null){
			return $this->_mem->flush();
		}else{
			if($this->_mem->delete($key)){
				//$mem_allkeys_value = $this->_mem->get($this->_prefix.'allkeys');
				//unset($mem_allkeys_value[$key]);
				//$this->_mem->set($this->_prefix.'allkeys',$mem_allkeys_value,MEMCACHE_COMPRESSED,0);
				return true;
			}else{
				return false;
			}
		}
	}

	function reset($key, $value = null, $expires = null){
		if($this->remove($key)){
			return $this->set($key, $value, $expires);
		}else{
			return false;
		}
	}
}

?>
