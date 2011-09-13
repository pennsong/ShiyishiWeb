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
    <div id="msyqld">
      <h2><span class="floatRight mszd"><img src="<!--{$baseurl}-->/images/msleftzd.jpg" /></span>邀请领导</h2>
      <div id="msyqldmain">
        <ul>
          <li>手机：<input type="text" id="mobilephone" name="mobilephone" value="输入领导的手机号" onfocus="if(this.value=='输入领导的手机号'){this.value='';}" onblur="if(this.value==''){this.value='输入领导的手机号';}" style="width:95px;"/> <input type="button" value="邀请" onclick="YaoQingLD();"></li>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
    <div id="msmess">
      <h2><span class="floatRight mszd"><img src="<!--{$baseurl}-->/images/msleftzd.jpg" /></span>系统广播</h2>
      <div id="msmessmain" style="height:38px;">
        <ul>
          <li>欢迎大家来到视一视在线视频面试大厅系统！</li>
        </ul>
      </div>
    </div>
  </div>
  <div id="msright"><div style="margin-left:85px;margin-top:130px;">请在左侧的面试者列表中邀请面试者开始面试......</br><img src="<!--{$baseurl}-->/images/msdatu.jpg" align="absmiddle"/></div></div>
</div>
<script type="text/javascript">
var timeoutid = timeoutUid = null;
var curuid = '<!--{$userid|default:0}-->',curPname = '<!--{$uname}-->',curResume = '<!--{$resumeTxt}-->';
function checkHoldStatus(){
	$.ajax({
		type:"POST",
		url:"/enterp/ajax/intlist.do",
		dataType:"html",
		data:'roomid=0',
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

function checkCurUser(_uid){
	_uid = _uid>0 ? _uid : curuid;
	$.ajax({
		type:"POST",
		url:"/enterp/ajax/curuser.do",
		dataType:"html",
		data:'uid='+_uid,
		success:function(msg)
		{
			if(msg=='over'){
				if(timeoutUid!=null)clearTimeout(timeoutUid);
				if(confirm("当前面试者已经结束面试了，确定要开始面试下一位？")){
					intStart(0,1,1);
				}
			}
		}
	});
}

function intStart(_uid,_ing,_int){
	_uid = _uid>0 ? _uid : 0;
	_ing = _ing>0 ? _ing : 0;
	_int = _int>0 ? _int : 0;
	$.ajax({
		type:"POST",
		url:"/enterp/ajax/intstart.do",
		dataType:"html",
		data:'uid='+_uid+'&ing='+_ing+'&int='+_int,
		success:function(msg)
		{
			if(msg=='warn1'){
				if(confirm("当前有面试者正在面试中，确定要结束当前面试进行新的面试？")){
					intStart(_uid,1);
				}
			}else if(msg=='warn2'){
				if(confirm("已经发出过一次面试邀请，确定要取消当前的邀请进行新的面试？")){
					intStart(_uid,1,1);
				}
			}else if(msg=='none'){
				if(timeoutid!=null)clearTimeout(timeoutid);
				if(timeoutUid!=null)clearTimeout(timeoutUid);
				alert('已经没有在线面试者。');
				//window.top.location.href='<!--{$baseurl}-->/enterp/interview/over.html?id=<!--{$roomid|default:0}-->';
			}else if(msg=='msover'){
				if(confirm("已经面试过他了，是否从队列中第一位开始面试？")){
					intStart(0,1,1);
				}
			}else{
				var val = msg.split("|:::|");
				curPname = val[0];
				curResume = val[1];
				loadswf();
				timeoutUid = setInterval("checkCurUser("+val[2]+")",3000);
				alert("当前面试者为："+curPname+"，请等待他进入房间。");
			}
		}
	});
}

function YaoQingLD(){
	var val = $("#mobilephone").val();
	if(!val){
		alert("手机号不能为空");
	}else if(!(/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(val))){
		alert("手机号输入格式不正确");
	}else{
		$.ajax({
			type:"POST",
			url:"/enterp/ajax/yqld.do",
			dataType:"html",
			data:'mobile='+val,
			success:function(msg)
			{
				if(msg=='success'){
					alert("领导邀请短信已经发出。");
				}else if(msg=='had'){
					alert("已经邀请过了，最多只能邀请一位领导。");
				}else{
					alert("面试已结束");
				}
			}
		});
	}
}

function endIntView(){
	if(confirm('您是需要结束全部面试，点“是”的话所有人将会离开面试大厅！')){
		window.top.location.href='<!--{$baseurl}-->/enterp/interview/over.html?id=<!--{$roomid|default:0}-->';
	}else{
		//interNext();
	}
}

function  interNext(){
	intStart(0,1,1);
}

function getResume(){
	//return '<!--{$baseurl}-->/enterp/resume/view.html?uid=<!--{$uid}-->&t=cn';
	alert('fffff');
}

function getResumeTxt(){
	return curResume;
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
		musicStr+='<embed name="interviewonline" src="/images/interview0507.swf?id=<!--{$user|default:"user"}-->&role=<!--{$roleid|default:1}-->&userid=<!--{$uid|default:0}-->&roomid=<!--{$roomid|default:0}-->&apurl=rtmp://www.shiyishi.cn:8008/<!--{$room|default:"room1"}-->" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" allowScriptAccess="always" width="736" height="672"></embed>';
		musicStr+='</object>';
		document.getElementById("msright").innerHTML=musicStr;
	}else{
		var swfVersionStr = "10.0.0";
		var xiSwfUrlStr = "/images/playerProductInstall.swf";
		var flashvars = {};
		flashvars.id = '<!--{$user|default:"user"}-->';
		flashvars.role = '<!--{$roleid|default:1}-->';
		flashvars.userid = '<!--{$uid|default:0}-->';
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
	timeoutUid = setInterval("checkCurUser()",3000);
	<!--{/if}-->
	timeoutid = setInterval("checkHoldStatus()",5000);
}
</script>
<!--{include file="include/footer.tpl"}-->