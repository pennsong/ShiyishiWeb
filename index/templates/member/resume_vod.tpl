<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<script type="text/javascript">
 function VideoPlayer(u,p,w,h,a){
	document.write('<object id="player" name="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+w+'" height="'+h+'"><param name="movie" value="<!--{$baseurl|replace:"admin":"www"}-->/images/player.swf" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="file='+u+'&image='+p+a+'" /><embed type="application/x-shockwave-flash" id="player2" name="player2" src="<!--{$baseurl|replace:"admin":"www"}-->/images/player.swf" width="'+w+'" height="'+h+'" allowscriptaccess="always" allowfullscreen="true" flashvars="file='+u+'&image='+p+a+'" /></object>');
}
</script>
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <div id="grr"><a href="#">在线录制视频</a> <a href="<!--{$baseurl}-->/images/视频简历问题提示.xls">录制简历提示问题</a></div>
        <h2>视频简历</h2>
		<form id="addVodResume" name="addVodResume" class="cmxform" method="post" enctype="multipart/form-data" action="<!--{$baseurl}-->/member/do/addvod.do">
        <!--{if $info}-->
		<input type="hidden" value="<!--{$info.id}-->" name="id"/>
        <div id="gloginrightmain">
          <ul>
            <li><span class="glogintext">预览简历：</span>
              <script type="text/javascript">VideoPlayer("<!--{$imgsurl}-->/<!--{$info.vodurl}-->","<!--{$baseurl}-->/<!--{$info.vodimg}-->","300","249","&autostart=false");</script>
            </li>
            <li><span class="glogintext">更新视频：</span>
              <input class="file" name="vodurl" type="file"/>
            </li>
            <li class="red"><span class="glogintext">&nbsp;</span>提示：个人用户只能有一份视频简历，您更新的视频简历将覆盖原有的视频简历</li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <ul>
            <li><span class="glogintext">&nbsp;</span><input type="image" src="<!--{$baseurl}-->/images/shangchuan.gif" style="cursor:pointer;" onclick="return checkUpvod();"/></li>
          </ul>
        </div>
        <!--{else}-->
        <div id="gloginrightmain">
          <h3>上传视频简历</h3>
          <ul>
            <li><span class="glogintext">视频简历：</span>
              <input class="file" name="vodurl" id="vodurl" type="file" alt="视频简历:空"/> 
              <span id="showResult_vodurl"></span>
            </li>
            <li><span class="glogintext">&nbsp;</span>视频文件必须是FLV格式，大小不能超过10M</li>
            <li><span class="glogintext">&nbsp;</span><input type="image" src="<!--{$baseurl}-->/images/shangchuan.gif" style="cursor:pointer;" onclick="return checkUpvod()"/></li>
            <li>&nbsp;</li>
            <li><span class="glogintext">提示：</span> <img src="<!--{$baseurl}-->/images/Icon1.gif" /> 您可以通过本站提供的<a href="#">在线录制视频</a>工具来完成视频简历</li>
            <div class="clearfix"></div>
            <li><span class="glogintext">&nbsp;</span> <img src="<!--{$baseurl}-->/images/Icon1.gif" /> 建议您用DV等更高级的摄像设备录制、编辑您的视频简历，精美的视频简历能大幅提高您的个人形象、吸引招聘单位的关注、更多地获取面试机会，从而大大提高您的应聘效率、获取满意的工作。</li>
            <li><span class="glogintext red">隐私保护：</span> <img src="<!--{$baseurl}-->/images/Icon1.gif" /> 您的视频简历，本站采用专业安保公司设计密钥，仅限本站工作人员及本站会员招聘单位使用，保证您的隐私安全。</li>
          </ul>
        </div>
        <!--{/if}-->
        </form>
        <div class="topmargin10px"></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<script>
function checkUpvod(){
	if(fm_chk(oo('addVodResume'))){
		$.box.show(null, '<div style="width:90%;line-height:25px;text-align:center;color:blue;font-weight:bold;margin:30px auto;">视频简历上传中...请稍后！这期间请不要刷新，不要关闭浏览器。</div>', 280, 120,2);
		return true;
	}else{
		return false;
	}
}
//禁止用F5键
document.onkeydown = function(e){
	if(!e) e = window.event;//火狐中是 window.event
	if((e.keyCode || e.which) == 116){
		event.keyCode = 0;
		event.cancelBubble = true;
		return false;
	}
}
</script>
<!--{include file="include/footer.tpl"}-->