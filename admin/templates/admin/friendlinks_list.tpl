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
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>友情链接列表</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加链接</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<select name="status">
<option value="" >状态</option>
<!--{foreach from=$status key=key item=item}-->
<option value="<!--{$key}-->" <!--{if $key==$s.status}-->selected<!--{/if}-->><!--{$item}--></option>
<!--{/foreach}-->
</select>
过期时间:
<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.s_date}-->" name="s_date"/>
~
<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.e_date}-->" name="e_date"/>
<input type="submit" name="search" value="搜索" />
</div>
</form>
<form id="listform" name="listform" action="<!--{$pageurl}-->/order.do" method="post" target="post_main">
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="50">排序</td>
		<td class="tal">链接名称</td>
		<td class="tal">链接地址</td>
		<td class="tal">链接图片</td>
		<td class="tal">有效期</td>
		<td class="tal">状态</td>
		<td class="tal" width="10%" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><input class="input tac" name="displayorder[<!--{$item.id}-->]" value="<!--{$item.displayorder}-->" size="2" type="text"></td>
		<td class="tal"><a href="<!--{$item.linkurl}-->" target="<!--{$item.target}-->" rel="<!--{$item.rel}-->" title="<!--{$item.linkname}-->"><b><!--{$item.linkname}--></b></a></td>
		<td><!--{$item.linkurl}--></td>
		<td><!--{if $item.linkimg}--><img src="<!--{$item.linkimg}-->" border="0" height="30"/><!--{else}-->无<!--{/if}--></td>
		<td><!--{$item.startdate}--> ~ <!--{$item.enddate}--></td>
		<td><span class="green"><!--{$item.status}--></span></td>
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