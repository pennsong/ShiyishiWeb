<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/swfobject.js"></script>
<div id="content" class="container_24">
<div id="msindex">
  <h1><span class="floatRight"><!--{$roominfo.ename}--></span>视一视在线视频面试大厅系统-企业端</h1>
  <div id="msleft">
    <div id="msmingdan">
      <h2><span class="floatRight mszd"><img src="<!--{$baseurl}-->/images/msleftzd.jpg" /></span>应聘者名单</h2>
      <div id="msmingdanmain">
        <ul id="intusers_list">
          <li><img src="<!--{$baseurl}-->/images/loading.gif" align="absmiddle"/> 加载中...</li>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
    <div id="msmess">
      <h2><span class="floatRight mszd"><img src="<!--{$baseurl}-->/images/msleftzd.jpg" /></span>系统广播</h2>
      <div id="msmessmain">
        <ul>
          <li>欢迎大家来到视一视在线视频面试大厅系统！</li>
        </ul>
      </div>
    </div>
  </div>
  <div id="msright"><div style="margin-left:85px;margin-top:130px;">视屏面试大厅加载中......</br><img src="<!--{$baseurl}-->/images/msdatu.jpg" align="absmiddle"/></div></div>
</div>
<script type="text/javascript">
var timeoutid = timeoutUid = null;
var eid = <!--{$eid|default:0}-->,curuid = <!--{$userid|default:0}-->,curPname = '<!--{$uname}-->';
var wait = false;
function checkHoldStatus(){
	$.ajax({
		type:"POST",
		url:"/ajax/intlist.do",
		dataType:"html",
		data:'eid='+eid,
		success:function(msg)
		{
			if(!msg){
				if(timeoutid!=null)clearTimeout(timeoutid);
			}else{
				if(msg=='over'){
					msg = '面试已结束！';
					if(timeoutid!=null)clearTimeout(timeoutid);
				}
				$("#intusers_list").html(msg);
			}
		}
	});
}

function checkCurUser(){
	$.ajax({
		type:"POST",
		url:"/ajax/curuser.do",
		dataType:"html",
		data:'eid='+eid,
		success:function(msg)
		{
			if(msg=='over'){
				if(timeoutUid!=null)clearTimeout(timeoutUid);
				alert("本次面试已经结束");
				window.location.href="/";
			}else if(msg=='wait'){
				if(!wait){
					wait = true;
					$("#msright").html('<div style="margin-left:85px;margin-top:130px;">请等待面试者进入面试......</br><img src="<!--{$baseurl}-->/images/msdatu.jpg" align="absmiddle"/></div>');
				}
			}else{
				var val = msg.split("|:::|");
				if(curuid!=val[1]){
					curPname = val[0];
					curuid = val[1];
					loadswf();
				}
			}
		}
	});
}

function getPlayerName(){
	return curPname;
}

function loadswf(){
	var isIE = false;
	if (window.ActiveXObject){
		isIE = true;
	}
	if(isIE){
		var musicStr="";
		musicStr+='<object id="radioplayer"  classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="736" height="672" name="interviewonline">';
		musicStr+='<param name="movie" value="/images/interview0507.swf?id=<!--{$user|default:"user"}-->&role=<!--{$roleid|default:1}-->&userid=<!--{$uid|default:0}-->&roomid=<!--{$roomid|default:0}-->&apurl=rtmp://www.shiyishi.cn:8008/<!--{$room|default:"room1"}-->" />';
		musicStr+='<param name="allowScriptAccess" value="always" />';
		musicStr+='<param name="quality" value="high" />';
		musicStr+='<embed name="interviewonline" src="/images/interview0507.swf?id=高级管理&role=2&userid=<!--{$uid|default:0}-->&roomid=<!--{$roomid|default:0}-->&apurl=rtmp://www.shiyishi.cn:8008/<!--{$room|default:"room1"}-->" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" allowScriptAccess="always" width="736" height="672"></embed>';
		musicStr+='</object>';
		document.getElementById("msright").innerHTML=musicStr;
	}else{
		var swfVersionStr = "10.0.0";
		var xiSwfUrlStr = "/images/playerProductInstall.swf";
		var flashvars = {};
		flashvars.id = '高级管理';
		flashvars.role = '2';
		flashvars.userid = '<!--{$uid|default:"l0"}-->';
		flashvars.roomid = '<!--{$roomid|default:0}-->';
		flashvars.apurl = 'rtmp://www.shiyishi.cn:8008/<!--{$room|default:"room1"}-->" />';
		var params = {};
		params.quality = "high";
		params.allowscriptaccess = "always";
		params.allowfullscreen = "true";
		var attributes = {};
		attributes.id = "interviewonline";
		attributes.name = "interviewonline";
		swfobject.embedSWF("/images/interview0507.swf", "msright",  "736", "672", swfVersionStr, xiSwfUrlStr,  flashvars, params, attributes);
	}
}

window.onload = function(){
	checkHoldStatus();
	<!--{if $intnum>0}-->
	loadswf();
	<!--{/if}-->
	timeoutUid = setInterval("checkCurUser()",3000);
	timeoutid = setInterval("checkHoldStatus()",5000);
}
</script>
<!--{include file="include/footer.tpl"}-->