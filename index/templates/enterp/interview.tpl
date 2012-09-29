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
        <script type="text/javascript">
            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = "10.2.0";
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = "playerProductInstall.swf";
            var flashvars = {};
            flashvars.userId = <!--{$uid2}-->;
            flashvars.userRole = 'company';
            flashvars.userName = '<!--{$roominfo.ename}-->';
            flashvars.version = new Date();
            var v = new Date();
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
                "<!--{$baseurl}-->/images/VP2.swf?v="+v, "flashContent", 
                "820", "572", 
                swfVersionStr, xiSwfUrlStr, 
                flashvars, params, attributes);
            // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
            swfobject.createCSS("#flashContent", "display:block;text-align:left;");
        </script>
 
<div id="content" class="container_24">
<div id="msindex">
  <h1><span class="floatRight"><!--{$roominfo.ename}--></span>视一视在线视频面试大厅系统-企业端</h1>

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
        
		<noscript>Your browser does not support JavaScript!</noscript>
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
        "<!--{$baseurl}-->/images/VP.swf", "flashContent", 
        "520", "630", 
        swfVersionStr, xiSwfUrlStr, 
        flashvars, params, attributes);
    // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
    swfobject.createCSS("#flashContent", "display:block;text-align:left;");
}

window.onload = function(){
//	checkHoldStatus();
//	alert('dd'+<!--{$intnum}-->);
//	<!--{if $intnum>0}-->

//	loadswf();
//	timeoutUid = setInterval("checkCurUser()",3000);
//	<!--{/if}-->
//	timeoutid = setInterval("checkHoldStatus()",5000);
}
</script>
<!--{include file="include/footer.tpl"}-->