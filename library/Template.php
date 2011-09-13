<?php
class Template extends Smarty{

	protected static $_instance = null;

	var $left_delimiter = '<!--{';
	var $right_delimiter = '}-->';

	function __construct(){
		$this->template_dir = APP_TPL_DIR;
		$this->compile_dir = APP_TMP_DIR.'/templates';
		$this->register_function("formhash", "smarty_formhash");
	}

	public static function getInstance(){
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}

	function addModuleDir($module){
		$tmpdir = (array) $this->template_dir;
		$tmd[] = APP_TPL_DIR.'/'.$module;
		foreach($tmpdir as $d){
			$tmd[] = $d;
		}
		$this->template_dir = $tmd;
		$this->compile_dir .= '/'.$module;
	}

	function trigger_error($error_msg, $error_code = 500){
		throw new APP_Exception($error_msg, $error_code);
	}
}

function smarty_formhash(){
	$formhash = substr(md5(time()+rand(0,1000)),0,8);
	@setcookie('formhash', $formhash, 0, '/');
	return $formhash;
}
?>