<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/box.js"></script>
<script src="<!--{$weburl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div id="content" class="container_24">
  <div class="grid_19">
    <div id="joblistsearch">
      <h2>职位搜索</h2><form id="jobSearchForm" name="jobSearchForm" action="<!--{$weburl}-->/jobs.html" method="get" onsubmit="return checkSjob();">
      <ul>
        <li><span class="floatLeft">地区：</span><a onclick="OpenW('city');" style="cursor:pointer;" class="indexinputbg" id="s_city" ><!--{if $c}--><!--{$c}--><!--{else}--><!--{$cityinfo.area_name|default:'请选择城市'}--><!--{/if}--></a><input type="hidden" name="cid" id="s_cityid" value="<!--{if $cid}--><!--{$cid}--><!--{else}--><!--{$cityinfo.id}--><!--{/if}-->"/>
		<input type="hidden" name="s_city" id="s_city_1" value="<!--{$c}-->" />
		</li>
        <li><span class="floatLeft">行业：</span><a onclick="OpenW('dustrytype');" style="cursor:pointer;" class="indexinputbg" id="s_dustrytype"><!--{if $d}--><!--{$d}--><!--{else}-->请选择行业<!--{/if}--></a><input type="hidden" name="dt" id="s_dustrytypeid" value="<!--{$dt}-->" />
		<input type="hidden" name="s_dustrytype" id="s_dustrytype_1" value="<!--{$d}-->" />
		</li>
        <li><span class="floatLeft">职位：</span><a onclick="OpenW('funtype');" style="cursor:pointer;" class="indexinputbg" id="s_funtype"><!--{if $f}--><!--{$f}--><!--{else}-->请选择岗位<!--{/if}--></a><input type="hidden" name="ft" id="s_funtypeid" value="<!--{$ft}-->"/>
		<input type="hidden" name="s_funtype" id="s_funtype_1" value="<!--{$f}-->" />
		</li>
        <li>时间:<input type="tetx" name="jd" class="Wdate" onClick="WdatePicker()" style="width:80px;" value="<!--{$jd}-->" /></li>
        <li>关键字:<input type="text" name="kw" id="s_keyword" value="<!--{if $kw}--><!--{$kw}--><!--{else}-->输入公司或者职位<!--{/if}-->" style="width:105px;"/></li>
        <li><input type="image" src="<!--{$baseurl}-->/images/Button_Search.gif" align="absmiddle" /></li>
      </ul></form>
    </div>
    <!--{include file="pagejob.tpl"}-->
    <div id="joblisttitle">
      <ul>
        <li class="name">职位名称</li>
        <li class="company">公司名称</li>
        <li class="subcompany">所属部门</li>
        <li class="add">工作地点</li>
        <li class="gold">职位月薪</li>
        <li class="date">更新日期</li>
      </ul>
    </div>
    <div id="joblist">
      <!--{foreach from=$rows item=item}-->
	  <div id="joblistmain">
        <!--<div id="jobbutton">
          <input name="" type="checkbox" value="" />
        </div>-->
        <div id="jobppname"><a href="<!--{$baseurl}-->/jobs/view/<!--{$item.id}-->.html"><!--{$item.title}--></a></div>
        <div id="jobcom"><a href="<!--{$baseurl}-->/jobs/view/<!--{$item.id}-->.html"><!--{$item.ename}--></a></div>
        <div id="jobsubcompany"><!--{$item.subcompany}--></div>        
        <div id="jobadd"><!--{$item.proname}-->-<!--{$item.cityname}--></div>
        <div id="jobgold"><!--{$item.money}--></div>
        <div id="jobdate"><!--{$item.modifydate|date_format:"%Y-%m-%d"}--></div>
        <div id="jobzhai"><!--{$item.jtext}--></div>
        <div id="jobbutton2"><a href="<!--{$baseurl}-->/member/do/applyjob.do?jobid=<!--{$item.id}-->"><img src="<!--{$baseurl}-->/images/Button_Apply.gif" /></a></div>
      </div>
      <!--{/foreach}-->
    </div>
    <!--{include file="pagejob.tpl"}-->
  </div>
  <div class="grid_5">
    <div id="listlogin">
      <h2>会员登录</h2><form id="loginForm" name="loginForm" action="<!--{$baseurl}-->/do/ulogin.do" method="post" onsubmit="return checkLogin();">
      <ul>
        <li>账&nbsp;号：
          <input type="text" style="width:110px;" value="您注册时的邮箱地址" name="uemail" id="uemail"/>
        </li>
        <li>密&nbsp;码：
          <input style="width:110px;" id="upassword" name="upassword" type="password" />
        </li>
        <li class="center"><input type="image" src="<!--{$baseurl}-->/images/Button_Login.gif" /> <img src="<!--{$baseurl}-->/images/Button_Reg.gif" onclick="window.location.href='<!--{$baseurl}-->/member/register.html'" style="cursor:pointer;"/></li>
        <li class="center"><img src="<!--{$baseurl}-->/images/Icon1.gif" /> <a href="<!--{$baseurl}-->/member/register.html">注册个人用户</a></li>
      </ul></form>
    </div>
    <div id="hotjob">
      <h2>热门职位</h2>
      <ul>
		<!--{foreach from=$news key=key item=sitem}-->
        <li>·<a href="/jobs/view/<!--{$sitem.id}-->.html" target="_blank"><!--{$sitem.title}--></a></li>
		<!--{/foreach}-->
      </ul>
    </div>
  </div>
</div>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
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
	$("#"+selectid).html(_n);
	$("#"+selectid+'_1').val(_n);
	//tobj.options.length = 0;
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
<!--{include file="include/footer.tpl"}-->
