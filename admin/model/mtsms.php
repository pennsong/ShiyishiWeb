<?php
/****
* SMTP 短信发送类
*/
//error_reporting(E_ALL);
class mtsms_Model extends Model{
	
	function init(){
		$this->mtsms = $this->conf = Load::conf('mtsms');
		$this->mtsmso = new SoapClient($this->mtsms['url']);//对象
	}
	/***
	 * 短信发送  (注:此方法必须为已登录状态下方可操作)
	 * 
	 * @param string $mobiles		手机号, 如 159xxxxxxxx,如果需要多个手机号群发,159xxxxxxxx,159xxxxxxx2 
	 * @param string $content		短信内容 GBK
	 * @param string $sendTime		定时发送时间，格式为 yyyymmddHHiiss, 即为 年年年年月月日日时时分分秒秒,例如:20090504111010 代表2009年5月4日 11时10分10秒
	 * 								如果不需要定时发送，请为'' (默认)
	 */
	function send($mobiles,$smscontent,$sendtime=''){
		$message = array('phoneNumber'=>$mobiles,'content'=>$smscontent,);
		//$content = file_get_contents('http://3tong.cn:8082/ema_new/http/SendSms?Account=88010110&Password=cbff36039c3d0212b3e34c23dcde1456&SubCode=&Phone=13811058234&Content=adsfassda sdf ');
		$res = $this->mtsmso->sendSms($this->mtsms['account'],$this->mtsms['password'], $message,$sendResMsg, $errMsg);
		if($res->errMsg > -1){
			$this->logstr("发送".$smscontent."至".$mobiles."成功");
			return 'success';
		}else{
			$this->logstr("发送".$smscontent."至".$mobiles."失败");
			return 'fail';
		}
	}

	function httpsend($phone,$str){
		$content = file_get_contents('http://3tong.cn:8082/ema_new/http/SendSms?Account='.$this->mtsms['account'].'&Password='.$this->mtsms['password'].'&SubCode=&Phone='.$phone.'&Content='.$str);
		if($content>0){
			return 'success';
		}else{
			return 'fail';
		}
	}


	function logstr($str){
		$james=fopen($this->mtsms['logName'],"a+");
		fwrite($james,"\r\n".date("Y-m-d H:i:s").$str);
		fclose($james);
	}
}
?>