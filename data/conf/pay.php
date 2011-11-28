<?php
return array(
	'alipay' => array(
		'partner'        => "2088101022429700", //合作身份者ID
		'security_code'  => "kag06wrj2s8ka9mr7q3i6i34tx8sm9r6", //安全检验码
		'seller_email'   => "zhongpiaozaixian@yahoo.com.cn", //签约支付宝账号或卖家支付宝帐户
		'logName'        => APP_DATA_DIR."/paylog/alipay_HTML.log",//日志目录
		'submit_type'    => 'get', //可选get OR post
		'mainname'       => "票虫网" //收款方名称，如：公司名称、网站名称、收款人姓名等
	),
	'default' => 'alipay'
);
?>