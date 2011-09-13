<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>友情链接管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>修改友情链接</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加友情链接</span></a></li>
<!--{/if}-->
</ul>
<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>友情链接设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
<tr class="tr4">
	<td class="td3" width="145">链接名称：</td>
	<td class="td4" ><input name="info[linkname]" type="text" id="linkname" value="<!--{$info.linkname}-->" alt="链接名称:无内容" style="width:300px;"/><span id="showResult_linkname"></span></td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">链接地址：</td>
	<td class="td4" ><input name="info[linkurl]" type="text" id="linkurl" value="<!--{$info.linkurl}-->" alt="链接地址:无内容" style="width:300px;"/><span id="showResult_linkurl"></span></td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">链接图片：</td>
	<td class="td4" ><input name="info[linkimg]" type="text" value="<!--{$info.linkimg}-->" style="width:300px;"/> 留空则为文字链接</td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">窗口模式：</td>
	<td class="td4" ><input name="info[target]" type="radio" value="_blank" <!--{if $info.target!='_self'}-->checked<!--{/if}-->/>新窗口 <input name="info[target]" type="radio" value="_self" <!--{if $info.target=='_self'}-->checked<!--{/if}--> />本窗口 </td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">REL模式：</td>
	<td class="td4" ><input name="info[rel]" type="radio" value="nofollow" <!--{if $info.rel!='follow'}-->checked<!--{/if}-->/>NoFollow <input name="info[rel]" type="radio" value="_self" <!--{if $info.rel=='follow'}-->checked<!--{/if}--> />Follow </td>
</tr>
<tr class="tr4">
	<td class="td3">有效期：</td>
	<td class="td4"><input type="tetx" name="info[startdate]" value="<!--{$info.startdate}-->" class="Wdate" onClick="WdatePicker()" style="width:120px;" />&nbsp;-&nbsp;<input type="tetx" name="info[enddate]" value="<!--{$info.enddate}-->"  class="Wdate" onClick="WdatePicker()" style="width:120px;"/>&nbsp;格式：2008-10-11，留空为长期有效。</td>
</tr>
<tr class="tr4">
	<td class="td3">状态：</td>
	<td class="td4"><input name="info[status]" type="radio" value="1" <!--{if $info.status!='0'}-->checked<!--{/if}-->/>有效 <input name="info[status]" type="radio" value="0" <!--{if $info.status=='0'}-->checked<!--{/if}--> />无效</td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">排序：</td>
	<td class="td4" ><input name="info[displayorder]" type="text" id="displayorder" value="<!--{$info.displayorder|default:'0'}-->" style="width:30px;"/> 限填数字</td>
</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->