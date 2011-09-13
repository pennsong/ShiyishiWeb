<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>邮件模板管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加邮件模板</span></a></li>
</ul>
</div>
<div style="clear:both;">
<!--{include file=page.tpl}-->
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal">名称标识</td>
		<td class="tal" width="20%">邮件标题</td>
		<td class="tal" width="10%">状态</td>
		<td class="tal" width="15%">添加时间</td>
		<td class="tal" width="10%" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><span class="fourm_name"><!--{$item.name}--></span></td>
		<td class="tal"><!--{$item.mailsubject}--></td>
		<td><!--{$item.status}--></td>
		<td><!--{$item.createdate}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&page=<!--{$page}-->">编辑</a> |  <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
<br>
<!--{include file=footer.tpl}-->