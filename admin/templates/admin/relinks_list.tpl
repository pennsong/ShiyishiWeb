<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script language="JavaScript">
var turl = window.location.href;
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="post">
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>推荐企业列表</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加企业</span></a></li>
</ul>
</div>
</form>
<form id="listform" name="listform" action="<!--{$pageurl}-->/order.do" method="post" target="post_main">
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="50">排序</td>
		<td class="tal">名称</td>
		<td class="tal">公司id</td>
		<td class="tal">图片</td>
		<td class="tal" width="10%" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><input class="input tac" name="orid[<!--{$item.id}-->]" value="<!--{$item.orid}-->" size="2" type="text"></td>
		<td><!--{if $item.title}--><!--{$item.title}--><!--{else}-->无<!--{/if}--></td>
		<td><!--{$item.id}--></td>
		<td><!--{if $item.logo}--><img src="<!--{$item.logo}-->" border="0" height="60" width="192" /><!--{else}-->无<!--{/if}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> | <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')" target="post_main">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
<br>
<center><input type="submit" class="btn" value="提 交" /> <input type="reset" class="btn" value="重 置" /></center>
</form>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->