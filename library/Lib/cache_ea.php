<?php

class cache_ea_Lib{
	private $_mem = null;
	private $_lifetime = 3600;
	function get($key){
		return eaccelerator_get($key);
	}

	function set($key, $value = null, $expires = null){
		$expires = is_null($expires) ?  $this->_lifetime : $expires;
		return eaccelerator_put($key, $value, $expires);
	}

	function remove($key = null){
		if($key === null){
			return eaccelerator_gc();
		}else{
			return eaccelerator_rm($key);
		}
	}
}

?>
