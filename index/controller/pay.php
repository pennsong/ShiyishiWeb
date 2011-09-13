<?php
class pay_Controller extends Controller{

	function init(){
	}
	
	function indexAction(){
		$this->show404();
	}

	function alipayreturnAction(){
		//获取支付宝的反馈参数
		$_POST             = $_GET;
		$orderid           = (int)$_GET['out_trade_no'];//获取支付宝传递过来的订单号
		$total             = $_GET['total_fee'];//获取支付宝传递过来的总价格
		$uaccountmodel     = Load::model('user_account');
		$oinfo             = $uaccountmodel->find($orderid);
		$sOld_trade_status = $oinfo['doact'];    //获取商户数据库中查询得到该笔交易当前的交易状态
		//进行支付程序
		$paymodel = Load::model('alipay');
		$verify_result = $paymodel->notify();
		if($verify_result) {
			//验证成功
			if($oinfo['orderid']>0){
				$ordermodel = Load::model('order');
				if($orderinfo = $ordermodel->find($oinfo['orderid'])){
					$this->showmsg("恭喜，您通过支付宝在线支付订单“".$orderinfo['ordernum']."”成功",BASE_URL."/my/order.html",null,'进入我的订单管理');
				}
			}else{
				$msg = "恭喜，您成功通过支付宝支付了&yen;".$oinfo['money']."元。";
				$this->showmsg($msg,BASE_URL."/my/account.html",null,'进入个人中心');
			}
		}else {
			//验证失败
			$msg = "很遗憾，您通过支付宝支付&yen;".$oinfo['money']."元失败。";
			$this->showmsg($msg,BASE_URL."/my/account.html",null,'进入个人中心');
		}
	}
}
?>