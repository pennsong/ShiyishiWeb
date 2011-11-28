<?php
return array(
	'www' => array(
		'rule' => array(
			array("^(about|media|faq|terms)\.html", "pages/index-parm-$1"),
			array("^logout\.html", "do/logout"),
			array("^help\.html(.*)", "faq/$1"),
			array("^i\/([0-9]+)", "interview/online-id-$1"),
			array("^r\/([0-9]+)", "member/register/index-uid-$1"),
			array("^help\/([0-9]+)\.html", "faq/index-id-$1"),
			array("^jobs\/view\/([0-9]+)\.html", "jobs/view-id-$1"),
			array("^company\/view\/([0-9]+)\.html", "company/view-id-$1"),
			array("^news\/cat\_([0-9]+)(\/pn([0-9]+))?", "news/index-catid-$1-page-$3"),
			array("^news\/item\/([0-9]+)\.html", "news/view-id-$1"),
			array("^member\/regok\.html", "member/register/regok"),
			array("^member\/resume\/add(cn|en)\.html", "member/resume/add-rtype-$1")
		),

		'module' => array(
			'member' => APP_CTRL_DIR.'/member',
			'enterp' => APP_CTRL_DIR.'/enterp',
			'api' => APP_CTRL_DIR.'/api'
		)
	),
	'subdomain' => array(
		'rule' => array(
			array("^jobs\/view\/([0-9]+)\.html", "jobs/view-id-$1"),
			array("^company\/view\/([0-9]+)\.html", "company/view-id-$1"),
			array("^news\/cat\_([0-9]+)(\/pn([0-9]+))?", "news/index-catid-$1-page-$3"),
			array("^news\/item\/([0-9]+)\.html", "news/view-id-$1")
		)
	),
	'admin' => array(
		'rule' => array(
			array("^(login|logout)(.*)", "index/$1$2"),
			array("^admin\/(qz|mdr|ylq)resume(.*)", "admin/txtresume$2"),
			array("^admin\/(hdp|homerank|hotyugao|hotshow|tjhd)(_city|)(.*)", "admin/$1$3"),
			array("^admin\/mail(user|task)summary(.*)", "admin/mailsummary$2")
		),

		'module' => array(
			'admin' => APP_CTRL_DIR.'/admin'
		)
	)
);
?>
