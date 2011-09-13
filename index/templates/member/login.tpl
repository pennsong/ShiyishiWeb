<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="glogin2">
    <div id="gloginright2">
      <h2></h2>
      <div id="gloginleft2">
        <ul>
          <li>还没有自己的账户吗？赶快注册一个吧！
            <p><a href="<!--{$baseurl}-->/member/register.html?r=<!--{$backurl}-->"><img src="<!--{$baseurl}-->/images/zhuce.gif" style="border:0px;"/></a></p>
          </li>
        </ul>
      </div><form id="loginForm" name="loginForm" action="<!--{$baseurl}-->/do/ulogin.do" method="post" onsubmit="return checkLogin();"><input type="hidden" name="r" value="<!--{$backurl}-->" />
      <ul class="fengeline">
        <li><span class="glogintext">用户名：</span>
          <input type="text" class="k" value="您注册时的邮箱地址" name="uemail" id="uemail"/>
        </li>
        <li><span class="glogintext">密码：</span>
          <input class="k" id="upassword" name="upassword" type="password" />
        </li>
        <li><span class="glogintext">&nbsp;</span>
          <input name="rememberme" type="checkbox" value="1" />
          记住我的用户名</li>
        <li><span class="glogintext">&nbsp;</span><input type="image" src="<!--{$baseurl}-->/images/denglu.gif" width="90" height="34" align="absmiddle" /> <a href="<!--{$baseurl}-->/member/getpwd.html">忘记密码</a></li>
      </ul></form>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<script type="text/javascript">
function checkLogin(){
	var e = $("#uemail").val();
	var p = $("#upassword").val();
	if (e==""){
		alert("请填写用户名，即您注册时的邮箱地址");
		document.getElementById('uemail').focus();
		return false;
	}

	if (!e.match(/^[\w]{1}[\w\.\-_]*@[\w]{1}[\w\-_\.]*\.[\w]{2,4}$/i) ) {
		alert("请输入有效合法的E-mail地址 ！");
		document.getElementById('uemail').focus();
		return false;
	}

	if (p==""){
		alert("请输入登录密码");
		document.getElementById('upassword').focus();
		return false;
	}
	return true;
}

$(document).ready(function(){
	$("#uemail").css({color:"#3c3c3c"});
	$("#uemail").focus(function(){
		if($("#uemail").val()=='您注册时的邮箱地址'){
			$("#uemail").css({color:"#000"});
			$("#uemail").val('');
		}
	});
	$("#uemail").blur(function(){
		if($("#uemail").val()==''){
			$("#uemail").css({color:"#3c3c3c"});
			$("#uemail").val('您注册时的邮箱地址');
		}
	});	
});	
</script>
<!--{include file="include/footer.tpl"}-->