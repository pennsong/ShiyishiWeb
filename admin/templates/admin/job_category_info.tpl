<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>职务管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>分类设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加分类</span></a></li>
<!--{/if}-->
</ul>
<form action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<input type="hidden" name="info[rid]" value="<!--{if $cats.rid==0}--><!--{$cats.id|default:0}--><!--{else}--><!--{$cats.rid|default:0}--><!--{/if}-->" />
<input type="hidden" name="info[pid]" value="<!--{$cats.id|default:0}-->" />
<input type="hidden" name="info[level]" value="<!--{$cats.level+1}-->" />
<h2>分类设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">上级职务:</td>
		<td class="td4"><!--{$cats.name|default:"无"}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3">职务名称:</td>
		<td class="td4"><input type="text" id="name" class="input" name="info[name]" value="<!--{$info.name}-->" alt="职务名称:4-50/无内容/有全角/有空格"/>
		<span id="showResult_name"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">显示顺序:</td>
		<td class="td4"><input type="text" id="orid" class="input" name="info[orid]" value="<!--{$info.orid|default:50}-->" alt="显示顺序:0-6/数字/无内容"/>
		<span id="showResult_orid"></span></td>
	</tr>
</table>
<br />
<div style="padding-left:75px;"> <input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提 交" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->