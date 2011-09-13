<?php
/**
 * session处理类
 * 使用方法
 * $mmsession = Load::lib('session');   $mmsession->initSess(); 接下来赋值就可以
 * 添加时间：2009-8-25
 */
define('SESS_LIFTTIME', 3600);


class session_Lib
{ 
    static  $sessSavePath;
    static  $sessName;
    static  $cacheObj;

    //构造函数
    public function __construct()
    {
        //引入cache机制
        self::$cacheObj = @Load::lib('cache','mem');
    }
    //session open操作
    public function sessOpen($save_path = '', $sess_name = '')
    {
        self::$sessSavePath    = $save_path;
        self::$sessName        = $sess_name;
        return TRUE;
    }
    
    //close操作
    public function sessClose()
    {
        return TRUE;
    }
    
    //读取操作
    public function sessRead($sessId = '')
    {
        $data = self::$cacheObj->get($sessId);
		//$data = self::$cacheObj->get($sessId,'session');//当cache为cache_file时启用

        //先读数据，如果没有，就初始化一个
        if (!empty($data))
        {
            return $data;
        }
        else
        {
            //初始化一条空记录
            $ret = self::$cacheObj->set($sessId,'',SESS_LIFTTIME);
			//$ret = self::$cacheObj->set($sessId,$data,'session');//当cache为cache_file时启用
            if (TRUE != $ret)
            {
                die("Fatal Error: Session ID $sessId init failed!");
                return FALSE;
            }
            return TRUE;
        }
    }
    
    //写操作
    public function sessWrite($sessId = '', $data = '')
    {
		$ret = self::$cacheObj->set($sessId,$data,SESS_LIFTTIME);
		//$ret = self::$cacheObj->set($sessId,$data,'session');//当cache为cache_file时启用
        if (TRUE != $ret)
        {
            die("Fatal Error: SessionID $sessId Save data failed!");

            return FALSE;
        }

        return TRUE;
    }
    
    //注销操作
    public function sessDestroy($sessId = '')
    {
        self::sessWrite($sessId);

        return FALSE;
    }
    //过期回收机制
    public function sessGc()
    {
        //无需额外回收,cache有自己的过期回收机制
        return TRUE;
    }
    //初始化
    public function initSess()
    {
//将 session.save_handler 设置为 user，而不是默认的 files
        ini_set('session.save_handler', 'user');

        $domain = WEB_DOMAIN;
        //不使用 GET/POST 变量方式
        ini_set('session.use_trans_sid',    0);

        //设置垃圾回收最大生存时间
        ini_set('session.gc_maxlifetime',   SESS_LIFTTIME);

        //使用 COOKIE 保存 SESSION ID 的方式
        ini_set('session.use_cookies',      1);
        ini_set('session.cookie_path',      '/');

        //多主机共享保存 SESSION ID 的 COOKIE
        ini_set('session.cookie_domain',    $domain);


        //定义 SESSION 各项操作所对应的方法名：
        session_set_save_handler(
                array(&$this, 'sessOpen'),   
                array(&$this, 'sessClose'),
                array(&$this, 'sessRead'),
                array(&$this, 'sessWrite'),
                array(&$this, 'sessDestroy'),
                array(&$this, 'sessGc')
                );

		session_start();
		header("Cache-control: private");
		return TRUE;
	}
}
?>