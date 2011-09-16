<?
/*
	PHP文件上传类
*/
class upload_Lib {

    var $max_size       = 0;
    var $max_width      = 0;
    var $max_height     = 0;
    var $max_filename   = 0;
    var $allowed_types  = "";
    var $file_temp      = "";
    var $file_name      = "";
    //add by penn for file jiami
    var $file_name_jiama = "";
    //end by penn
    var $orig_name      = "";
    var $file_type      = "";
    var $file_size      = "";
    var $file_ext       = "";
    var $upload_path    = "";
    var $overwrite      = FALSE;
    var $encrypt_name   = FALSE;
    var $is_image       = FALSE;
    var $image_width    = '';
    var $image_height   = '';
    var $image_type     = '';
    var $image_size_str = '';
    var $error_msg      = array();
    var $mimes          = array();
    var $remove_spaces  = TRUE;
	var $small_imags    = array();

    /**
	 * 构造函数
	 *
	 * @param 默认的上传策略 $config
	 */
	function __construct($config = array())
	{
		$defaults = Load::conf('upload:'.str_replace(array('/','\\'),'',APP_MODUL_NAME));
		foreach ($defaults as $key => $val) {
			if (isset($config[$key])) {
				$val = $config[$key];
				
			}
			$method = 'set_'.$key;
			if (method_exists($this, $method)) {
				$this->$method($val);
			}
			else
			{
				$this->$key = $val;
			}
		}
    }

	function edit_upload_path($path=''){
		if($path=='') $path = APP_MODUL_NAME;
		$this->set_upload_path($path);
	}

