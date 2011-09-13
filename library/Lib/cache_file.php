<?php
class cache_file_Lib
{
	protected $_cachedir = '';
	protected $_prefix = '';

	/**
	 * 构造函数
	 *
	 * @param 默认的缓存策略 $default_policy
	 */
	function __construct()
	{
		$this->_cachedir = APP_CACHE_DIR.DIRECTORY_SEPARATOR;
		if(!$config = @Load::conf('cache:'.DEFAULT_BASE)){
			throw new APP_Exception("Cache config file not found");
		}
		$this->_prefix = $config['prefix'];
	}

	/**
	 * 写入缓存
	 *
	 * @param string $id
	 * @param mixed $data
	 */
	function set($id, $data, $farm = 'file')
	{
		$data = is_array($data) ? "<?php\nreturn ".var_export($data,true)."\n;?>" : "<?php\n".$data."\n?>";
		$path = $this->_path($id,true,$farm);
		if(file_put_contents($path, $data))
		{
			chmod($path,0777);
			return true;
		}
		else
		{
			return false;
		}
	}

	/**
	 * 读取缓存，失败或缓存撒失效时返回 false
	 *
	 * @param string $id
	 *
	 * @return mixed
	 */
	function get($id, $farm = 'file')
	{
		$path = $this->_path($id, false,$farm);
		//echo $path;exit;
		$data = @include($path);
		return $data;
	}

	/**
	 * 删除指定的缓存
	 *
	 * @param string $id
	 */
	function remove($id = null, $farm = 'file')
	{
		if(is_null($id)){
			$this->_clear($farm);
		}else{
			$path = $this->_path($id, false,$farm);
			exec('rm -f '.$path);
		}
		
	}

	/**
	 * 刷新指定的缓存
	 *
	 * @param string $id
	 */
	function reset($id = null, $data, $farm = 'file')
	{
		$this->remove($id,$farm);
		$this->set($id,$data,$farm);
	}

	/**
	 * 确定缓存文件名，并创建需要的次级缓存目录
	 *
	 * @param string $id
	 * @param boolean $mkdirs
	 *
	 * @return string
	 */
	protected function _path($id, $mkdirs = true,$farm='file')
	{
		
		if($farm=='conf'){
			$filename = $id . '.php';
			$root_dir = APP_CONF_DIR.DIRECTORY_SEPARATOR;
		}else{
			$filename = $this->_prefix . $id . '.php';
			$root_dir = $this->_cachedir.$farm.DIRECTORY_SEPARATOR;
		}
		
		if ($mkdirs && !is_dir($root_dir)){
			$umask = @umask(0);
			@mkdir($root_dir, 0777, true);
			@umask($umask);
		}
		return $root_dir . $filename;
	}

	/**
	 * 删除目录下的所有文件
	 */
	protected function _clear($farm='file') { 
		$dir = $this->_cachedir.$farm.DIRECTORY_SEPARATOR;
		exec('rm -f '.$dir.$this->_prefix.'*');
	}   
}