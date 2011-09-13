<?php
/**
 * App Framework
 * write by kinglv 2009-6-22
 */
class APP_Response
{
	protected $_exceptions = array();

	public function redirect($url, $code = 302){
		$this->_headers['R'] = array(
			'name'    => 'Location',
			'value'   => $url,
			'replace' => true
		);
		@header('Location: ' . $url, true, $code);
		exit;
	}

	public function setHttpResponseCode($code){
		@header('HTTP/1.1 ' . $code);
		return $this;
	}

	public function send($content = null){
		exit($content);
	}
}
