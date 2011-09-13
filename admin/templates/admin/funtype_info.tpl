<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>职位管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>修改职位</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加职位</span></a></li>
<!--{/if}-->
</ul>
<form action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>职位设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="130">选择一级分类:</td>
		<td class="td4">
			<select name="info[parent_id]">
				<option value="0">设为一级分类</option>
				<!--{foreach from=$funtypes item=funtype}-->
				<option value="<!--{$funtype.id}-->"<!--{if $funtype.id == $info.parent_id}--> selected<!--{/if}-->><!--{$funtype.thename}--></option>
				<!--{/foreach}-->
			</select>
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="130">名称:</td>
		<td class="td4"><input type="text" id="thename" class="input" name="info[thename]" value="<!--{$info.thename}-->" alt="职位名称:4-50/无内容/有全角/有空格"/>
		<span id="showResult_thename"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="130">英文:</td>
		<td class="td4"><input type="text" id="enname" class="input" name="info[enname]" value="<!--{$info.enname}-->" alt="英文:4-50/无内容/有全角/有空格"/>
		<span id="showResult_enname"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">显示顺序:</td>
		<td class="td4"><input type="text" id="order_id" class="input" name="info[order_id]" value="<!--{$info.order_id|default:0}-->" alt="显示顺序:0-6/数字/无内容"/>
		<span id="showResult_order_id"></span></td>
	</tr>
</table>
<br />
<div style="padding-left:155px;"> <input type="submit" value="提 交" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->