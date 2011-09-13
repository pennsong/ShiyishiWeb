<?php
define('DEBUG_MODE',1 );
define('DEFAULT_DB','default');
define('DEFAULT_BASE','default');
define('APP_ROOT_DIR', dirname(dirname(__FILE__)));
define('APP_CSV_DIR', APP_ROOT_DIR.'/htdocs/csvs');
require '../../library/Init.php';
$session = Load::lib('session');
$session->initSess();
require APP_ROOT_DIR.'/plugin/Init.php';

$font = APP_Front::getInstance();
$font->addPlugin(new Init)->run();
$font->run();
?>