<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty truncate modifier plugin
 *
 * Type:     modifier<br>
 * Name:     truncate_html<br>
 * @author   tomsui <sui_xiaodong@hotmail.com>
 * @param string
 * @param integer
 * @param string
 * @param boolean invalid
 * @param boolean invalid
 * @return string invalid
 */
function smarty_modifier_substr($string, $length = 80, $etc = '..',$break_words = false, $middle = false)
{
	if ($length == 0) {
	    return '';
	}
	$encoding = mb_detect_encoding($string, array('ASCII', 'GB2312', 'EUC-CN','UTF-8', 'GBK'), false);
	if (mb_strwidth($string, $encoding) > $length) {
		$length -= mb_strwidth($etc, $encoding);
		$tmp_string = mb_strimwidth($string, 0, $length, '', $encoding);
		$string = $tmp_string . $etc;
	} else {
		$string = $string;
	}

	return $string;//mb_convert_encoding($string, 'HTML-ENTITIES' , $encoding);

}

?>
