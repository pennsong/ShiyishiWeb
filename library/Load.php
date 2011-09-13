<?php
/**
 * App Framework
 * write by kinglv 2009-3-1
 */

class Load
{
	public static function conf($file,$once=false){
		if(strpos($file,":")){
			$tmp = explode(":",$file);
			$file = $tmp[0].'.php';
			$key = $tmp[1];
		}else{
			$key = false;
			$file .= '.php';
		}
		
		$filename = APP_CONF_DIR.'/'.$file;
		if($once){
			$result = include_once($filename);
		}else{
			$result = include($filename);
		}
		return $key?$result[$key]:$result;
	}

	public static function db($db = null, $instance = true){
		if(!$db){
			if(defined('DEFAULT_DB')){
				$db = DEFAULT_DB;
			}else{
				throw new APP_Exception("'DEFAULT_DB' not defined.");
			}
		}
		$key = '_db_'.$db;
		if($instance && R::get($key) !== null){
			return R::get($key);
		}
		$dbconfig = self::conf('db');
		if(!isset($dbconfig[$db])){
			throw new APP_Exception("dbconfig($db) not set.");
		}
		require_once KFW_CORE_DIR.'/Db.php';
		$dbconfig = $dbconfig[$db];
		$db = new APP_Db($dbconfig);
		return $instance ? R::set($key, $db) : $db;
	}

	public static function table($table, $db = null){
		if($db === null){
			$db = self::db();
		}elseif(is_string($db)){
			$db = self::db($db);
		}
		require_once KFW_CORE_DIR.'/Db.Table.php';
		return new APP_Db_Table(array('name'=> $table, 'db'=> $db));
	}
	
	public static function lib(){
		$args = func_get_args();
		$file = array_shift($args);
		$class = $file.'_Lib';
		return self::loadClass($file, $class, $args, array(APP_LIB_DIR, KFW_CORE_DIR.'/Lib'));
	}

	public static function model(){
		$args = func_get_args();
		$file = array_shift($args);
		if(strpos($file,":")){
			$tmp = explode(":",$file);
			$file = $tmp[1];
			$key = $tmp[0];
		}else{
			$key = false;
		}
		$class = $file.'_Model';
		if($key=='index'){
			$dir1 = str_replace("/admin","/index",APP_ROOT_DIR);
		}elseif($key=='admin'){
			$dir1 = str_replace("/index","/admin",APP_ROOT_DIR);
		}else{
			$dir1 = APP_ROOT_DIR;
		}
		return self::loadClass($file, $class, $args, $dir1.'/model');
	}

	public static function loadClass($file, $class, $args = array(), $dirs = null){
		if(@self::loadFile($file, $dirs, true)==false){
			return false;
		}
		$args_str = array();
		foreach($args as $key => $v){
			$args_str[] = "\$args[$key]";
		}
		$args_str = implode(',',$args_str);
		eval("\$class = new $class($args_str);");
		return $class;
	}

	public static function loadFile($file, $dirs = null, $once = false){
		$file .= '.php';
		if ($dirs !== null) {
			$dirs = (array) $dirs;
			foreach($dirs as $dir){
				$filename = $dir.'/'.$file;
				if(file_exists($filename)){
					break;
				}
			}
		}
		if($once){
			$result = include_once($filename);
		}else{
			$result = include($filename);
		}
		return $result;
	}

	public static function UC($file='client', $once = true){
		$file .= '.php';
		$dir = KFW_CORE_DIR.'/Ucenter';
		$filename = $dir.'/'.$file;

		if($once){
			include_once($filename);
		}else{
			include($filename);
		}
	}
}
