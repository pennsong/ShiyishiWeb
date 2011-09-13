<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty rewrite modifier plugin
 *
 * Type:     modifier<br>
 * Name:     rewrite<br>
 * Purpose:  rewrite a url to format,

 * @author   Guoli Yao
 * @param string
 * @param string
 * @return string
 */
function smarty_modifier_rewrite($string, $postfix='do')
{
	if (!$string)
		return '';
	$pos = strrpos($string,'.');
	$string = ($pos ? substr($string,0,$pos) : $string).$postfix;
	return $string;
}
?>
