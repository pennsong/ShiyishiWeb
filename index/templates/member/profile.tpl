<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <form id="profileForm" name="profileForm" class="cmxform" action="<!--{$baseurl}-->/member/do/profile.do" method="post" onsubmit="return fm_chk(this);">
      <div id="gcenterrightc">
        <h2>修改密码</h2>
        <div id="gloginrightmain">
          <ul>
            <li><span class="glogintext">旧密码：</span>
              <input type="password" id="oldpassword" name="info[oldpassword]" style="width:160px;" alt="旧密码:空"/>
              <span id="showResult_oldpassword">请输入旧密码。</span>
            </li>
            <li><span class="glogintext">新密码：</span>
              <input type="password" name="info[password]" id="password0" style="width:160px;" alt="密码:空/长度@6-14/英文数字/怪字符"/>
              <span id="showResult_password0">密码长度6~14位，字母区分大小写。不修改请为空</span>
            </li>
            <li><span class="glogintext">确认新密码：</span>
              <input type="password" name="info[password1]" id="password1" style="width:160px;" alt="确认密码:确认@password0"/>
              <span id="showResult_password1">不修改请为空</span>
            </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <ul>
            <li><span class="glogintext">&nbsp;</span><input type="image" src="<!--{$baseurl}-->/images/baocun.gif" /></li>
          </ul>
        </div>
        <div class="topmargin10px"></div>
      </div></form>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->