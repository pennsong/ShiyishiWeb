<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script src="<!--{$weburl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div id="content" class="container_24">
<div class="grid_24">
  <div <!--{if !$cityinfo}-->id="index_login"<!--{else}-->id="city_login"<!--{/if}-->>
    <div id="index_login_left">
      <!--{if $islogin}-->
      <div id="index_login_left_l">
        <ul>
          <li>您好，<!--{$logininfo.email}--></li>
          <li><a href="<!--{$baseurl}-->/member/">用户中心</a> <a href="<!--{$baseurl}-->/logout.html">退出</a></li>
        </ul>
      </div>
      <!--{else}-->
	  <form id="loginForm" name="loginForm" action="<!--{$baseurl}-->/do/ulogin.do" method="post" onsubmit="return checkLogin();">
      <div id="index_login_left_l">
        <ul>
          <li><img src="<!--{$baseurl}-->/images/jc_dot01.gif" />&nbsp;账号：
            <input type="text" style="width:93px;" value="您注册时的邮箱地址" name="uemail" id="uemail"/>
          </li>
          <li><img src="<!--{$baseurl}-->/images/jc_dot01.gif" />&nbsp;密码：
            <input style="width:93px;" id="upassword" name="upassword" type="password" />
          </li>
          <li><a href="<!--{$baseurl}-->/member/register.html">新用户注册</a> <a href="<!--{$baseurl}-->/help.html">帮助</a></li>
        </ul>
      </div>
      <div id="index_login_left_r"><input type="image" src="<!--{$baseurl}-->/images/loginbtn.gif" /></div>
      </form>
      <div id="index_login_left_b">
        <ul>
          <li><a href="<!--{$baseurl}-->/member/register.html"><img src="<!--{$baseurl}-->/images/jwreg.gif" /></a></li>
          <li><span class="login_zhiwei"><span style="color:#09A2DE;">简历总数:<!--{$resumenum}-->份 今日更新:<!--{$resumenum_t}-->份</span><br /><span style="color:#065FB9;">总职位数:<!--{$jobnum}-->个 今日更新:<!--{$jobnum_t}-->个</span></span></li>
        </ul>
      </div>
      <!--{/if}-->
    </div>
    <div id="index_login_right">
      <form id="jobSearchForm" name="jobSearchForm" action="<!--{$weburl}-->/jobs.html" method="get" onsubmit="return checkSjob();">
	  <ul>
        <!--{if !$cityinfo}-->
		<li><span class="floatLeft">城&nbsp;&nbsp;市：</span><a onclick="OpenW('city');" style="cursor:pointer;" class="indexinputbg2" id="s_city">请选择城市</a><input type="hidden" name="cid" id="s_cityid"/></li>
		<!--{else}-->
		<li><span class="floatLeft">城&nbsp;&nbsp;市：</span><a onclick="OpenW('city');" style="cursor:pointer;" class="indexinputbg2" id="s_city"><!--{$cityinfo.area_name}--></a><input type="hidden" value="<!--{$cityinfo.id}-->" name="cid" id="s_cityid"/></li>
		<!--{/if}-->
        <li><span class="floatLeft">行&nbsp;&nbsp;业：</span><a onclick="OpenW('dustrytype');" style="cursor:pointer;" class="indexinputbg2" id="s_dustrytype">请选择行业</a><input type="hidden" name="dt" id="s_dustrytypeid"/></li>
        <li><span class="floatLeft">岗&nbsp;&nbsp;位：</span><a onclick="OpenW('funtype');" style="cursor:pointer;" class="indexinputbg2" id="s_funtype">请选择岗位</a><input type="hidden" name="ft" id="s_funtypeid"/></li>
        <li>时&nbsp;&nbsp;间：<input type="tetx" name="jd" class="Wdate" onClick="WdatePicker()" style="width:147px;" /></li>
        <li>
          <input class="index_searchtext" type="text" name="kw" id="s_keyword" value="输入公司或者职位" style="float:left;"/>
          <input class="index_searchin" type="submit" value="" style="float:left;margin-left:5px;cursor:pointer"/>
        </li>
      </ul>
	  </form>
    </div>
	<!--{if !$cityinfo}-->
    <div id="index_diqu">
      <ul>
        <!--{foreach from=$zdcitys key=key item=item}-->
        <li><a href="http://<!--{$item.area_en}--><!--{$webdomain}-->/"><!--{$item.area_name}--></a><span class="index_diqu_zhiwei">(职位:<span class="index_diqu_shuzi"><!--{$item.jnum}--></span>个,简历:<span class="index_diqu_shuzi"><!--{$item.rnum}--></span>份)</span></li>
        <!--{/foreach}-->
        <div class="clearfix"></div>
      </ul>
    </div>
	<!--{/if}-->
    <div <!--{if !$cityinfo}-->id="index_news"<!--{else}-->id="city_news"<!--{/if}-->>
      <ul>
        <!--{foreach from=$hotjobs key=key item=item}-->
        <li>·<a href="<!--{$weburl}-->/jobs/view/<!--{$item.id}-->.html" target="_blank"><!--{$item.title}--></a></li>
        <!--{/foreach}-->
      </ul>
    </div>
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

