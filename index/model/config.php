<?php
class config_Model extends Model{
	function init(){
		$this->config = Load::table('config');
		$this->cache = Load::lib('cache','mem');
		$this->cache_file = Load::lib('cache_file');
		$this->key = 'webconfig';
	}
	
	function find($id){
		return $this->config->find($id);
	}

	function save($info){		
		if($this->config->save($info)===false){
			return false;
		}else{
			$this->flushcache($this->key);
			return true;
		}
	}

	function getcache(){
		if(!$row = $this->cache->get($this->key)){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$rows = $this->find(1);
		$this->cache->set($key,$rows);
		$this->cache_file->set($key,$rows);
		$config_str = "//网站根域名\n";
		$config_str .= "define('WEB_DOMAIN', '.".$rows['domain']."');\n";
		$config_str .= "//网站主域名\n";
		$config_str .= "define('BASE_URL', '".$rows['weburl']."');\n";
		$config_str .= "//图片域名\n";
		$config_str .= "define('IMG_DOMAIN', '".$rows['imgurl']."');\n";
		$this->cache_file->set('config',$config_str,'conf');
		if($return) return $rows;
	}

	function flushdbcache($dbinfo){
		$key = 'db';
		$info['default'] = $dbinfo;
		$this->cache_file->set($key,$info,'conf');
	}

	function getName($id){
		$info = $this->find($id);
		return $info['webname'];
	}
}
?>