    function run ($field = 'file',$smallimg='true')
    {
        $is_uploaded_file = true;
		if(isset($_SERVER['HTTP_CONTENT_DISPOSITION']))//HTML5上传
		{
			if(preg_match('/attachment;\s+name="(.+?)";\s+filename="(.+?)"/i',$_SERVER['HTTP_CONTENT_DISPOSITION'],$info))
			{
				$temp_name='/tmp/'.date("YmdHis").mt_rand(1000,9999);
				file_put_contents($temp_name,file_get_contents("php://input"));
				$size=filesize($temp_name);
				$_FILES[$info[1]]=array('name'=>$info[2],'tmp_name'=>$temp_name,'size'=>$size,'type'=>'','error'=>0);
			}
			$is_uploaded_file = false;
		}

		if ( ! isset($_FILES[$field])){
            $this->set_error('upload_no_file_selected');
            return FALSE;
        }

        if ( ! $this->validate_upload_path()){
            $this->set_error('upload_no_file_selected1');
			return FALSE;
        }

        if ($is_uploaded_file && ! is_uploaded_file($_FILES[$field]['tmp_name'])){
            $error = ( ! isset($_FILES[$field]['error'])) ? 4 : $_FILES[$field]['error'];
            switch($error){
                case 1: // UPLOAD_ERR_INI_SIZE
                    $this->set_error('upload_file_exceeds_limit');
                    break;
                case 2: // UPLOAD_ERR_FORM_SIZE
                    $this->set_error('upload_file_exceeds_form_limit');
                    break;
                case 3: // UPLOAD_ERR_PARTIAL
                   $this->set_error('upload_file_partial');
                    break;
                case 4: // UPLOAD_ERR_NO_FILE
                   $this->set_error('upload_no_file_selected2');
                    break;
                case 6: // UPLOAD_ERR_NO_TMP_DIR
                    $this->set_error('upload_no_temp_directory');
                    break;
                case 7: // UPLOAD_ERR_CANT_WRITE
                    $this->set_error('upload_unable_to_write_file');
                    break;
                case 8: // UPLOAD_ERR_EXTENSION
                    $this->set_error('upload_stopped_by_extension');
                    break;
                default :   $this->set_error('upload_no_file_selected3');
                    break;
            }

            return FALSE;
        }

        $this->file_temp = $_FILES[$field]['tmp_name'];
        $this->file_name = $this->_prep_filename($_FILES[$field]['name']);
        $this->file_size = $_FILES[$field]['size'];
        $this->file_type = preg_replace("/^(.+?);.*$/", "\\1", $_FILES[$field]['type']);
        $this->file_type = strtolower($this->file_type);
        $this->file_ext  = $this->get_extension($_FILES[$field]['name']);

        if ($this->file_size > 0) {
            $this->file_size = round($this->file_size/1024, 2);  // kb
        }

        if ($is_uploaded_file && $this->file_ext!=flv && !$this->is_allowed_file_type()) {
            $this->set_error('upload_invalid_file_type');
            return FALSE;
        }

        if ( ! $this->is_allowed_filesize()) {
            $this->set_error('upload_invalid_filesize');
            return FALSE;
        }

        if ( ! $this->is_allowed_image_dimensions()) {
            $this->set_error('upload_invalid_image_dimensions');
            return FALSE;
        }

        $this->file_name = substr(md5($this->file_name.time()),0,16).".".$this->file_ext;
        $this->file_name_jiami = $this->file_name.'shiyishi';

        if ( ! @copy($this->file_temp, $this->upload_path.$this->file_name)){
            if ( ! @move_uploaded_file($this->file_temp, $this->upload_path.$this->file_name)){
                 $this->set_error('upload_destination_error');
                 return FALSE;
            }
        }

        //add by penn for jiami
        $file = file_get_contents($this->upload_path.$this->file_name, "rb");
		$fileLen = mb_strlen($file);
		$filePartNum = floor($fileLen / 1024);
		$filePartLeft = mb_substr($file, $filePartNum*1024);
		$passKey = "songpengcheng";
		$passKeyLen = mb_strlen($passKey);
		$sign = 'pennsongSigned';
		$signLen =  mb_strlen($sign);
		
		if (file_exists($this->upload_path.$this->file_name_jiami)) {
		   // yes the file does exist 
		   unlink($this->upload_path.$this->file_name_jiami);
		}
		
		$fp = fopen($this->upload_path.$this->file_name_jiami, "wb");
		fwrite($fp, $sign);
		for ($part=0; $part<$filePartNum; $part++)
		{
			$filePart = mb_substr($file, $part*1024, 1024);
			$byteArr = str_split($filePart);
			$i=0;
			$tmpStr='';
			foreach ($byteArr as $val) 
			{ 
				$passKeyChar = substr($passKey, (($part*1024 + $i) % $passKeyLen), 1);
				$tmpStr .= chr(ord($val)^ord($passKeyChar)); 
				$i++;
			}
			fwrite($fp, $tmpStr);
		}
		
		$byteArr = str_split($filePartLeft);
		$i=0;
		$tmpStr='';
		foreach ($byteArr as $val) 
		{ 
			$passKeyChar = substr($passKey, (($filePartNum*1024 + $i) % $passKeyLen), 1);
			$tmpStr .= chr(ord($val)^ord($passKeyChar)); 
			$i++;
		}
		fwrite($fp, $tmpStr);
		fclose($fp);
		        
		//end by penn        
        if($smallimg)$this->set_image_properties();

        return TRUE;
    }

    function data(){
		return array (
			'file_name'         => $this->file_name,
			'file_type'         => $this->file_type,
			'file_path'         => $this->upload_path.$this->file_name,
			'file_url'          => str_replace(ATTACHMENT_DIR."/","",substr($this->upload_path,strpos($this->upload_path,ATTACHMENT_DIR))).$this->file_name,
			'raw_name'          => str_replace('.'.$this->file_ext, '', $this->file_name),
			'orig_name'         => $this->orig_name,
			'file_ext'          => $this->file_ext,
			'file_size'         => $this->file_size,
			'is_image'          => $this->is_image(),
			'file_small'        => $this->small_imags,
			'image_width'       => $this->image_width,
			'image_height'      => $this->image_height,
			'image_type'        => $this->image_type,
			'image_size_str'    => $this->image_size_str,
		);
    }

