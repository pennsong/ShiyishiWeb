<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="city_login">
    <div id="index_login_left">
      <form id="loginForm" name="loginForm" action="<!--{$baseurl}-->/do/ulogin.do" method="post" onsubmit="return checkLogin();">
      <div id="index_login_left_l">
        <ul>
          <li><img src="<!--{$baseurl}-->/images/jc_dot01.gif" />&nbsp;账号：
            <input type="text" style="width:93px;" value="您注册时的邮箱地址" name="uemail" id="uemail"/>
          </li>
          <li><img src="<!--{$baseurl}-->/images/jc_dot01.gif" />&nbsp;密码：
            <input style="width:93px;" id="upassword" name="upassword" type="password" />
          </li>
          <li><a href="<!--{$baseurl}-->/member/register.html">新用户注册</a> <a href="<!--{$baseurl}-->/member/getpwd.html">忘记密码</a> <a href="<!--{$baseurl}-->/help.html">帮助</a></li>
        </ul>
      </div>
      <div id="index_login_left_r"><input type="image" src="<!--{$baseurl}-->/images/loginbtn.gif" /></div>
	  </form>
      <div id="index_login_left_b">
        <ul>
          <li><a href="<!--{$baseurl}-->/member/register.html"><img src="<!--{$baseurl}-->/images/jwreg.gif" /></a></li>
          <li><span class="login_zhiwei">总职位:234234个,总简历:234234份</span></li>
        </ul>
      </div>
    </div>
    <div id="index_login_right">
      <ul>
        <li>城&nbsp;&nbsp;市：
          <select name="" class="selectbg" disabled="disabled">
            <option>北京</option>
          </select>
        </li>
        <li>行&nbsp;&nbsp;业：
          <select name="" class="selectbg">
          </select>
        </li>
        <li>岗&nbsp;&nbsp;位：
          <select name="" class="selectbg">
          </select>
        </li>
        <li>时&nbsp;&nbsp;间：
          <select name="" class="selectbg">
          </select>
        </li>
        <li>
          <input class="index_searchtext" type="text" value="输入公司或者职位" />
          <input class="index_searchin" type="button"  />
        </li>
      </ul>
    </div>
    <div id="city_news">
      <ul>
        <li>·<a href="#">北京瑞源国际物流有限公司急聘海运</a></li>
        <li>·<a href="#">北京瑞源国际物流有司急聘海运操作</a></li>
        <li>·<a href="#">北京瑞源国际物流有司急聘海运操作</a></li>
        <li>·<a href="#">北京瑞源国际物流有限公司急聘海运</a></li>
        <li>·<a href="#">北京瑞源国际物流有司急聘海运操作</a></li>
        <li>·<a href="#">北京瑞源国际物流有司急聘海运操作</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="grid_24">
  <div id="index_tese"><img src="<!--{$baseurl}-->/images/index_tese.jpg" border="0" usemap="#Map" />
    <map name="Map" id="Map">
      <area shape="rect" coords="-34,-16,461,93" href="#" />
      <area shape="rect" coords="463,3,955,97" href="#" />
    </map>
  </div>
  <div id="index_zhaopin">
    <h2>最新招聘企业</h2>
    <ul>
      <li><img src="<!--{$baseurl}-->/images/zhongshiyoulogo.gif" />
        <p><a href="#">中国石油</a></p>
      </li>
      <li><img src="<!--{$baseurl}-->/images/zhongshiyoulogo.gif" />
        <p><a href="#">中国石油</a></p>
      </li>
      <li><img src="<!--{$baseurl}-->/images/zhongshiyoulogo.gif" />
        <p><a href="#">中国石油</a></p>
      </li>
      <li><img src="<!--{$baseurl}-->/images/zhongshiyoulogo.gif" />
        <p><a href="#">中国石油</a></p>
      </li>
      <li><img src="<!--{$baseurl}-->/images/zhongshiyoulogo.gif" />
        <p><a href="#">中国石油</a></p>
      </li>
      <li><img src="<!--{$baseurl}-->/images/zhongshiyoulogo.gif" />
        <p><a href="#">中国石油</a></p>
      </li>
      <li><img src="<!--{$baseurl}-->/images/zhongshiyoulogo.gif" />
        <p><a href="#">中国石油</a></p>
      </li>
      <div class="clearfix"></div>
    </ul>
  </div>
</div>
<div class="clearfix"></div>
<div id="link">
  <h2>友情链接</h2>
  <ul>
    <li><a href="#">百度</a></li>
    <li><a href="#">百度</a></li>
    <li><a href="#">百度</a></li>
    <li><a href="#">百度</a></li>
    <li><a href="#">百度</a></li>
    <li><a href="#">百度</a></li>
    <li><a href="#">百度</a></li>
  </ul>
</div>
<!--{include file="include/footer.tpl"}-->