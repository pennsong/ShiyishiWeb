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
 * Name:     truncate<br>
 * Purpose:  Truncate a string to a certain length if necessary,
 *           optionally splitting in the middle of a word, and
 *           appending the $etc string or inserting $etc into the middle.
 * @link http://smarty.php.net/manual/en/language.modifier.truncate.php
 *          truncate (Smarty online manual)
 * @author   Monte Ohrt <monte at ohrt dot com>
 * @param string
 * @param integer
 * @param string
 * @param boolean
 * @param boolean
 * @return string
 */
function smarty_modifier_truncate($string, $length = 80, $etc = '...', $middle = false)
{
	if ($length == 0)
		return '';
	$string = strip_tags($string);
	$string = str_replace(array("\r\n","&nbsp;"),array(" "," "),$string);
	if (strlen($string) > $length) {
		$length -= strlen($etc);
		if(!$middle) {
			return smarty_truncate_cnsubstr($string, 0, $length).$etc;
		} else {
			return smarty_truncate_cnsubstr($string, 0, $length/2) . $etc . smarty_truncate_cnsubstr($string, -$length/2);
		}
	} else {
		return $string;
	}
}

function smarty_truncate_cnsubstr($str,$start,$len)
{
	$tmp = '';
	for($i=0;$i<$start+$len;$i++){
		$tmpstr=(ord($str[$i])>=161 && ord($str[$i])<=254&& ord($str[$i+1])>=161 && ord($str[$i+1])<=254)?$str[$i].$str[++$i]:$tmpstr=$str[$i];
		if ($i>=$start&&$i<($start+$len))$tmp .=$tmpstr;
	}
	return $tmp;
}

/* vim: set expandtab: */

?>
