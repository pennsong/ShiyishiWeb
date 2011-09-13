<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link href="<!--{$baseurl}-->/styles/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<div class="main">
  <div class="login">
    <div class="red_top_box" style="width: 975px;"></div>
    <div class="red_center_box" style="width: 973px;">
      <div class="user_login" style="width: 973px;">
        <div class="title">找回密码</div>
        <div class="login_form">
          <form id="getpwdForm" name="getpwdForm" class="cmxform" action="<!--{$baseurl}-->/do/getpwd.do" method="post">
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
              <li style="margin-top:20px;">
                <label></label>
                <span class="btn_login"><a style="cursor:pointer;" onclick="if(fm_chk(oo('getpwdForm')))oo('getpwdForm').submit();">找回密码</a></span>
              </li>
            </ol>
          </form>
        </div>
      </div>
    </div>
    <div class="red_bottom_box" style="width: 975px;"></div>
  </div>
  <div class="clearfix"></div>
  <div class="bottom"></div>
</div>
<!--{include file="include/footer.tpl"}-->