<?php
date_default_timezone_set('Asia/Chongqing');

if(!defined('APP_ROOT_DIR')){
	exit("Not defined APP_ROOT_DIR.");
}
define('KFW_CORE_DIR', dirname(__FILE__));
define('ROOT_PATH', dirname(dirname(__FILE__)));
if(!defined('DEBUG_MODE')) define('DEBUG_MODE', 0);
define('APP_CTRL_DIR', APP_ROOT_DIR.'/controller');
define('APP_LIB_DIR', APP_ROOT_DIR.'/lib');
define('APP_TMP_DIR', APP_ROOT_DIR.'/tmp');
define('APP_TPL_DIR', APP_ROOT_DIR.'/templates');
define('APP_DATA_DIR', APP_ROOT_DIR.'/../data');
define('APP_CACHE_DIR', APP_DATA_DIR.'/cache');
define('APP_CONF_DIR', APP_DATA_DIR.'/conf');
define('APP_MODUL_NAME', str_replace(ROOT_PATH,'',APP_ROOT_DIR));
define('ATTACHMENT_DIR', 'attachment');
define('APP_UPLOAD_DIR', APP_DATA_DIR.'/'.ATTACHMENT_DIR);
require KFW_CORE_DIR.'/Smarty/Smarty.class.php';

if(!DEBUG_MODE && file_exists(APP_TMP_DIR.'/~run.php')) {
	require APP_TMP_DIR.'/~run.php';
}else{
	require APP_CONF_DIR.'/config.php';
	require KFW_CORE_DIR.'/Exception.php';
	require KFW_CORE_DIR.'/Front.php';
	require KFW_CORE_DIR.'/Controller.php';
	require KFW_CORE_DIR.'/Request.php';
	require KFW_CORE_DIR.'/Response.php';
	require KFW_CORE_DIR.'/Model.php';
	require KFW_CORE_DIR.'/Load.php';
	require KFW_CORE_DIR.'/F.php';
	require KFW_CORE_DIR.'/R.php';
	//require KFW_CORE_DIR.'/Smarty/Smarty.class.php';
	require KFW_CORE_DIR.'/Template.php';

	if(DEBUG_MODE > 1){
		F::rmdir(APP_TMP_DIR.'/*');
	}
	F::mkdir(APP_TMP_DIR);
	
	$content  = php_strip_whitespace(APP_CONF_DIR.'/config.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Exception.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Front.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Controller.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Request.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Response.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Model.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Load.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/F.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/R.php');
	//$content .= php_strip_whitespace(KFW_CORE_DIR.'/Smarty/Smarty.class.php');
	$content .= php_strip_whitespace(KFW_CORE_DIR.'/Template.php');
	$content = "<?php\n".str_replace(array('<?php','?>'),'',$content)."\n?>";
	file_put_contents(APP_TMP_DIR.'/~run.php', $content);
	unset($content);
	
}
//$font = APP_Front::getInstance();
//$font->run();
?>