<?php
error_reporting(0);
date_default_timezone_set("Asia/Shanghai");
function getmicrotime()
{
    list($usec, $sec) = explode(" ",microtime());
    return ((float)$usec + (float)$sec);
}
$time_start = getmicrotime();

define('DEBUG_MODE',1 );
define('DEFAULT_DB','default');
define('DEFAULT_BASE','default');
define('APP_ROOT_DIR', dirname(dirname(__FILE__)));
require '../../library/Init.php';
$session = Load::lib('session');
$session->initSess();
$font = APP_Front::getInstance();
$font->run();
phpinfo();exit;
?>