    function set_upload_path($path){
        $this->upload_path = APP_UPLOAD_DIR.DIRECTORY_SEPARATOR.trim($path, '/').'/';
    }

    function set_filename($path, $filename)
    {
        if ($this->encrypt_name == TRUE){
            mt_srand();
            $filename = md5(uniqid(mt_rand())).'.'.$this->file_ext;
        }

        if ( ! file_exists($path.$filename)){
            return $filename;
        }

        $filename = str_replace('.'.$this->file_ext, '', $filename);

        $new_filename = '';
        for ($i = 1; $i < 100; $i++){
            if ( ! file_exists($path.$filename.$i.'.'.$this->file_ext)){
                $new_filename = $filename.$i.'.'.$this->file_ext;
                break;
            }
        }

        if ($new_filename == ''){
            $this->set_error('upload_bad_filename');
            return FALSE;
        }
        else{
            return $new_filename;
        }
    }

    function set_max_filesize($n){
        $this->max_size = ((int) $n < 0) ? 0: (int) $n;
    }

    function set_max_filename($n){
        $this->max_filename = ((int) $n < 0) ? 0: (int) $n;
    }

    function set_max_width($n){
        $this->max_width = ((int) $n < 0) ? 0: (int) $n;
    }

    function set_max_height($n){
        $this->max_height = ((int) $n < 0) ? 0: (int) $n;
    }

    function set_allowed_types($types){
        $this->allowed_types = explode('|', $types);
    }

    function set_image_properties(){
        if(strtolower($this->file_ext)=='bmp'){
			foreach($this->small_imags as $key=>$size){
				$this->small_imags[$key] = str_replace(ATTACHMENT_DIR."/","",substr($this->upload_path,strpos($this->upload_path,ATTACHMENT_DIR))).$this->file_name;
			}
			return;
		}
		if (!$this->is_image()){
            return;
        }
		if(empty($this->small_imags)){
			return;
		}
		
		foreach($this->small_imags as $key=>$size){
			$maxwidth = $size[0];
			$maxheight = $size[1];
			$source_f = str_replace('.'.$this->file_ext, '', $this->file_name)."_".$maxwidth."_".$maxheight.".".$this->file_ext;
			$this->small_imags[$key] = str_replace(ATTACHMENT_DIR."/","",substr($this->upload_path,strpos($this->upload_path,ATTACHMENT_DIR))).$source_f;
			$source = $this->upload_path.$source_f;
			@copy($this->upload_path.$this->file_name, $source);
			$size=@getimagesize($source);   
			switch($size[2]){   
				case 1:   
				$im=imagecreatefromgif($source);   
				break;   
				case 2:   
				$im=imagecreatefromjpeg($source);   
				break;   
				case 3:   
				$im=imagecreatefrompng($source);   
				break;   
			}   
			$width = imagesx($im); 
			$height = imagesy($im); 
			
			if(($maxwidth && $width > $maxwidth) || ($maxheight && $height > $maxheight)){ 
				if($maxwidth && $width > $maxwidth){ 
					$widthratio = $maxwidth/$width; 
					$RESIZEWIDTH=true; 
				} 
				if($maxheight && $height > $maxheight){ 
					$heightratio = $maxheight/$height; 
					$RESIZEHEIGHT=true; 
				} 
				if($RESIZEWIDTH && $RESIZEHEIGHT){ 
					if($widthratio < $heightratio){ 
						$ratio = $widthratio; 
					}else{ 
						$ratio = $heightratio; 
					} 
				}elseif($RESIZEWIDTH){ 
					$ratio = $widthratio; 
				}elseif($RESIZEHEIGHT){ 
					$ratio = $heightratio; 
				} 
				$newwidth = $width * $ratio; 
				$newheight = $height * $ratio; 
				
				if(function_exists("imagecopyresampled")){ 
					$newim = imagecreatetruecolor($newwidth, $newheight); 
					imagecopyresampled($newim, $im, 0, 0, 0, 0, $newwidth, $newheight, $width, $height); 
				}else{ 
					$newim = imagecreate($newwidth, $newheight); 
					imagecopyresized($newim, $im, 0, 0, 0, 0, $newwidth, $newheight, $width, $height); 
				} 
				switch($size['mime']) {
					case 'image/jpeg':
						imageJPEG($newim,$source);
						break;
					case 'image/gif':
						imageGIF($newim,$source);
						break;
					case 'image/png':
						imagePNG($newim,$source);
						break;
				}
				ImageDestroy ($newim); 
			}else{ 
				switch($size['mime']) {
					case 'image/jpeg':
						imageJPEG($im,$source);
						break;
					case 'image/gif':
						imageGIF($im,$source);
						break;
					case 'image/png':
						imagePNG($im,$source);
						break;
				}
			}
		}
    }


