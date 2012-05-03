<!--{include file="include/header.tpl"}-->
        <style type="text/css" media="screen"> 
            html, body  { height:100%; }
            body { margin:0; padding:0; overflow:auto; text-align:center; 
                   background-color: #ffffff; }   
            object:focus { outline:none; }
            #flashContent { display:none; }
        </style>
        
        <!-- Enable Browser History by replacing useBrowserHistory tokens with two hyphens -->
        <!-- BEGIN Browser History required section -->
        <link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/history/history.css" />
        <script type="text/javascript" src="<!--{$baseurl}-->/history/history.js"></script>
        <!-- END Browser History required section -->  
            
        <script type="text/javascript" src="<!--{$baseurl}-->/history/swfobject.js"></script>
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
        <div id="flashContent">
            <p>
                To view this page ensure that Adobe Flash Player version 
                10.2.0 or greater is installed. 
            </p>
            <script type="text/javascript"> 
                var pageHost = ((document.location.protocol == "https:") ? "https://" : "http://"); 
                document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='" 
                                + pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" ); 
            </script> 
        </div>
        
        <noscript>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="520" height="630" id="TL">
                <param name="movie" value="TL.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="TL.swf" width="520" height="630">
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="allowFullScreen" value="true" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                    <p> 
                        Either scripts and active content are not permitted to run or Adobe Flash Player version
                        10.2.0 or greater is not installed.
                    </p>
                <!--<![endif]-->
                    <a href="http://www.adobe.com/go/getflashplayer">
                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
        </noscript>  </div>
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
    // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
    var swfVersionStr = "10.2.0";
    // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
    var xiSwfUrlStr = "playerProductInstall.swf";
    var flashvars = {};
    flashvars.username='manager';
    flashvars.talent='talent';
    var params = {};
    params.quality = "high";
    params.bgcolor = "#ffffff";
    params.allowscriptaccess = "sameDomain";
    params.allowfullscreen = "true";
    var attributes = {};
    attributes.id = "VP";
    attributes.name = "VP";
    attributes.align = "middle";
    swfobject.embedSWF(
        "<!--{$baseurl}-->/images/TL.swf", "flashContent", 
        "520", "630", 
        swfVersionStr, xiSwfUrlStr, 
        flashvars, params, attributes);
    // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
    swfobject.createCSS("#flashContent", "display:block;text-align:left;");
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