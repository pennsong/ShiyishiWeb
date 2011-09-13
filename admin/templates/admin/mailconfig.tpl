<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/" class="btn1"><span>本地发送配置</span></a></li>
</ul>
<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="m_type" value="<!--{$mtype}-->" />
<h2>发邮设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<!--{foreach from=$rows item=item}-->
	<tr class="tr4">
		<td class="td3" width="150"><!--{$item.m_key}-->:</td>
		<td class="td4"><input id="<!--{$item.m_key}-->" name="info[<!--{$item.id}-->]" type="text" value="<!--{$item.m_value}-->" style="width:200px;" alt="<!--{$item.m_key}-->:无内容" /><span id="showResult_apiurl"></span></td>
	</tr>
	<!--{/foreach}-->
</table>
<br />
<div style="padding-left:125px;"> <input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->