    function is_image() {
        // IE will sometimes return odd mime-types during upload, so here we just standardize all
        // jpegs or pngs to the same file type.

        $png_mimes  = array('image/x-png');
        $jpeg_mimes = array('image/jpg', 'image/jpe', 'image/jpeg', 'image/pjpeg');

        if (in_array($this->file_type, $png_mimes))
        {
            $this->file_type = 'image/png';
        }

        if (in_array($this->file_type, $jpeg_mimes))
        {
            $this->file_type = 'image/jpeg';
        }

        $img_mimes = array(
                            'image/gif',
                            'image/jpeg',
                            'image/png',
                           );

        return (in_array($this->file_type, $img_mimes, TRUE)) ? TRUE : FALSE;
    }

    function is_allowed_file_type(){
		if (count($this->allowed_types) == 0 OR ! is_array($this->allowed_types)){
            $this->set_error('upload_no_file_allowed_types');
            return FALSE;
        }

        foreach ($this->allowed_types as $val){
            $mime = $this->mimes_types(strtolower($val));
            if (is_array($mime)){
                if (in_array($this->file_type, $mime, TRUE)){
                    return TRUE;
                }
            }
            else{
                if ($mime == $this->file_type){
                    return TRUE;
                }
            }
        }

        return FALSE;
    }

    function is_allowed_filesize()
    {
        if ($this->max_size != 0  AND  $this->file_size > $this->max_size){
            return FALSE;
        }
        else{
            return TRUE;
        }
    }

    function is_allowed_image_dimensions()
    {
        if ( ! $this->is_image()){
            return TRUE;
        }

        if (function_exists('getimagesize')){
            $D = @getimagesize($this->file_temp);

            if ($this->max_width > 0 AND $D['0'] > $this->max_width){
                return FALSE;
            }

            if ($this->max_height > 0 AND $D['1'] > $this->max_height){
                return FALSE;
            }

            return TRUE;
        }

        return TRUE;
    }


    function validate_upload_path() {
        if ($this->upload_path == ''){
            $this->set_error('upload_no_filepath');
            return FALSE;
        }
		
		if(!file_exists($this->upload_path)){
			if(!mkdir ($this->upload_path, 0777)){
				$this->set_error('upload_not_writable');
				return FALSE;
			}
		}
		$this->upload_path .= date("Y")."/";
		if(!file_exists($this->upload_path)){
			if(!mkdir ($this->upload_path, 0777)){
				$this->set_error('upload_not_writable');
				return FALSE;
			}
		}
		$this->upload_path .= date("m")."/";
		if(!file_exists($this->upload_path)){
			if(!mkdir ($this->upload_path, 0777)){
				$this->set_error('upload_not_writable');
				return FALSE;
			}
		}
		$this->upload_path .= date("d")."/";
		if(!file_exists($this->upload_path)){
			if(!mkdir ($this->upload_path, 0777)){
				$this->set_error('upload_not_writable');
				return FALSE;
			}
		}


        if (function_exists('realpath') AND @realpath($this->upload_path) !== FALSE) {
            $this->upload_path = str_replace("\\", "/", realpath($this->upload_path));
        }

        if ( ! @is_dir($this->upload_path)) {
            $this->set_error('upload_no_filepath');
            return FALSE;
        }
		/*
        if ( ! $this->is_really_writable($this->upload_path)) {
            $this->set_error('upload_not_writable');
            return FALSE;
        }
		*/

        $this->upload_path = preg_replace("/(.+?)\/*$/", "\\1/",  $this->upload_path);
        return TRUE;
    }


