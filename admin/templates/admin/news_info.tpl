<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>新闻管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>修改新闻</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加新闻</span></a></li>
<!--{/if}-->
</ul>
<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>添加/修改新闻</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">类  别:</td>
		<td class="td4">
			<select name="info[catid]" id="catid" alt="类别:无内容">
			<option value="" >请选择类别</option>
			<!--{foreach from=$cats key=key item=item}-->
			<option value="<!--{$key}-->" <!--{if $key==$info.catid}-->selected<!--{/if}-->><!--{$item}--></option>
			<!--{/foreach}-->
			</select><span id="showResult_catid"></span>
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3">标题:</td>
		<td class="td4"><input id="subject" name="info[subject]" type="text" value="<!--{$info.subject}-->" alt="标题:无内容" style="width:300px;"/><span id="showResult_subject"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">关键词:</td>
		<td class="td4"><input id="keywords" name="info[keywords]" type="text" value="<!--{$info.keywords}-->" alt="关键词:无内容" style="width:300px;" /><span id="showResult_keywords"></span>多个关键词用,隔开</td>
	</tr>
	<tr class="tr4">
		<td class="td3">关联演出ID:</td>
		<td class="td4"><input id="itemid" name="info[itemid]" type="text" value="<!--{$info.itemid}-->" style="width:180px;" /><span id="showResult_keywords">多个演出ID请使用英文<font color="red">,</font>隔开</span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">排序数字:</td>
		<td class="td4"><input type="text" class="input" size="3" name="info[order_id]" value="<!--{$info.order_id|default:50}-->" /> <span id="showResult_keywords"></span></td>
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
		<td class="td3">缩略图:</td>
		<td class="td4"><input type="hidden" name="info[thumb]" id="smallimg" value="<!--{$info.thumb}-->" /><!--{$uploadsimplezone}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3"></td>
		<td class="td4"><span id="showResult_uploadsimple">可以上传 GIF,JPG,PNG的图片</span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">新闻内容:</td>
		<td class="td4"><!--{$info.content}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">添加时间:</td>
		<td class="td4"><input type="text" name="info[createdate]" value="<!--{$info.createdate}-->" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
	</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<script language="JavaScript">
onload = function(){fm_ini();}
</script>
<!--{include file=footer.tpl}-->