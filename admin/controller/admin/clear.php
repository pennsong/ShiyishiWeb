<?php
class clear_Controller extends Controller{

	function init(){
		$this->conf = Load::conf('conf');
		$this->cache_mem = Load::lib('cache','mem');
		$this->cache_file = Load::lib('cache_file');
	}

	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		//读取文件缓存数据
		$caches = array();
		$dir = APP_CACHE_DIR.DIRECTORY_SEPARATOR.'file'.DIRECTORY_SEPARATOR;
		$directory = dir($dir); 
		while($entry = $directory->read()) {
			if(substr($entry,0,3)=='sys'){
				$cachekey = rtrim(substr($entry,4),'.php');
				$caches[$cachekey] = $cachekey;
			}
		} 
		$directory->close(); 
		$this->conf['admin_caches']['cache_file']['fields'] = $caches;
		//读取memcached缓存数据
		$cache_mem_all = $this->cache_mem->get('allkeys');
		$cache_mems = array();
		$thistime = time();
		$cacheconf = Load::conf('cache');
		if(!empty($cache_mem_all)){
			foreach($cache_mem_all as $mkey=>$time){
				$ukey = ltrim($mkey,$cacheconf['prefix']);
				if($thistime < $time){
					if(strlen($ukey)<26)$cache_mems[$ukey] = $mkey;
				}else{
					unset($cache_mem_all[$mkey]);
				}
			}
			$this->cache_mem->set($cacheconf['prefix'].'allkeys',$cache_mem_all);
		}
		$this->conf['admin_caches']['cache_mem']['fields'] = $cache_mems;
		//读取数据表缓存数据
		$this->db = Load::db();

		$this->assign('caches', $this->conf['admin_caches']);
		$this->assign('db_caches', $this->db->listTables());
		$this->display();
	}

	function clearAction(){
		$info = $this->_get('info');
		$caches = $this->_get('caches');
		$dbinfo = $this->_get('dbinfo');
		if(!empty($caches)){
			foreach($caches as $val){
				if(!empty($info[$val])){
					foreach($info[$val] as $ckey){
						$this->$val->remove($ckey);
					}
				}
			}
		}
		if(!empty($dbinfo)){
			foreach($dbinfo as $dbname){
				$dbkey = 'db.job_shiyishi.'.$dbname;
				$this->cache_file->remove($dbkey,'dbs');
			}
		}
		$this->showmsg('缓存清除成功',"list.do");
	}
}
?>