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
                "<!--{$baseurl}-->/images/VPInvite.swf?v="+v, "flashContent", 
                "376", "293", 
                swfVersionStr, xiSwfUrlStr, 
                flashvars, params, attributes);
            // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
            swfobject.createCSS("#flashContent", "display:block;text-align:left;");
        </script>
        <div id="content" class="container_24">
<div id="msindex">
  <h1><span class="floatRight"><!--{$user}--></span>视一视在线视频面试大厅系统-个人端</h1>

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
window.onbeforeunload = function(e){
	e = e || event;   // IE 或 FF 的事件对象
	e.returnValue = "确定要关闭浏览器结束面试吗？请点击 确定";
}
</script>
<!--{include file="include/footer.tpl"}-->