<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>帮助管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>修改帮助</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加帮助</span></a></li>
<!--{/if}-->
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>添加/修改帮助</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">类  别:</td>
		<td class="td4">
			<select name="info[catid]" id="catid" alt="类别:无内容">
			<option value="" >请选择类别</option>
			<!--{foreach from=$cats item=item}-->
			<option value="<!--{$item.id}-->" <!--{if $item.id==$info.catid}-->selected<!--{/if}-->><!--{$item.prename}--></option>
			<!--{/foreach}-->
			</select><span id="showResult_catid"></span>
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3">标题:</td>
		<td class="td4"><input id="subject" name="info[subject]" type="text" value="<!--{$info.subject}-->" alt="标题:无内容" style="width:300px;"/><span id="showResult_subject"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">排序数字:</td>
		<td class="td4"><input type="text" class="input" size="3" name="info[order_id]" value="<!--{$info.order_id|default:50}-->" /><span id="showResult_keywords"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">帮助内容:</td>
		<td class="td4"><!--{$info.content}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">添加时间:</td>
		<td class="td4"><input type="text" value="<!--{$info.createdate}-->" disabled="disabled"/></td>
	</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->