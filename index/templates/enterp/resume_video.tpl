<!--{include file="include/header.tpl"}-->
<script>
 function VideoPlayer(u,p,w,h,a){
	document.write('<object id="player" name="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+w+'" height="'+h+'"><param name="movie" value="/images/player.swf" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="file='+u+'&image='+p+a+'" /><embed type="application/x-shockwave-flash" id="player2" name="player2" src="/images/player.swf" width="'+w+'" height="'+h+'" allowscriptaccess="always" allowfullscreen="true" flashvars="file='+u+'&image='+p+a+'" /></object>');
}
</script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 视频简历</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                          <div id="hrzhiweilist">
							<h2>视频简历</h2>
							<div class="clearfix"></div>                    
							<div id="fengge" style="text-align: center;">
									<script type="text/javascript">VideoPlayer("<!--{$img_domain}--><!--{$video.vodurl}-->","<!--{$img_domain}--><!--{$video.vodimg}-->","640","480","&autostart=false");</script>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
        	</div>
<!--{include file="include/footer.tpl"}-->