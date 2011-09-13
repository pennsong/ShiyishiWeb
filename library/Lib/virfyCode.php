<?php
class virfyCode_Lib{
	
	
	static $V  = array("a", "e", "i", "o", "u", "y");
    static $VN = array("a", "e", "i", "o", "u", "y","2","3","4","5","6","7","8","9");
    static $C  = array("b","c","d","f","g","h","j","k","m","n","p","q","r","s","t","u","v","w","x","z");
    static $CN = array("b","c","d","f","g","h","j","k","m","n","p","q","r","s","t","u","v","w","x","z","2","3","4","5","6","7","8","9");
    protected $_word;
    /**
     * Length of the word to generate
     *
     * @var integer
     */
    protected $_wordlen = 4;
    /**
     * images width
     *
     * @var unknown_type
     */
    protected $_imgwidth = 60;
    /**
     * images height
     *
     * @var unknown_type
     */
    protected $_imgheight = 25;
    
    protected $_imgtype = 'png';
    
    protected $_useNumbers = true;

    protected $_timeout = 300;
    /**
     * Retrieve word length to use when genrating captcha
     *
     * @return integer
     */
    public function getWordlen()
    {
        return $this->_wordlen;
    }
	
     /**
     * Set word length of captcha
     *
     * @param integer $wordlen
     * @return Zend_Captcha_Word
     */
    public function setWordlen($wordlen)
    {
        $this->_wordlen = $wordlen;
        return $this;
    }
    
    public function getImgWidth()
    {
    	return $this->_imgwidth;
    }
    
    public function setImgWidth($length)
    {
    	$this->_imgwidth = $length;
    	return $this;
    }
    
    public function getImgHeight()
    {
    	return $this->_imgheight;
    }
    
    public function setImgHeight($length)
    {
    	$this->_imgheight = $length;
    	return $this;
    }   
     public function getImgType()
    {
    	return $this->_imgtype;
    }
    
    public function setImgType($type)
    {
    	$this->_imgtype = $type;
    	return $this;
    }    
    
    /**
     * Generate new random word
     *
     * @return string
     */
    protected function _generateWord()
    {
        $word       = '';
        $wordLen    = $this->getWordLen();
        $vowels     = $this->_useNumbers ? self::$VN : self::$V;
        $consonants = $this->_useNumbers ? self::$CN : self::$C;

        for ($i=0; $i < $wordLen; $i = $i + 2) {
            // generate word with mix of vowels and consonants
            $consonant = $consonants[array_rand($consonants)];
            $vowel     = $vowels[array_rand($vowels)];
            $word     .= $consonant . $vowel;
        }

        if (strlen($word) > $wordLen) {
            $word = substr($word, 0, $wordLen);
        }
		//$word = strtoupper($word);
        return $word;
    }

    /**
     * Generate new session ID and new word
     *
     * @return string session ID
     */
    public function generate()
    {
        
        $word           = $this->_generateWord();
        $this->_setWord($word);
        return $word;
    }
    
        /**
     * Set captcha word
     *
     * @param  string $word
     * @return Zend_Captcha_Word
     */
    protected function _setWord($word)
    {
        $_SESSION['virfy_word'] = $word;
        $this->_word   = $word;
        return $this;
    }
    
        /**
     * Get captcha word
     *
     * @return string
     */
    public function getWord()
    {
        if (empty($this->_word)) {
           
            $this->_word = $_SESSION['virfy_word'];
        }
        return $this->_word;
    }
    
    /**
     * 生成图片
     * @param unknown_type $type
     * @param unknown_type $width
     * @param unknown_type $height
     */
    function createImage() 
    {
    	$type = $this->getImgType();
    	$width = $this->getImgWidth();
    	$height = $this->getImgHeight();
    	$length = $this->getWordlen();
        $randval = $this->getWord();
        $width = ($length*9+10)>$width?$length*9+10:$width;
        
        //创建图片，并设置背景色
		$im = imagecreate($width,$height);
		ImageColorAllocate($im, 255,255,255);
	
		//背景线
		$lineColor1 = ImageColorAllocate($im,240,220,180);
		$lineColor2 = ImageColorAllocate($im,250,250,170);
		for($j=3;$j<=16;$j=$j+3)
		{
			imageline($im,2,$j,48,$j,$lineColor1);
		}
		for($j=2;$j<52;$j=$j+(mt_rand(3,6)))
		{
			imageline($im,$j,2,$j-6,18,$lineColor2);
		}
	
		//画边框
		$bordercolor = ImageColorAllocate($im, 0x99,0x99,0x99);
		imagerectangle($im, 0, 0, 49, 19, $bordercolor);
	
		//输出文字
		$fontColor = ImageColorAllocate($im, 48,61,50);
		for($i=0;$i<$length;$i++)
		{
			$bc = mt_rand(0,1);
			//$rndstring[$i] = strtoupper($rndstring[$i]);
			@imagestring($im, 5, $i*10+6, mt_rand(2,4), $randval[$i], $fontColor);
		}
        $this->output($im,$type);
    }
    
    /**
     * 输出图片验证码
     *
     * @param unknown_type $im
     * @param unknown_type $type
     */
     function output($im,$type='png') 
    {
        header("Content-type: image/".$type);
        $ImageFun='Image'.$type;
        $ImageFun($im);
        imagedestroy($im);  	
    }
    
    function destroy()
    {
    	unset($_SESSION['virfy_word']);
    	return $this;
    }
	
}


?>