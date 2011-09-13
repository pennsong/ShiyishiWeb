<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="#" class="btn1"><span>职务组管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加职务组</span></a></li>
</ul>

<form action="<!--{$pageurl}-->/order.do" method="post">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="5%">[顺序]</td>
		<td class="tal" width="15%">职务组名称</td>
		<td class="tal">标识名</td>
		<!--td class="tal" width="8%">权限设置</td-->
		<td class="tal" width="10%" style="padding-left:30px">操 作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><input class="input tac" name="orderid[<!--{$item.id}-->]" value="<!--{$item.order_id}-->" size="2" type="text"></td>
		<td class="tal"><span class="fourm_name"><!--{$item.prename}--></span></td>
		<td><!--{$item.duty_link|default:"---"}--></td>
		<!--td><a class="fourm-two" href="<!--{$pageurl}-->/purview.do?id=<!--{$item.id}-->"><span class="edit" title="权限设置"></span></a></td-->
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> | <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>

<br>
<center><input type="submit" class="btn" value="提 交" /> <input type="reset" class="btn" value="重 置" /></center>
</form>

<!--{include file=footer.tpl}-->