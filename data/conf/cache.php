<?php
//memcached -d -m 2048  -u root -l 127.0.0.1 -p 11211 -c 1024 -P /tmp/memcached.pid
return array(
	'default' => array(
		'prefix' => 'sys_',
		'expires' => 86400,
		'mem' => array(
			'servers' => array(
				array('host' => '127.0.0.1', 'port' => 11211, 'weight'=> 100)
			),
			'expires' => 0
		)
	),
);
?>