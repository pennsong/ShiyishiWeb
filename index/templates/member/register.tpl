<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/box.js"></script>
<div id="content" class="container_24">
<div class="grid_24">
  <div id="glogin">
    <div id="gloginleft">
      <ul>
        <li class="on">1 填写账户信息</li>
        <li>2 注册成功</li>
        <li>3 填写文字简历</li>
        <li>4 上传视频简历</li>
      </ul>
    </div>
    <form id="regForm" name="regForm" action="<!--{$baseurl}-->/do/ureg.do" method="post">
    <input type="hidden" name="r" value="<!--{$backurl}-->" />
    <div id="gloginright">
      <h2></h2>
      <ul>
        <li><span class="glogintext">E-Mail：</span>
          <input class="k" type="text" name="info[email]" id="email" alt="邮箱:空/邮箱" />
          <span id="showResult_email">请填写有效的E-mail地址作为下次登录的用户名</span></li>
        <li><span class="glogintext">手机：</span>
          <input class="k" type="text" name="info[mobile]" id="mobile" alt="手机:空/手机/验证^mobile"/>
          <span id="showResult_mobile">请确保号码有效、正确，以便及时接收面试邀请</span></li>
        <li><span class="glogintext">身份证：</span>
          <input class="k" type="text" name="info[idcard]" id="idcard" alt="身份证:空/长度@15-18/验证^idcard"/>
          <span id="showResult_idcard">请确保证件有效、正确</span></li>
        <li><span class="glogintext">密码：</span>
          <input class="k" type="password" name="info[password]" id="password0" alt="密码:空/长度@6-16/英文数字/怪字符" />
          <span id="showResult_password0">可由6-20位英文字母、数字或下划线组成</span></li>
        <li><span class="glogintext">确认密码：</span>
          <input class="k" type="password" name="info[password1]" id="password1" alt="确认密码:空/确认@password0" />
          <span id="showResult_password1">请重复输入密码</span></li>
        <!--{if $puid}-->
        <li><span class="glogintext">推 荐 人：</span>
          <input type="hidden" name="info[puid]" value="<!--{$puid}-->"/><input class="k" type="text" value="<!--{$pname}-->" readonly/>
          </li><!--{/if}-->
        <li><span class="glogintext">&nbsp;</span>
          <input type="checkbox" checked="checked" id="termV"/>
          我已阅读并接受视一视<a onclick="showTerm();" style="cursor:pointer;">用户协议</a></li>
        <li><span class="glogintext">&nbsp;</span><input type="image" onclick="return submitCheck();" src="<!--{$baseurl}-->/images/gloginbutton.gif" /></li>
      </ul>
    </div></form>
    <div class="clearfix"></div>
  </div>
</div>
<script type="text/javascript">
function submitCheck(){
	if(fm_chk(oo('regForm'))){
		if(document.getElementById('termV').checked == true){
			return true;
		}else{
			alert("请先仔细阅读会员协议并同意方可继续注册。");
			return false;
		}
	}
	return false;
}
function showTerm(){
	//$("<div id='MaskLyer'/>").appendTo("body").css({width:$(window).width()-5,height:500});
	var h = 462;//$(window).height();
	var w = 580;//h*4.4/3;
	$.box.show('',"<!--{$baseurl}-->/member/term.html",w,h,5);
	if ($.browser.msie && $.browser.version<7) $("select").hide();
}
function termOK(){
	$.box.close();
	document.getElementById('termV').checked = true;
}
</script>
<!--{include file="include/footer.tpl"}-->