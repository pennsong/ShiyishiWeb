<?php
error_reporting(E_ERROR|E_WARNING);
date_default_timezone_set('Asia/Chongqing');
define('DEFAULT_DB','default');
define('DEFAULT_BASE','default');
define('ROOT_PATH', dirname(dirname(dirname(dirname(__FILE__)))));
define('KFW_CORE_DIR', ROOT_PATH.'/library');
define('APP_ROOT_DIR', ROOT_PATH.'/index');
define('APP_CTRL_DIR', APP_ROOT_DIR.'/controller');
define('APP_LIB_DIR', APP_ROOT_DIR.'/lib');
define('APP_TMP_DIR', APP_ROOT_DIR.'/tmp');
define('APP_TPL_DIR', APP_ROOT_DIR.'/templates');
define('APP_DATA_DIR', APP_ROOT_DIR.'/../data');
define('APP_CACHE_DIR', APP_DATA_DIR.'/cache');
define('APP_CONF_DIR', APP_DATA_DIR.'/conf');
define('APP_MODUL_NAME', 'index');

require KFW_CORE_DIR.'/Model.php';
require KFW_CORE_DIR.'/Load.php';
require KFW_CORE_DIR.'/R.php';
require KFW_CORE_DIR.'/F.php';
?>