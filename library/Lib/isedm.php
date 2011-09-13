<?php
/*************************************************
isedm 邮件发送接收接口
Author: guoli
Version: 1.0
*************************************************/
class isedm_Lib {
	
	/**
	 * 实例化Snoopy
	 */
	function __construct() {
		$this->snoopy = Load::lib('snoopy');
	}
	
	/**
	 * 生成签名
	 * @param $paramArr：api参数数组
	 * @return $signature
	 */
	
	function createSignature($paramArr) {
		ksort($paramArr);
		$ekeys = array('toEmailFile','contentFile','attachment');
		$signature = '';
		foreach ($paramArr as $key => $val) {
			if ($key !='' && !in_array($key,$ekeys)) {
				$signature .= $key."=".$val."&";
			}
		}
		//print_r($signature);exit;
		$signature = substr($signature, 0, strlen($signature) - 1);
		$signature = strtoupper(md5($signature));
		return $signature;
	}
	
	/**
	 * 获取用户验证key
	 * 
	 * @param pwd 用户在平台中的登录密码
	 * @param apiKey 分配给用户的API key
	 * @return
	 */
	function getUserKey($pwd,$apiKey){
		return strtoupper(md5(strtoupper(md5($pwd)).$apiKey.date('Ymd')));
	}
	
	
	/**
	 * 以POST方式访问api服务
	 * @param $paramArr：api参数数组
	 * @return $result
	 */
	function postResult($apiurl,$paramArr) {
		//组织参数，Snoopy类在执行submit函数时，它自动会将参数做urlencode编码
		$signature = $this->createSignature($paramArr);
		$paramArr['signature'] = $signature;
		//访问服务
		//print_r($paramArr);exit;
		$this->snoopy->submit($apiurl, $paramArr);
		$result = $this->snoopy->results;
		//返回结果
		return $result;
	}
	
	/**
	 * 以POST方式访问api服务，带文件
	 * @param $paramArr：api参数数组
	 * @param $fileArr：文件的本地地址，如array('toEmailFile' => 'C:/Users/richeninfo/Desktop/toEmailFile.txt')形式
	 * @return $result
	 */
	function postFileResult($apiurl,$paramArr, $fileArr) {
		//组织参数
		$signature = $this->createSignature($paramArr);
		$paramArr['signature'] = $signature;
		//访问服务
		$this->snoopy->_submit_type = "multipart/form-data";
		$this->snoopy->submit($apiurl, $paramArr, $fileArr);
		$result = $this->snoopy->results;
		//返回结果
		return $result;
	}
	
	/**
	 * 解析xml
	 */
	function getXmlResult ($strXml) {
		$pos = strpos($strXml, 'xml');
		if ($pos) {
			$xmlCode=simplexml_load_string($strXml,'SimpleXMLElement', LIBXML_NOCDATA);
			return $xmlCode;
		} else {
			return '未知错误';
		}
	}
}
?>