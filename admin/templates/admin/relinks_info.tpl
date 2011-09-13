<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>推荐企业管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>修改友情链接</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加友情链接</span></a></li>
<!--{/if}-->
</ul>
<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>推荐企业设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
<tr class="tr4">
	<td class="td3" width="145">企业名称：</td>
	<td class="td4" ><input name="info[title]" type="text" id="title" value="<!--{$info.title}-->" alt="企业名称:无内容" style="width:300px;"/><span id="showResult_title"></span></td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">链接地址：</td>
	<td class="td4" ><input name="info[url]" type="text" id="url" value="<!--{$info.url}-->" alt="链接地址:无内容" style="width:300px;"/><span id="showResult_url"></span></td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">图片：</td>
	<td class="td4" >
	<input name="info[img]" id="photo" type="hidden" value="<!--{$info.img}-->" />
	<img id="uploadimg" src="<!--{$info.img}-->" />
	<iframe src="<!--{$pageurl}-->/upload.do" frameborder="no" border="0" marginwidth="0" scrolling="no" width="300" height="30" ></iframe> 大小 192*60 px
	</td>
</tr>
<tr class="tr4">
	<td class="td3" width="145">排序：</td>
	<td class="td4" ><input name="info[orid]" type="text" id="orid" value="<!--{$info.orid|default:'0'}-->" style="width:30px;"/> 限填数字</td>
</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->