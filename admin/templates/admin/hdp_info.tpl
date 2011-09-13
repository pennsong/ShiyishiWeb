<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>首页幻灯管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>修改首页幻灯</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加首页幻灯</span></a></li>
<!--{/if}-->
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>添加/修改首页幻灯</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">主题:</td>
		<td class="td4"><input id="subject" name="info[title]" type="text" value="<!--{$info.title}-->" alt="主题:无内容" style="width:300px;"/><span id="showResult_subject"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">链接:</td>
		<td class="td4"><input id="urllink" name="info[urllink]" type="text" value="<!--{$info.urllink}-->" alt="链接:无内容" style="width:300px;"/><span id="showResult_urllink"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">排序数字:</td>
		<td class="td4"><input type="text" class="input" size="3" name="info[order_id]" value="<!--{$info.order_id|default:0}-->" /><span id="showResult_keywords"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">过期时间:</td>
		<td class="td4"><script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script><input type="tetx" name="info[expiredtime]" value="<!--{$info.expiredtime}-->"  class="Wdate" onClick="WdatePicker()" style="width:120px;"/></td>
	</tr>
	<tr class="tr4">
		<td class="td3">所属城市:</td>
		<td class="td4" id="citybox">
		<!--{foreach from=$citys key=key item=item}-->
		<input name="info[cityids][]" type="checkbox" value="<!--{$item.id}-->" <!--{$item.checked}--> /><!--{$item.name}-->
		<!--{/foreach}-->
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3">描述:</td>
		<td class="td4"><textarea name="info[description]" cols="65" rows="3"><!--{$info.description}--></textarea></td>
	</tr>
	<tr class="tr4">
		<td class="td3">轮循图:</td>
		<td class="td4"><input type="hidden" name="info[piclink]" id="smallimg" value="<!--{$info.piclink}-->" /><!--{$uploadsimplezone}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3"></td>
		<td class="td4"><span id="showResult_uploadsimple">可以上传 GIF,JPG,PNG的图片；为了保证页面的美观性 请上传尺寸为：650px * 250px 的图片</span></td>
	</tr>
</table>
<br />
<div style="padding-left:170px;"><input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->