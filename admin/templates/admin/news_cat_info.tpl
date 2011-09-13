<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>新闻类别管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>新闻类别设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加新闻类别</span></a></li>
<!--{/if}-->
</ul>

<form action="<!--{$pageurl}-->/save.do" method="post">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>新闻类别资料设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td colspan="2" class="td1">上级新闻类别:</td>
	</tr>
	<tr class="tr4">
		<td class="td2">
			<select name="info[parent_id]">
			<option value="0">顶级新闻类别</option>
			<!--{foreach from=$cats item=cat}-->
			<option value="<!--{$cat.id}-->" <!--{if $cat.id==$info.parent_id}-->selected<!--{/if}-->><!--{$cat.prename}--></option>
			<!--{/foreach}-->
			</select>
		</td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">新闻类别名称:</td>
	</tr>
	<tr class="tr4">
		<td class="td2"><input type="text" class="input" name="info[name]" value="<!--{$info.name}-->"/></td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">显示顺序:</td>
	</tr>
	<tr class="tr4">
		<td><input type="text" class="input" size="3" name="info[order_id]" value="<!--{$info.order_id|default:50}-->" /></td>
		<td class="tips2"></td>
	</tr>
</table>
<br />
<div><input type="submit" value="提交" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->