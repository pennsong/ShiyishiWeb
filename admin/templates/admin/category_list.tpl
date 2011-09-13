<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>分类管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加分类</span></a></li>
</ul>

<form action="<!--{$pageurl}-->/order.do" method="post">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="5%">[顺序]</td>
		<td class="tal" width="15%">分类名称</td>
		<td class="tal" width="15%">英文名称</td>
		<td class="tal">所属城市</td>
		<td class="tal" width="10%" style="padding-left:20px;">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3" id="tr_<!--{$item.id}-->">
		<td class="tal" style="text-align:center"><input class="input tac" name="orderid[<!--{$item.id}-->]" value="<!--{$item.order_id}-->" size="2" type="text"></td>
		<td><span class="fourm_name"><!--{$item.prename}--></span> <!--{if $item.is_hot==1}--><font color="red">热</font><!--{/if}--></td>
		<td><!--{$item.cat_en}--></td>
		<td><!--{$item.citys}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> | <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<br>
<center><input type="submit" class="btn" value="提 交" /> <input type="reset" class="btn" value="重 置" /></center>
</form>
<!--{include file=footer.tpl}-->