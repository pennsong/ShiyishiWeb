<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>网银管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>网银设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加网银</span></a></li>
<!--{/if}-->
</ul>

<form action="<!--{$pageurl}-->/save.do" method="post">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>网银资料设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td colspan="2" class="td1">类别:</td>
	</tr>
	<tr class="tr4">
		<td class="td2">
			<select name="info[paytype]">
			<option value="99bill" <!--{if '99bill'==$info.paytype}-->selected<!--{/if}-->>快  钱</option>
			<option value="yeepay" <!--{if 'yeepay'==$info.paytype}-->selected<!--{/if}-->>易付通</option>
			</select>
		</td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">网银名称:</td>
	</tr>
	<tr class="tr4">
		<td class="td2"><input type="text" class="input" name="info[bankname]" value="<!--{$info.bankname}-->"/></td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">网银标识:</td>
	</tr>
	<tr class="tr4">
		<td><input type="text" class="input" name="info[bankid]" value="<!--{$info.bankid}-->" /></td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">图标:</td>
	</tr>
	<tr class="tr4">
		<td><input type="text" class="input" name="info[banklogo]" value="<!--{$info.banklogo}-->" /><!--{if $info.banklogo}--><img alt="<!--{$item.bankname}-->" src="http://www.mynewlearn.com/images/bank/<!--{$info.banklogo}-->"/><!--{/if}--></td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">状态:</td>
	</tr>
	<tr class="tr4">
		<td><input name='info[status]' type='radio' value="show" 
        <!--{if $info.status=='show'}-->
        checked="checked"
        <!--{/if}-->
        />显示 <input name='info[status]' type='radio' value="hide" 
        <!--{if $info.status=='hide'}-->
        checked="checked"
        <!--{/if}-->
        />隐藏</td>
		<td class="tips2"></td>
	</tr>
	<tr>
		<td colspan="2" class="td1">显示顺序:</td>
	</tr>
	<tr class="tr4">
		<td><input type="text" class="input" size="3" name="info[displayorder]" value="<!--{$info.displayorder|default:50}-->" /></td>
		<td class="tips2"></td>
	</tr>
	
</table>
<br />
<div><input type="submit" value="提交" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->