<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/swfobject.js"></script>
<div id="content" class="container_24">
<div id="msindex">
  <h1><span class="floatRight"><!--{$user}--></span>视一视在线视频面试大厅系统-企业端</h1>
  <div id="msleft">
    <div id="msmingdan">
      <h2><span class="floatRight mszd"><img src="<!--{$baseurl}-->/images/msleftzd.jpg" /></span>应聘企业名单</h2>
      <div id="msmingdanmain">
        <ul id="intusers_list">
		  <!--{foreach from=$goin item=item}-->
		  <!--{if $item.vodroom}-->
		  <li> <a href="<!--{$baseurl}-->/jobs/view/<!--{$item.jobid}-->.html"><!--{$item.ename}--></a><span id="hold_<!--{$item.roomid}-->_<!--{$item.room}-->"><!--{if $item.msstatus==1}--><img src="<!--{$baseurl}-->/images/msing.jpg" align="absmiddle" /><!--{elseif $item.msstatus==2}--><img src="<!--{$baseurl}-->/images/msyging.jpg" align="absmiddle" /><!--{elseif $item.msstatus==-1}--><img src="<!--{$baseurl}-->/images/msover.jpg" align="absmiddle" /><!--{else}-->（<!--{$item.roomstatus}-->：<!--{$item.holdnums}-->）<!--{/if}--></span></li>
		  <!--{/if}-->
		  <!--{/foreach}-->
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
  <div id="msright"><div style="margin-left:85px;margin-top:130px;">请等待面试官邀请您进入面试......</br><img src="<!--{$baseurl}-->/images/msdatu.jpg" align="absmiddle"/></div> </div>
</div>
<script type="text/javascript">
var timeoutid = timeoutUid = null;
var curroomid = <!--{$introomid|default:0}-->;
function checkHoldStatus(){
	var span = document.getElementById('intusers_list').getElementsByTagName("span");
	var roomids = '';
	var dunhao = '';
	var rooms = [];
	for(i=0;i<span.length;i++){
		if(span[i].id.indexOf('hold_')>-1){
			var tmp = span[i].id.split('_');
			roomids = roomids + dunhao + tmp[1];
			rooms[tmp[1]] = tmp[2];
			dunhao = ':';
		}
	}
	if(roomids){
		$.ajax({
			type:"POST",
			url:"/member/ajax/getholdnum.do",
			dataType:"html",
			data:'roomids='+roomids,
			success:function(msg)
			{
				if(!msg){
					if(timeoutid!=null)clearTimeout(timeoutid);
				}else{
					msg = msg.split(":");
					if(msg.length>0){
						for(var i=0;i<msg.length;i++){
							var val = msg[i].split("|");
							if(val[1]=='yqing'){
								if(confirm("您已被邀请进入视频面试，是否接受？")){
									curroomid = val[0];
									startIntView(val[0]);
									loadswf(val[0],rooms[val[0]]);
									//clearTimeout(timeoutid);
								}else{
									cancelInt(val[0]);
								}
							}else{
								if(isNaN(val[1])){
									$("#hold_"+val[0]+"_"+rooms[val[0]]).html('<img src="<!--{$baseurl}-->/images/ms'+val[1]+'.jpg" align="absmiddle" />');
								}else{
									$("#hold_"+val[0]+"_"+rooms[val[0]]).html('（'+val[2]+'：'+val[1]+'）');
								}
							}
						}
					}
				}
			}
		});
	}else{
		if(timeoutid!=null)clearTimeout(timeoutid);
	}
}

function startIntView(roomid){
	roomid = roomid>0 ? roomid : curroomid;
	$.ajax({
		type:"POST",
		url:"/member/ajax/startint.do",
		dataType:"html",
		data:'roomid='+roomid,
		success:function(msg)
		{
			timeoutUid = setInterval("checkCurUser()",3000);
			alert("成功启动面试大厅，请点击”开始面试“。");
		}
	});
}

function endIntView(){
	$.ajax({
		type:"POST",
		url:"/member/ajax/endint.do",
		dataType:"html",
		data:'roomid='+curroomid,
		success:function(msg)
		{
			window.location.reload();
		}
	});
}

function cancelInt(roomid){
	if(!roomid)return false;
	$.ajax({
		type:"POST",
		url:"/member/ajax/cancelint.do",
		dataType:"html",
		data:'roomid='+roomid,
		success:function(msg)
		{
			curroomid = 0;
		}
	});
}

function checkCurUser(){
	$.ajax({
		type:"POST",
		url:"/member/ajax/curuser.do",
		dataType:"html",
		data:'roomid='+curroomid,
		success:function(msg)
		{
			if(msg=='over'){
				if(timeoutUid!=null)clearTimeout(timeoutUid);
				alert("当前面试官已结束与您的面试！");
				window.location.reload();
			}
		}
	});
}

function getPlayerName(){
	return '经理';
}

function loadswf(roomid,room){
	if(!roomid||!room){
		alert('参数错误！');
	}
	var isIE = false;
	if (window.ActiveXObject){
		isIE = true;
	}
	if(isIE){
		var musicStr="";
		musicStr+='<object id="radioplayer"  classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="736" height="672" name="interviewonline">';
		musicStr+='<param name="movie" value="/images/interview0507.swf?id=<!--{$user|default:"user"}-->&role=0&userid=<!--{$uid|default:0}-->&roomid='+roomid+'&apurl=rtmp://www.shiyishi.cn:8008/'+room+'" />';
		musicStr+='<param name="allowScriptAccess" value="always" />';
		musicStr+='<param name="quality" value="high" />';
		musicStr+='<embed name="interviewonline" src="/images/interview0507.swf?id=<!--{$user|default:"user"}-->&role=0&userid=<!--{$uid|default:0}-->&roomid='+roomid+'&apurl=rtmp://www.shiyishi.cn:8008/'+room+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" allowScriptAccess="always" width="736" height="672"></embed>';
		musicStr+='</object>';
		document.getElementById("msright").innerHTML=musicStr;
	}else{
		var swfVersionStr = "10.0.0";
		var xiSwfUrlStr = "/images/playerProductInstall.swf";
		var flashvars = {};
		flashvars.id = '<!--{$user|default:"user"}-->';
		flashvars.role = '<!--{$roleid|default:1}-->';
		flashvars.userid = '<!--{$uid|default:0}-->';
		flashvars.roomid = ''+roomid+'';
		flashvars.apurl = 'rtmp://www.shiyishi.cn:8008/'+room+'" />';
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
	<!--{if $introomid>0&&$introom}-->
	loadswf(<!--{$introomid}-->,'<!--{$introom}-->');
	timeoutUid = setInterval("checkCurUser()",3000);
	<!--{/if}-->
	timeoutid = setInterval("checkHoldStatus()",10000);
}
window.onbeforeunload = function(e){
	e = e || event;   // IE 或 FF 的事件对象
	e.returnValue = "确定要关闭浏览器结束面试吗？请点击 确定";
}
</script>
<!--{include file="include/footer.tpl"}-->