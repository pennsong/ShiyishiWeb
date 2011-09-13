<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="#" class="btn1"><span>菜单管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加菜单</span></a></li>
</ul>

<form action="<!--{$pageurl}-->/order.do" method="post">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal">[顺序]菜单名称</td>
		<td class="tal" width="25%">链接地址</td>
		<td class="tal" width="7%">设置</td>
		<td class="tal" width="7%">删除</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal">
			<input class="input tac" name="orderid[<!--{$item.id}-->]" value="<!--{$item.order_id}-->" size="2" type="text">
			<span class="fourm_name"><!--{$item.prename}--></span>
		</td>
		<td><!--{$item.menu_link|default:"---"}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>

<br>
<center><input type="submit" class="btn" value="提 交" /> <input type="reset" class="btn" value="重 置" /></center>
</form>

<!--{include file=footer.tpl}-->