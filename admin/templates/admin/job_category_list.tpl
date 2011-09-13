<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加顶级职务</span></a></li>
</ul>

<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="15%">ID</td>
		<td class="tal" width="15%">父级ID</td>
		<td class="tal" width="15%">职务名称</td>
		<td class="tal" width="20%" style="padding-left:20px;">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3" id="tr_<!--{$item.id}-->">
		<td><!--{$item.id}--></td>
		<td><!--{$item.pid}--></td>
		<td><!--{$item.name}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/add.do?id=<!--{$item.id}-->">下级职务</a> | <a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> | <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=footer.tpl}-->