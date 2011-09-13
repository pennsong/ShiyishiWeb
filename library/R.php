<?php

class R
{
	/**
	 * 容器
	 *
	 * @var array
	 */
	static $_data = array();
	
	/**
	 * 注册一个Key 的值
	 *
	 * @param string $key
	 * @param mix $value
	 */
	public static function set($key, $value)
	{
		self::$_data[$key] = $value;
		return $value;
	}

	/**
	 * 获得一个Key的值
	 *
	 * @param string $key
	 * @return mix
	 */
	public static function get($key)
	{
		if(!isset(self::$_data[$key]))
		{
			return null;
		}
		return self::$_data[$key];
	}
}