function checkSjob(){
	var kw = $("#s_keyword").val();
	if(kw=='输入公司或者职位'){
		$("#s_keyword").val('');
	}
	return true;
}

function OpenW(_t,h,w){
	h = h ? h : 462;
	w = w ? w : 580;
	$.box.show('',"<!--{$weburl}-->/openw/"+_t+".html",w,h,5);
	if ($.browser.msie && $.browser.version<7) $("select").hide();
}

function checkOK(_t,_i,_n){
	var selectid = 's_'+_t;
	var inputid = selectid + 'id';
	var tobj = document.getElementById(selectid);
	$.box.close();
	$("#"+inputid).val(_i);
	//tobj.options.length = 0;
	$("#"+selectid).html(_n);
	//tobj.options.add(new Option(_n,_i));
}

function close(){
	$.box.close();
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
	$("#s_keyword").css({color:"#3c3c3c"});
	$("#s_keyword").focus(function(){
		if($("#s_keyword").val()=='输入公司或者职位'){
			$("#s_keyword").css({color:"#000"});
			$("#s_keyword").val('');
		}
	});
	$("#s_keyword").blur(function(){
		if($("#s_keyword").val()==''){
			$("#s_keyword").css({color:"#3c3c3c"});
			$("#s_keyword").val('输入公司或者职位');
		}
	});
});	
</script>
<div class="grid_24">
	<div id="index_jiangli">
    <h2>奖励规则</h2>
    <div id="index_jianglimain">凡本网站个人会员介绍他人成为本网站会员，被介绍人在其职业生涯中通过本网站<span class="red bold">每</span>成功应聘一次（被本网站企业会员成功录用），该介绍人都会获得本网站积分奖励。<a href="<!--{$baseurl}-->/rule.html">奖励规则详情请点击查看！</a>
    <img src="<!--{$baseurl}-->/images/jiangliguize.jpg" border="0" usemap="#Map2" />
    <map name="Map2" id="Map2">
      <area shape="rect" coords="62,14,182,50" href="<!--{$baseurl}-->/member/register.html" />
      <area shape="rect" coords="275,17,426,53" href="<!--{$baseurl}-->/member/tg/code.html" />
      <area shape="rect" coords="514,19,641,54" href="<!--{$baseurl}-->/member/tg/record.html" />
      <area shape="rect" coords="740,19,889,52" href="<!--{$baseurl}-->/member/tg/reward.html" />
    </map>
    </div>
  </div>
  <div id="index_tese"><img src="<!--{$baseurl}-->/images/index_tese.jpg" border="0" usemap="#Map" />
    <map name="Map" id="Map">
      <area shape="rect" coords="-34,-16,461,93" href="<!--{$baseurl}-->/geren.html" />
      <area shape="rect" coords="463,3,955,97" href="<!--{$baseurl}-->/qiye.html" />
    </map>
  </div>
<!--{if $relinks}-->
  <div id="index_zhaopin">
    <h2>推荐企业</h2>
    <ul>
	<!--{foreach from=$relinks key=key item=item}-->
		  <li><a href="<!--{$item.companyUrl}-->" target="_blank"><img  src="<!--{$item.companyLogo}-->" onerror="this.src='http://www.shiyishi.cn/images/no_e_user.jpg';" /></a>
			<p><!--{if $item.title}--><a href="<!--{$item.url}-->" target="_blank"><!--{$item.title}--></a><!--{/if}--></p>
		  </li>
	<!--{/foreach}-->
      <div class="clearfix"></div>
    </ul>
  </div>
<!--{/if}-->
</div>
<!--{datacall type='friendlinks' id='txt' num='50'}-->
<!--{include file="include/footer.tpl"}-->