<!--{include file=header.tpl}-->
<div style="float:left;margin:10px;width:92%">
<li>本地调用:<br/><input type="input" style="width:98%" onmouseover="selectall(this);" value="<!--{$textlink}-->" /></li>
<!--li>JS调用:<br/><textarea style="width:98%;height:30px;font:12px Courier New;" onmouseover="selectall(this);"><script type="text/javascript" src="http://www.piaochong.com/js.do?callid=<!--{$adid}-->"></script></textarea></li-->
</div>
<script type="text/javascript"> 
function selectall(obj) {
    obj.focus();
    obj.select();
}
</script>