<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<title>后台管理平台</title>
<link href="<!--{$baseurl}-->/css/common.css" rel="stylesheet" type="text/css" />
<script src="<!--{$baseurl}-->/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
function checkAll(_obj)
{
	var oid = 'citybox';
	var checkbox = document.getElementById(oid).getElementsByTagName("input");
	for(i=0;i<checkbox.length;i++){
		checkbox[i].checked = _obj.checked;
	}
}
</script>
</head>
<body>
<div class="tt">