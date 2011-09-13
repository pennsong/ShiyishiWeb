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
                <span style="margin-left:7px;">帐号为你的会员卡号、用户名、email、手机之中的任一个</span>
              </li>
              <li style="margin-top:5px;">
                <label>密码：</label>
                <input type="password" id="loginpassword" name="loginpassword" style="width:200px;" alt="密码:空" />
                <span id="showResult_loginpassword" style="display:none;">请输入密码</span>
              </li>
              <li style="margin-top:20px;">
                <label></label>
                <span class="btn_login"><a style="cursor:pointer;" onclick="if(fm_chk(oo('loginForm')))oo('loginForm').submit();">登 录</a></span> <a href="<!--{$baseurl}-->/getpwd.html" class="mima">忘记密码？</a>
              </li>
            </ol>
          </form>
        </div>
      </div>
    </div>
    <div class="red_bottom_box left_width"></div>
  </div>
  <div class="reg1">
    <div class="blue_top_box right_width1"></div>
    <div class="blue_center_box right_width1">
        <div class="user_reg1">
            <div class="title">还不是票虫网用户?</div>
            <div class="info">
                现在免费注册成票虫网用户<br />
                便能立刻享受：免费送票、积分换礼、会员折扣！
            </div>
            <span class="btn_reg"><a href="<!--{$baseurl}-->/register.html?r=<!--{$backurl}-->">立即注册</a></span>
        </div>
    </div>
    <div class="blue_bottom_box right_width1"></div>
  </div>
  <div class="clearfix"></div>
  <div class="bottom"></div>
</div>
<!--{include file="include/footer.tpl"}-->