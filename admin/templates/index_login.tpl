<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员登录 - <!--{$web.webname|default:'视一视'}--></title>
<link href="<!--{$baseurl}-->/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="login">
  <h1>管理员登录</h1>
  <form class="form" method="post" name="login" id="login" action ="<!--{$pageurl}-->/login.do">
  <input type="hidden" name="formhash" value="<!--{formhash}-->" />
    <div class="item">
      <label for="username">用户名：</label>
      <input id="username" name="admin_name" class="inpt" />
    </div>
    <div class="item">
      <label for="password">密　码：</label>
      <input id="password" name="admin_pwd" type="password" class="inpt" />
    </div>
    <div class="do"><a href="#" class="btn" onclick="document.getElementById('login').submit();"><span>登&nbsp;&nbsp;录</span></a></div>
  </form>
</div>
<div class="copy">Powered by  <!--{$web.webname|default:'视一视'}--> Ver <!--{$web.version|default:'Beta 1.00'}--> &copy; 2010, <a href="<!--{$web.weburl|default:'http://www.piaochong.com/'}-->" target="_blank"><!--{$web.domain|default:'piaochong.com'}--></a></div>
<script language="JavaScript"> 

</script>
<script type="text/javascript">
document.onkeydown = function(e){
	if(!e) e = window.event;//火狐中是 window.event
	if((e.keyCode || e.which) == 13){
		document.getElementById('login').submit();
	}
}
document.login.admin_name.focus();
</script>

</body>
</html>