<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link href="<!--{$baseurl}-->/styles/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/box.js"></script>
<div class="main">
  <div class="login">
    <div class="red_top_box left_width"></div>
    <div class="red_center_box left_width">
      <div class="user_login">
        <div class="title">用户登录</div>
        <div class="login_form">
          <form id="loginForm" name="loginForm" class="cmxform" action="<!--{$baseurl}-->/do/login.do" method="post">
            <input type="hidden" name="r" value="<!--{$backurl}-->" />
            <ol>
              <li style="margin-top:5px;">
                <label>账号：</label>
                <input type="text" id="loginusername" name="loginusername" style="width:200px;"  alt="账号:空"/>
                <span id="showResult_loginusername" style="display:none;">请输入账号</span>
              </li>
			  <li>
                <label></label>
                <span style="margin-left:7px;">帐号为你的会员卡号、用户名、email之中的任一个</span>
              </li>
              <li style="margin-top:5px;">
                <label>密码：</label>
                <input type="password" id="loginpassword" name="loginpassword" style="width:200px;" alt="密码:空" />
                <span id="showResult_loginpassword" style="display:none;">请输入密码</span>
              </li>
              <li style="margin-top:20px;">
                <label></label>
                <span class="btn_login"><a style="cursor:pointer;" onclick="if(fm_chk(oo('loginForm')))oo('loginForm').submit();">登 录</a></span> <a href="" class="mima">忘记密码？</a>
              </li>
            </ol>
          </form>
        </div>
      </div>
    </div>
    <div class="red_bottom_box left_width"></div>
  </div>
  <div class="reg">
    <div class="blue_top_box right_width"></div>
    <div class="blue_center_box right_width">
      <div class="user_reg">
        <div class="title">新用户注册</div>
        <div class="reg_form">
          <form id="regForm" name="regForm" class="cmxform" action="<!--{$baseurl}-->/do/reg.do" method="post">
            <input type="hidden" name="r" value="<!--{$backurl}-->" />
            <ol>
              <li>
                <label>账号：</label>
                <input type="text" name="info[email]" id="email" style="width:160px;" alt="注册邮箱:空/邮件/验证^email"/>
                <span id="showResult_email">请输入有效地邮件地址，当密码遗失时凭此领取</span>
              </li>
              <li>
                <label>密码：</label>
                <input type="password" name="info[password]" id="password0" style="width:160px;" alt="密码:空/长度@6-14/英文数字/怪字符"/>
                <span id="showResult_password0">密码长度6~14位，字母区分大小写。</span>
              <li>
                <label>确认密码：</label>
                <input type="password" name="info[password1]" id="password1" style="width:160px;" alt="确认密码:空/确认@password0"/>
                <span id="showResult_password1">请再次输入您设置的密码</span>
              </li>
              <li>
                <label>验证码：</label>
                <input name="validate" type="text" id="vdcode" style='width:50px;ime-mode:disabled;text-transform:uppercase;color: rgb(51,51,51);' alt="验证码:空/长度@4" autocomplete = "off"/> <img id="vdimgck" src="<!--{$baseurl}-->/virfycode.do" alt="验证码" align="absmiddle" /> <a onclick="document.getElementById('vdimgck').src='<!--{$baseurl}-->/virfycode.do?random='+Math.random()" style="cursor:pointer;">看不清？</a>
                <span id="showResult_vdcode"></span>
              </li>
              <li>
                <label style="float:left;">&nbsp;</label>
                <span class="btn_reg"><a style="cursor:pointer;" onclick="submitCheck();">立即注册</a></span>
                <div class="btn_checkbox">
                  <input type="checkbox" checked="checked" id="termV"/>
                  <span><a onclick="showTerm();" style="cursor:pointer;">我已阅读以下协议并同意</a></span></div>
              </li>
            </ol>
          </form>
        </div>
      </div>
    </div>
    <div class="blue_bottom_box right_width"></div>
  </div>
  <div class="clearfix"></div>
  <div class="bottom"></div>
</div>
<script type="text/javascript">
function submitCheck(){
	if(fm_chk(oo('regForm'))){
		if(document.getElementById('termV').checked == true){
			oo('regForm').submit();
		}else{
			alert("请先仔细阅读会员协议并同意方可继续注册。");
		}
	}
}
function showTerm(){
	//$("<div id='MaskLyer'/>").appendTo("body").css({width:$(window).width()-5,height:500});
	var h = 462;//$(window).height();
	var w = 580;//h*4.4/3;
	$.box.show('',"/term.html",w,h,5);
	if ($.browser.msie && $.browser.version<7) $("select").hide();
}
function termOK(){
	$.box.close();
	document.getElementById('termV').checked = true;
}
</script>
<!--{include file="include/footer.tpl"}-->