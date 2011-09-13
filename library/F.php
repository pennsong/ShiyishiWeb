<?php
class F{
	//前台登录信息
	public static function userlogin($data,$utype='member'){
		$_SESSION[$utype.'_info'] = $data;
	}

	//前台清除登录信息 企业则设置$utype='enterp'
	public static function userlogout($utype='member'){
		unset($_SESSION[$utype.'_info']);
	}

	//后台登录信息
	public static function adminlogin($data){
		$_SESSION['admin_info'] = $data;
	}

	//获得用户IP地址
	public static function onlineip(){
		if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
			$onlineip = getenv('HTTP_CLIENT_IP');
		} elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
			$onlineip = getenv('HTTP_X_FORWARDED_FOR');
		} elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
			$onlineip = getenv('REMOTE_ADDR');
		} elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
			$onlineip = $_SERVER['REMOTE_ADDR'];
		}
		return $onlineip;
	}

	//判断用户登录状态
	public static function islogin($utype='member')
	{
		$logininfo = self::logininfo($utype);
		if(isset($logininfo['loginstat'])&&$logininfo['loginstat']==1&&$logininfo['uid']){
			return true;
		}
		return false;
	}

	public static function logininfo($utype='member'){
		return $_SESSION[$utype.'_info'];
	}

	public static function setlogininfo($key,$val,$utype='member'){
		$_SESSION[$utype.'_info'][$key] = $val;
	}

	public static function gethost(){
		if (isset($_SERVER['HTTP_HOST'])) {
			$serverUrl = $_SERVER['HTTP_HOST'];
		} elseif (isset($_SERVER['SERVER_NAME'])) {
			$serverUrl = $_SERVER['SERVER_NAME'];
		} else {
			$serverUrl = '';
		}
		return $serverUrl;
	}
	
	public static function formatMsg($content=null){
		if(!$content)return '';
		$content = str_replace("\n","l==l",$content);
		$content = preg_replace("/<script([^>]*)>(.*)<\/script>/i","",$content);//过滤js代码
		$content = str_replace("l==l","\n",$content);
		$content = htmlspecialchars($content,ENT_QUOTES);
		return $content;
	}

	public static function chars2dou($string=null){
		if(!$string)return '';
		$string = str_replace(array(' ', '，', '　', "\n"), ',', $string);
		return $string;
	}
	//获取年
	public static function getYears($order='desc',$from='1930',$end='now'){
		if($end=='now'||!$end){
			$end = date("Y");
		}
		$years = array();
		if($order=='desc'){
			for($i=$end;$i>=$from;$i--){
				$years[$i] = $i;
			}
		}else{
			for($i=$from;$i<=$end;$i++){
				$years[$i] = $i;
			}
		}
		return $years;
	}
	//获取月
	public static function getMonths(){
		$months = array();
		for($i=1;$i<=12;$i++){
			$months[$i] = ($i<10 ? '0' : '').$i;
		}
		return $months;
	}
	//获取日
	public static function getDays(){
		$days = array();
		for($i=1;$i<=31;$i++){
			$days[$i] = ($i<10 ? '0' : '').$i;
		}
		return $days;
	}

	public static function monthtime($t='s',$m=null){
		if($t=='s'){
			if(!$m){
				return strtotime(date("Y-m").'-1');
			}else{
				$tomonth = date("m") + $m;
				return strtotime(date("Y").'-'.$tomonth.'-1');
			}
		}else{
			if(!$m){
				return strtotime(date("Y-m",strtotime("+1 Month")).'-1');
			}else{
				$tomonth = date("m") + $m +1;
				return strtotime(date("Y").'-'.$tomonth.'-1');
			}
			
		}
	}

	public static function ArrayToUrl($arr=array()){
		if(empty($arr))return '';
		foreach($arr as $key=>$val){
			$parms[] = $key.'='.$val;
		}
		return implode('&',$parms);
	}

	/**
	 * 生成带进度条的上传代码
	 */
	public static function uploadzone($requesturi='',$width='100%',$height='130px'){
		$src = 'http://admin'.WEB_DOMAIN.'/admin/upload.do'.($requesturi ? '?'.$requesturi : '');
		$zone = '<iframe id="uploadiframe" name="uploadiframe" src="'.$src.'" frameborder="0" scrolling="no" style="width:'.$width.';height:'.$height.';border:0px;"></iframe>';
		return $zone;
	}
	public static function uploadsimplezone($requesturi='',$width='100%',$height='130px'){
		$src = 'http://admin'.WEB_DOMAIN.'/admin/uploadsimple.do'.($requesturi ? '?'.$requesturi : '');
		$zone = '<iframe id="uploadiframe" name="uploadiframe" src="'.$src.'" frameborder="0" scrolling="no" style="width:'.$width.';height:'.$height.';border:0px;"></iframe>';
		return $zone;
	}
	//广告|友情链接 获取
	public static function datacall($parms=array()){
		if(!isset($parms['type']))$parms['type'] = 'ads';
		$type = $parms['type'];
		if($type=='ads'){
			if(!isset($parms['id']))$parms['id'] = 0;
			if(!isset($parms['cityid']))$parms['cityid'] = 0;
			$id = trim($parms['id']);
			$cityid = intval($parms['cityid']);
			$filename = APP_CACHE_DIR.'/file/mml_ads.php';
			if($ads = @include($filename)){
				if($ads[$id]){
					if(isset($ads[$id][$cityid])){
						return $ads[$id][$cityid];
					}
				}
			}
		}elseif($type=='friendlinks'){
			if(!isset($parms['id'])||!$parms['id'])$parms['id'] = 'txt';
			
			$filename = APP_CACHE_DIR.'/file/sys_friendlinks.php';
			if($links = @include($filename)){
				$linktype = $parms['id']!='img' ? 'txt' : 'img';
				$links = $links[$linktype];
				$num = isset($parms['num'])&&intval($parms['num'])>0 ? $parms['num'] : 20;
				$flinks = array();
				$n = 0;
				$now = time()+28800;
				foreach($links as $link){
					if($link['startdate']<=$now && $link['enddate']>=$now){
						array_push($flinks,$link);
					}
				}
				$flinks = count($flinks)>$num ? array_slice($flinks,0,$num) : $flinks;
				$str = '';
				if(!empty($flinks)){
					$str .= '<div class="clearfix"></div><div id="link"><h2>友情链接</h2><ul>';
					foreach($flinks as $key=>$flink){
						$str .= '<li><a href="'.$flink['linkurl'].'" target="'.$flink['target'].'" rel="'.$flink['rel'].'">'.$flink['linkname'].'</a></li>';
					}
					$str .= '</ul></div>';
				}
				return $str;
			}
		}
		return '';
	}
	//文本代码转换
	public static function decode($data){
		$data=trim($data);
		$data= preg_replace(array("/(?<=[^\]a-z0-9-=\"'\\/])((https?|ftp|gopher|news|telnet|mms|rtsp):\/\/|www\.)([a-z0-9\/\-_+=.~!%@?#%&;:$\\│]+)/i"
					), array(
						"<a href='\\1\\3'>\\1\\3</a>"
					), $data);
		$data = nl2br($data);
		return $data;
	}

	public static function refererto(){
		return isset($_SERVER['HTTP_REFERER'])&&$_SERVER['HTTP_REFERER'] ? $_SERVER['HTTP_REFERER'] : '1';
	}

	public static function getMinMax($datas){
		if(empty($datas))return '';
		if(!is_array($datas)){
			$datas = explode(',',$datas);
		}
		$min = 0;
		$max = 0;
		foreach($datas as $v){
			if($min==0)$min=$v;
			if($v>$max){
				$max = $v;
			}
			if($v<$min){
				$min = $v;
			}
		}
		if($min==0){
			return array($max);
		}elseif($max==0){
			return array($min);
		}elseif($min==$max){
			return array($min);
		}else{
			return array($min,$max);
		}
	}

	public static function getformatdate($date,$format="Y.m.d",$num=2){
		$date = str_replace(',','~',str_replace('待定,','',trim($date)));
		if(!$date)return null;
		if(strstr($date,'~')){
			$tmp = self::getMinMax(explode("~",$date));
			return self::getweekdate($tmp[0],$format).($num==2 ? ' 至 '.self::getweekdate($tmp[1],$format) : '');
		}
		return self::getweekdate($date,$format);
	}

	public static function getweekdate($date=0,$format='week'){
		$newdate = $date;
		if(!is_numeric($newdate))return $date;
		return $format=='week' ? date("Y.m.d",$newdate).' 星期'.F::NumToWeekCN(date("N",$newdate)).' '.date("H:i",$newdate) : date($format,$newdate);
	}

	public static function getformatfare($fare){
		if(!$fare)return null;
		$fare = trim($fare);
		if(strstr($fare,'-')){
			$tmp = explode("-",$fare);
			$n = count($tmp)-1;
			return number_format($tmp[0],2,'.','').'元 - '.number_format($tmp[$n],2,'.','').'元';
		}elseif($fare>0){
			return number_format($fare,2,'.','').'元';
		}else{
			return $fare;
		}
	}

	public static function NumToCN($num=0){
		$cns = array('零','一','二','三','四','五','六','七','八','九');
		return isset($cns[$num]) ? $cns[$num] : $num ;
	}

	public static function NumToWeekCN($num=0){
		$cns = array('日','一','二','三','四','五','六','日');
		return isset($cns[$num]) ? $cns[$num] : $num ;
	}

	public static function getcnName($en){
		$cns = array('show'=>'有效','hide'=>'无效','y'=>'是','n'=>'否','pay1'=>'是','pay0'=>'否','ok'=>'是','no'=>'否','isgety'=>'款已收','isgetn'=>'拒收','isgetf'=>'发货','isgetd'=>'处理','isgetw'=>'已作废','isgett'=>'已确认','isgetx'=>'未处理','dt1'=>'只工作日收货（建议写字楼地址选择）','dt2'=>'只周末和节假日收货','dt3'=>'工作日和节假日都可收货','sex0'=>'保密','sex1'=>'男','sex2'=>'女');
		return isset($cns[$en]) ? $cns[$en] : $en ;
	}
	//获取汉字的两个首字母
	public static function pykey($str){
		$e = '';
		$str = strtolower($str);
		if(strstr($str,'er'))$e = 'e';
		$ymb = "a o e i u v ai ei ui ao ou iu ie ve er an en in un vn ang eng ing ong";
		$str = str_replace(array_reverse(explode(" ",$ymb)),"",$str);
		$str = str_replace(array('zh','ch','sh'),array('z','c','s'),$str);
		return strtoupper($str.$e);
	}

	public static function createFile($file,$data){
		$farr = explode('/',$file);
		$n = count($farr);
		$filedir = APP_CSV_DIR;
		for($i=0;$i<$n-1;$i++){
			$filedir .= '/'.$farr[$i];
			if(!file_exists($filedir)){
				if(!mkdir ($filedir, 0777)){
					return FALSE;
				}
			}
		}
		$fp = fopen(APP_CSV_DIR.'/'.$file,'a+');
		if (fwrite($fp, $data) === FALSE) {
			return false;
		}
		fclose($fp);
		return true;
	}

	//获取随即字符
	public static function getRandomstr($num=6,$type='all'){
		$arr['number'] = array('0','1','2','3','4','5','6','7','8','9');
		$arr['letter'] = array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		$arr['other'] = array('@','#','$','%','!');
		if($type=='all')$rans = array_merge($arr['number'],$arr['letter'],$arr['other']);
		else $rans = $arr[$type];
		$n = count($rans)-1;
		$str = '';
		for($i=0;$i<$num;$i++){
			$str .= $rans[rand(0,$n)];
		}
		return $str;
	}
	
	//获取字符串
	public static function getstr($string, $length,$ext='',$charset='utf-8'){
		if($length && strlen($string) > $length) {
			//截断字符
			$wordscut = '';
			if($charset == 'utf-8') {
				//utf8编码
				$n = 0;
				$tn = 0;
				$noc = 0;
				while ($n < strlen($string)) {
					$t = ord($string[$n]);
					if($t == 9 || $t == 10 || (32 <= $t && $t <= 126)) {
						$tn = 1;
						$n++;
						$noc++;
					} elseif(194 <= $t && $t <= 223) {
						$tn = 2;
						$n += 2;
						$noc += 2;
					} elseif(224 <= $t && $t < 239) {
						$tn = 3;
						$n += 3;
						$noc += 2;
					} elseif(240 <= $t && $t <= 247) {
						$tn = 4;
						$n += 4;
						$noc += 2;
					} elseif(248 <= $t && $t <= 251) {
						$tn = 5;
						$n += 5;
						$noc += 2;
					} elseif($t == 252 || $t == 253) {
						$tn = 6;
						$n += 6;
						$noc += 2;
					} else {
						$n++;
					}
					if ($noc >= $length) {
						break;
					}
				}
				if ($noc > $length) {
					$n -= $tn;
				}
				$wordscut = substr($string, 0, $n);
			} else {
				for($i = 0; $i < $length - 1; $i++) {
					if(ord($string[$i]) > 127) {
						$wordscut .= $string[$i].$string[$i + 1];
						$i++;
					} else {
						$wordscut .= $string[$i];
					}
				}
			}
			$string = $wordscut;
		}
		return trim($string);
	}

	/**
	 * 使用htmlspecialchars递归的处理数组
	 *
	 * @param mix $string
	 * @return mix
	 */
	public static function htmlspecialchars($string){
		if(is_array($string)) {
			foreach($string as $key => $val) {
				$string[$key] = self::htmlspecialchars($val);
			}
		} else {
			$string =htmlspecialchars(trim($string),ENT_QUOTES);
		}
		return $string;
	}

	public static function dstripslashes($string) {
		if(is_array($string)) {
			foreach($string as $key => $val) {
				$string[$key] = self::dstripslashes($val);
			}
		} else {
			$string = stripslashes($string);
		}
		return $string;
	}

	/**
	 * 创建一个目录
	 *
	 * @param string $dir 目录路径
	 */
	public static function mkdir($dir, $mode = 0777, $recursive = true){
		$umask = @umask(0);
		@mkdir($dir, $mode, $recursive);
		@umask($umask);
	}
	/**
	 * 递归的删除一个目录
	 *
	 * @param string $dir
	 */

	public static function deldir($dir){
		if(is_dir($dir)){
			$dh=@opendir($dir);
			while ($file=@readdir($dh)){
				if($file != "." && $file != "..") {
					$fullpath=$dir."/".$file;
					if(!is_dir($fullpath)) {
						@unlink($fullpath);
					} else {
						self::deldir($fullpath);
					}
				}
			}
			@closedir($dh);
			return @rmdir($dir);
		}elseif(is_file($dir)){
			return @unlink($dir);
		}else{
			return false;
		}
	}

	public static function rmdir($dir){
		@exec("rm -rf $dir");
	}

	//字符加密 
	public static function passport_encrypt($txt, $key='Arli.Yao') {
		srand((double)microtime() * 1000000);
		$encrypt_key = 'fsFdfdsfkr34853489itkgniuy3Xskfj';
		$ctr = 0;
		$tmp = '';
		for($i = 0;$i < strlen($txt); $i++) {
			$ctr = $ctr == strlen($encrypt_key) ? 0 : $ctr;
			$tmp .= $encrypt_key[$ctr].($txt[$i] ^ $encrypt_key[$ctr++]);
		}
		return base64_encode(self::passport_key($tmp, $key));
	}
	
	//字符解密
	public static function passport_decrypt($txt, $key='Arli.Yao') {
		$txt = self::passport_key(base64_decode($txt), $key);
		$tmp = '';
		for($i = 0;$i < strlen($txt); $i++) {
			$md5 = $txt[$i];
			$tmp .= $txt[++$i] ^ $md5;
		}
		return $tmp;
	}
	
	//加密解密算法
	public static function passport_key($txt, $encrypt_key) {
		$encrypt_key = md5($encrypt_key);
		$ctr = 0;
		$tmp = '';
		for($i = 0; $i < strlen($txt); $i++) {
			$ctr = $ctr == strlen($encrypt_key) ? 0 : $ctr;
			$tmp .= $txt[$i] ^ $encrypt_key[$ctr++];
		}
		return $tmp;
	}

	/**
	 * ubb代码转html
	 */
	function ubb_html($str)
	{
		$search = array('[strike]', '[/strike]', '[br]','[u]', '[/u]', '[i]', '[/i]', '[b]', '[/b]', '[code]', '[/code]', '[pre]', '[/pre]', '[acronym]', '[/acronym]', '[address]', '[/address]', '[div]', '[/div]', '[p]', '[/p]', '[span]', '[/span]', '[ul]', '[ol]', '[li]', '[/ul]', '[/ol]', '[/li]', '[tr]', '[/tr]', '[td]', '[/td]', '[table]', '[/table]');
		$replace = array('<strike>', '</strike>', '<br />', '<u>', '</u>', '<i>', '</i>', '<b>', '</b>', '<code>', '</code>', '<pre>', '</pre>', '<acronym>', '</acronym>', '<address>', '</address>', '<div>', '</div>', '<p>', '</p>', '<span>', '</span>', '<ul>', '<ol>', '<li>', '</ul>', '</ol>', '</li>', '<tr>', '</tr>', '<td>', '</td>', '<table>', '</table>');
		$str = str_replace($search, $replace, $str);
		$reg_search = array("#\[align=([^\[\<]+?)\](.*?)\[/align]#is",
							"/\[table=(\d{1,4}(px|em|ex|pt|pc|in|mm|cm|%|)?)(,([\(\)%,#\w ]+)?)?\]/ies",
							"#\[td=(\d{1,2}),(\d{1,2})(,(\d{1,3}(px|em|ex|pt|pc|in|mm|cm|%|)?))?\]#is",
							"#\[font=([^\[\<]+?)\](.*?)\[/font\]#is",
							"#\[size=(\d+(\.\d+)?(px|em|ex|pt|pc|in|mm|cm|%|)?)\](.*?)\[/size\]#ies",
							"#\[color=([^\[\<]+?)\](.*?)\[/color\]#is");
		$reg_replace = array("<p style=\"text-align:\\1\">\\2</p>",
							"table_code('\\1','\\4')",
							"<td colspan=\"\\1\" rowspan=\"\\2\" width=\"\\4\">",
							"<span style=\"font-family:\\1\">\\2</span>",
							"font_size('\\1', '\\4', 'content')",
							"<span style=\"color:\\1\">\\2</span>");
		$str = preg_replace($reg_search, $reg_replace, $str);
		if ((strpos($str, '[url=') !== FALSE) && (strpos($str, '[/url]') !== FALSE))
		{
			$str = preg_replace("#\[url=(https?|ftp|gopher|news|telnet|rtsp|mms|callto|ed2k){1}:\/\/([^\[\"']+?)\](.+?)\[\/url\]#is", "<a href=\"\\1://\\2\" target=\"_blank\">\\3</a>", $str);
		}
		if ((strpos($str, '[email=') !== FALSE) && (strpos($str, '[/email]') !== FALSE))
		{
			$str = preg_replace("#\[email=([a-z0-9\-_.+]+)@([a-z0-9\-_]+[.][a-z0-9\-_.]+)\](.+?)\[\/email\]#is", "<a href=\"mailto:\\1@\\2\">\\3</a>", $str);
		}
		if ((strpos($str, '[img]') !== FALSE) && (strpos($str, '[/img]') !== FALSE))
		{
			$str = preg_replace("#\[img\]\s*([^\[\<\r\n]+?)\s*\[/img\]#is", "<img src=\"\\1\" />", $str);
		}
		return $str;
	}
	
	/**
	 * 递归拷贝一个目录
	 *
	 * @param unknown_type $source
	 * @param unknown_type $destination
	 * @param unknown_type $child
	 * @return unknown
	 */
	public static function  xCopy($source,  $destination,  $child = 1)
	{    
	//用法：    
	//  xCopy("feiy","feiy2",1):拷贝feiy下的文件到  feiy2,包括子目录    
	//  xCopy("feiy","feiy2",0):拷贝feiy下的文件到  feiy2,不包括子目录    
	   if(!is_dir($source)){     
		 return  0;    
		 }    
	   if(!is_dir($destination)){    
		   mkdir($destination,0777);
		 }  
	   $handle=dir($source);    
	   while($entry=$handle->read())  
	   {    
			if(($entry!=".")&&($entry!=".."))
			{    
			   if(is_dir($source."/".$entry))
			   {    
				   if($child)    
				   self::xCopy($source."/".$entry,$destination."/".$entry,$child);    
				}else{  
				 copy($source."/".$entry,$destination."/".$entry);    
				}
			}    
		} 
		return  1;    
	} 

	public static function gb2utf8($str) {
		return iconv('gbk', 'UTF8', $str);
	}
	
	/**
	 * 多个数组元素值无重复合并
	 *注意：只适合一维数组
	 * @return unknown
	 */
	
	public static function array_values_merge()   
	{   
	    $argc = func_num_args();   
	    if ($argc == 0) {   
	        return false;   
	    } else if ($argc == 1) {   
	        $arg1 = func_get_arg(0);   
	        if (is_array($arg1)) {   
	            return array_values(array_unique($arg1));   
	        } else {   
	            return array($arg1);   
	        }   
	    } else {   
	        $arg_list = func_get_args();   
	        $arr = array();   
	        for ($i=0; $i<$argc; $i++) {   
	            $arr = array_merge($arr, $arg_list[$i]);   
	        }   
	        return array_values(array_unique($arr));   
	    }   
	}

	public static function sortArray($ArrayData,$KeyName1,$SortOrder1 = "SORT_ASC",$SortType1 = "SORT_REGULAR") 
	{ 
	    if(!is_array($ArrayData)) 
	    { 
	        return $ArrayData; 
	    } 
	 
	    // Get args number. 
	    $ArgCount = func_num_args(); 
	 
	    // Get keys to sort by and put them to SortRule array. 
	    for($I = 1;$I < $ArgCount;$I ++) 
	    { 
	        $Arg = func_get_arg($I); 
	        if(!eregi("SORT",$Arg)) 
	        { 
	            $KeyNameList[] = $Arg; 
	            $SortRule[]    = '$'.$Arg; 
	        } 
	        else 
	        { 
	            $SortRule[]    = $Arg; 
	        } 
	    } 
	 
	    // Get the values according to the keys and put them to array. 
	    foreach($ArrayData AS $Key => $Info) 
	    { 
	        foreach($KeyNameList AS $KeyName) 
	        { 
	            ${$KeyName}[$Key] = $Info[$KeyName]; 
	        } 
	    } 
	 
	    // Create the eval string and eval it. 
	    $EvalString = 'array_multisort('.join(",",$SortRule).',$ArrayData);'; 
	    eval ($EvalString); 
	    return $ArrayData; 
	} 
	
	/**
	* DateDiff(interval,date1,date2)
	* 返回两个日期之间的时间间隔
	* intervals(时间间隔字符串表达式)可以是以下任意值: 
	*   w  周
	*   d  天
	*   h  小时
	*   n  分钟
	*   s  秒
	*/
	public static function DateDiff ($interval, $date1,$date2) { 
	  // 得到两日期之间间隔的秒数 
	  $timedifference =self::gettime($date2) - self::gettime($date1); 
	  switch ($interval) { 
	    case "w": $retval = bcdiv($timedifference ,604800); break; 
	    case "d": $retval = bcdiv( $timedifference,86400); break; 
	    case "h": $retval = bcdiv ($timedifference,3600); break; 
	    case "n": $retval = bcdiv( $timedifference,60); break; 
	    case "s": $retval = $timedifference; break; 
	  } 
	  return $retval;
	} 
}
?>