    function get_extension($filename){
        return substr_count(substr($filename,0,-1), '.') == 0 ? '' : substr(strrchr($filename, '.'),1);
    }

    function clean_file_name($filename){
        $bad = array(
				"<!--", "-->", "'", "<", ">", '"', '&', '$', '=', ';', '?', '/', "%20","%22","%3c",
				"%253c","%3e", "%0e", "%28", "%29", "%2528", "%26", "%24", "%3f", "%3b", "%3d"
				);
        $filename = str_replace($bad, '', $filename);
        return stripslashes($filename);
    }

    function limit_filename_length($filename, $length){
        if (strlen($filename) < $length){
            return $filename;
        }

        $ext = '';
        if (strpos($filename, '.') !== FALSE){
            $parts      = explode('.', $filename);
            $ext        = '.'.array_pop($parts);
            $filename   = implode('.', $parts);
        }

        return substr($filename, 0, ($length - strlen($ext))).$ext;
    }

    function set_error($msg)    {
        $this->error_msg[] = $msg;
    }


    function display_errors($open = '', $close = '')
    {
        $errs = Load::conf('uploaderrmsg');
		$str = '';
        foreach ($this->error_msg as $val){
            $str .= $open.$errs[$val].$close;
        }

        return $str;
    }


    function mimes_types($mime){
        if (count($this->mimes) == 0) {
			$this->mimes = array(
				'hqx'	=>	'application/mac-binhex40',
				'cpt'	=>	'application/mac-compactpro',
				'csv'	=>	array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel'),
				'bin'	=>	'application/macbinary',
				'dms'	=>	'application/octet-stream',
				'lha'	=>	'application/octet-stream',
				'lzh'	=>	'application/octet-stream',
				'exe'	=>	'application/octet-stream',
				'class'	=>	'application/octet-stream',
				'psd'	=>	'application/x-photoshop',
				'so'	=>	'application/octet-stream',
				'sea'	=>	'application/octet-stream',
				'dll'	=>	'application/octet-stream',
				'flv'	=>	'application/octet-stream',
				'oda'	=>	'application/oda',
				'pdf'	=>	array('application/pdf', 'application/x-download'),
				'ai'	=>	'application/postscript',
				'eps'	=>	'application/postscript',
				'ps'	=>	'application/postscript',
				'smi'	=>	'application/smil',
				'smil'	=>	'application/smil',
				'mif'	=>	'application/vnd.mif',
				'xls'	=>	array('application/excel', 'application/vnd.ms-excel'),
				'ppt'	=>	array('application/powerpoint', 'application/vnd.ms-powerpoint'),
				'wbxml'	=>	'application/wbxml',
				'wmlc'	=>	'application/wmlc',
				'dcr'	=>	'application/x-director',
				'dir'	=>	'application/x-director',
				'dxr'	=>	'application/x-director',
				'dvi'	=>	'application/x-dvi',
				'gtar'	=>	'application/x-gtar',
				'gz'	=>	'application/x-gzip',
				'php'	=>	array('application/x-httpd-php','application/octet-stream'),
				'php4'	=>	array('application/x-httpd-php','application/octet-stream'),
				'php3'	=>	array('application/x-httpd-php','application/octet-stream'),
				'phtml'	=>	array('application/x-httpd-php','application/octet-stream'),
				'phps'	=>	'application/x-httpd-php-source',
				'js'	=>	'application/x-javascript',
				'swf'	=>	'application/x-shockwave-flash',
				'sit'	=>	'application/x-stuffit',
				'tar'	=>	'application/x-tar',
				'tgz'	=>	'application/x-tar',
				'xhtml'	=>	'application/xhtml+xml',
				'xht'	=>	'application/xhtml+xml',
				'zip'	=>  array('application/x-zip', 'application/zip', 'application/x-zip-compressed'),
				'mid'	=>	'audio/midi',
				'midi'	=>	'audio/midi',
				'mpga'	=>	'audio/mpeg',
				'mp2'	=>	'audio/mpeg',
				'mp3'	=>	array('audio/mpeg', 'audio/mpg'),
				'aif'	=>	'audio/x-aiff',
				'aiff'	=>	'audio/x-aiff',
				'aifc'	=>	'audio/x-aiff',
				'ram'	=>	'audio/x-pn-realaudio',
				'rm'	=>	'audio/x-pn-realaudio',
				'rpm'	=>	'audio/x-pn-realaudio-plugin',
				'ra'	=>	'audio/x-realaudio',
				'rv'	=>	'video/vnd.rn-realvideo',
				'wav'	=>	'audio/x-wav',
				'bmp'	=>	'image/bmp',
				'gif'	=>	'image/gif',
				'jpeg'	=>	array('image/jpeg', 'image/pjpeg'),
				'jpg'	=>	array('image/jpeg', 'image/pjpeg'),
				'jpe'	=>	array('image/jpeg', 'image/pjpeg'),
				'png'	=>	array('image/png',  'image/x-png'),
				'tiff'	=>	'image/tiff',
				'tif'	=>	'image/tiff',
				'css'	=>	'text/css',
				'html'	=>	'text/html',
				'htm'	=>	'text/html',
				'shtml'	=>	'text/html',
				'txt'	=>	'text/plain',
				'text'	=>	'text/plain',
				'log'	=>	array('text/plain', 'text/x-log'),
				'rtx'	=>	'text/richtext',
				'rtf'	=>	'text/rtf',
				'xml'	=>	'text/xml',
				'xsl'	=>	'text/xml',
				'mpeg'	=>	'video/mpeg',
				'mpg'	=>	'video/mpeg',
				'mpe'	=>	'video/mpeg',
				'qt'	=>	'video/quicktime',
				'mov'	=>	'video/quicktime',
				'avi'	=>	'video/x-msvideo',
				'movie'	=>	'video/x-sgi-movie',
				'doc'	=>	'application/msword',
				'docx'	=>	'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
				'xlsx'	=>	'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
				'word'	=>	array('application/msword', 'application/octet-stream'),
				'xl'	=>	'application/excel',
				'eml'	=>	'message/rfc822'
			);
        }
        return ( ! isset($this->mimes[$mime])) ? FALSE : $this->mimes[$mime];
    }

    function _prep_filename($filename){
        if (strpos($filename, '.') === FALSE){
            return $filename;
        }
        $parts      = explode('.', $filename);
        $ext        = array_pop($parts);
        $filename   = array_shift($parts);

        foreach ($parts as $part){
            if ($this->mimes_types(strtolower($part)) === FALSE){
                $filename .= '.'.$part.'_';
            }
            else{
                $filename .= '.'.$part;
            }
        }

        $filename .= '.'.$ext;
        return $filename;
    }

    function is_really_writable($file){
        if (DIRECTORY_SEPARATOR == '/' AND @ini_get("safe_mode") == FALSE){
            return is_writable($file);
        }

        if (is_dir($file)){
            $file = rtrim($file, '/').'/'.md5(rand(1,100));

            if (($fp = @fopen($file, 'a+b')) === FALSE){
                return FALSE;
            }

            fclose($fp);
            @unlink($file);
            return TRUE;
        }
        elseif (($fp = @fopen($file, 'ab')) === FALSE){
            return FALSE;
        }

        fclose($fp);
        return TRUE;
    }

}
