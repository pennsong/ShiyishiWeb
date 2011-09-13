<!--{include file=header.tpl}-->
<script type="text/javascript">
 function VideoPlayer(u,p,w,h,a){
	document.write('<object id="player" name="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+w+'" height="'+h+'"><param name="movie" value="<!--{$baseurl|replace:"admin":"www"}-->/images/player.swf" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="file='+u+'&image='+p+a+'" /><embed type="application/x-shockwave-flash" id="player2" name="player2" src="<!--{$baseurl|replace:"admin":"www"}-->/images/player.swf" width="'+w+'" height="'+h+'" allowscriptaccess="always" allowfullscreen="true" flashvars="file='+u+'&image='+p+a+'" /></object>');
}
</script>
<div style="float:left;padding:0px;margin:0px;">
<script type="text/javascript">VideoPlayer("<!--{$imgsurl}-->/<!--{$info.vodurl}-->","<!--{$baseurl|replace:'admin':'www'}-->/<!--{$info.vodimg}-->","450","362","&autostart=false");</script>
</div>