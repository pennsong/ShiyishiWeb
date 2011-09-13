<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>权限管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>权限设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加权限</span></a></li>
<!--{/if}-->
</ul>

<form action="<!--{$pageurl}-->/save.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>权限资料设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td colspan="2" class="td1">上级权限:</td>
	</tr>
	<tr class="tr4">
		<td class="td2">
			<select name="info[parent_id]">
			<option value="0">顶级权限</option>
			<!--{foreach from=$purviews item=purview}-->
			<option value="<!--{$purview.id}-->" <!--{if $purview.id==$info.parent_id}-->selected<!--{/if}-->><!--{$purview.prename}--></option>
			<!--{/foreach}-->
			</select>
		</td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">权限名称:</td>
	</tr>
	<tr class="tr4">
		<td class="td2"><input type="text" class="input" name="info[purview_name]" value="<!--{$info.purview_name}-->"/></td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">显示顺序:</td>
	</tr>
	<tr class="tr4">
		<td><input type="text" class="input" size="3" name="info[order_id]" value="<!--{$info.order_id|default:50}-->" /></td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">权限标识:</td>
	</tr>
	<tr class="tr4">
		<td><input type="text" class="input" name="info[purview_link]" value="<!--{$info.purview_link}-->" /></td>
		<td class="tips2"></td>
	</tr>
</table>
<br />
<div><input type="submit" value="提交" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->