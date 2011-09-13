<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="#" class="btn1"><span>权限管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加权限</span></a></li>
<!--{if $admininfo.admin_zhiwu==1}--><li><a href="<!--{$pageurl}-->/create.do" class="btn2"><span>自动生成权限</span></a></li><!--{/if}-->
</ul>

<form action="<!--{$pageurl}-->/order.do" method="post">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal">[顺序]权限名称</td>
		<td class="tal" width="40%">权限标识</td>
		<td class="tal" width="7%">设置</td>
		<td class="tal" width="7%">删除</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal">
			<input class="input tac" name="orderid[<!--{$item.id}-->]" value="<!--{$item.order_id}-->" size="2" type="text">
			<span class="fourm_name"><!--{$item.prename}--></span>
		</td>
		<td><!--{$item.purview_link|default:"---"|truncate:40}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> |</td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>

<br>
<center><input type="submit" class="btn" value="提 交" /> <input type="reset" class="btn" value="重 置" /></center>
</form>

<!--{include file=footer.tpl}-->