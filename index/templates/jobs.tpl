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

		<li><span class="">职位属性:</span>
		<select name="zhiweishuxin" id="zhiweishuxin" onchange="setZhiweileibie();">
		<option>请选择行业</option>
		 <!--{foreach from=$funtype item=item}-->
		 <option value="<!--{$item.id}-->" <!--{if $zhiweishuxin==$item.id}--> selected<!--{/if}-->><!--{$item.thename}--></option>
		 <!--{/foreach}-->
		</select>
		</li>
		<li><span class="">职位类别:</span>
		<select name="ft" id="ft">
		<option>请选择岗位</option>
		</select>
		</li>
        <li>时间:<select name="jd" class="" style="width:80px;">
             	<option value="5" <!--{if $jd==5}--> selected<!--{/if}-->>所有日期</option>    
        		<option value="1" <!--{if $jd==1}--> selected<!--{/if}-->>最近3天</option>
        		<option value="2" <!--{if $jd==2}--> selected<!--{/if}-->>最近1周</option>
        		<option value="3" <!--{if $jd==3}--> selected<!--{/if}-->>最近2周</option>
        		<option value="4" <!--{if $jd==4}--> selected<!--{/if}-->>最近1个月</option>       		        		        		
        		</select>
        </li>
        <li>关键字:<input type="text" name="kw" id="s_keyword" value="<!--{if $kw}--><!--{$kw}--><!--{else}-->输入公司或者职位<!--{/if}-->" style="width:80px;"/></li>
        <li><input type="image" src="<!--{$baseurl}-->/images/Button_Search.gif" align="absmiddle" /></li>
      </ul></form>
    </div>
    <!--{include file="pagejob.tpl"}-->
    <div id="joblisttitle">
      <ul>
        <li class="name">公司名称</li>
        <li class="company"></li>
        <li class="subcompany"></li>
        <li class="add"></li>
        <li class="gold"></li>
        <li class="add"></li>
        <li class="gold"></li>
        <li class="gold">&nbsp&nbsp&nbsp&nbsp&nbsp</li>
        <li class="date">更新日期</li>
      </ul>
    </div>
    <div id="joblist">
      <!--{foreach from=$rows item=item}-->
	  <div id="joblistmain">
        <!--<div id="jobbutton">
          <input name="" type="checkbox" value="" />
        </div>-->
        <div id="jobcom" style="left:40px"><a title="<!--{$item.ename}-->" href="<!--{$baseurl}-->/company/view/<!--{$item.cid}-->.html"><!--{$item.ename|substr:60}--></a></div>
        <div id="jobdate"><!--{$item.modifydate|date_format:"%Y-%m-%d"}--></div>

        <div id="jobbutton2"><a href="<!--{$baseurl}-->/jobs/view.php?id=<!--{$item.id}-->&apply=true" target="_blank"><img src="<!--{$baseurl}-->/images/Button_Apply.gif" /></a></div>
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
	if (($("#zhiweishuxin").val() > 0) && !($("#ft").val() > 0))
	{
		alert("请选择职位类别！");

		return false;
	} 
	
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

function setZhiweileibie(_val){
	_val = typeof(_val) != 'undefined' ? _val : null;
	var tobj = document.getElementById("ft");
	tobj.options.length = 0;
	tobj.options.add(new Option("请选择岗位",""));
	$.ajax({
		type:"POST",
		url:"/ajax/getZhiweileibie.do",
		dataType:"html",
		data:'zhiweishuxin='+$("#zhiweishuxin").val(),
		success:function(msg)
		{
			if (msg.length>0)
			{
				msg = msg.split(":");
				if(msg.length>0){
					for(var i=0;i<msg.length;i++){
						var val = msg[i].split("|");
						if (val[0] == _val)
						{
							tobj.options.add(new Option(val[1],val[0], false, true));
						}
						else
						{
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}

		}
	});
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
	setZhiweileibie(<!--{$ft}-->);
});	
</script>
<!--{include file="include/footer.tpl"}-->
