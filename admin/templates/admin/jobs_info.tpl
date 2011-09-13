<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>招聘管理</span></a></li>
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<input type="hidden" name="info[createtime]" value="<!--{$info.createtime}-->" />
<h2>添加/修改首页幻灯</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">标题:</td>
		<td class="td4"><input id="subject" name="info[title]" type="text" value="<!--{$info.title}-->" alt="标题:无内容" style="width:300px;"/><span id="showResult_subject"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">职务:</td>
		<td class="td4">
		<select name="info[jid]">
		<option value="">职务</option>
		<!--{foreach from=$job_category item=item}-->
			<option value="<!--{$item.id}-->" <!--{if $info.jid == $item.id}-->selected="selected"<!--{/if}-->><!--{$item.name}--></option>
		<!--{/foreach}-->
		</select>
		</td>
	</tr>

	<tr class="tr4">
		<td class="td3">公司:</td>
		<td class="td4">
			<select name="info[cid]">
			<option value="">公司</option>
			<!--{foreach from=$e_user item=item}-->
				<option value="<!--{$item.id}-->" <!--{if $info.cid == $item.id}-->selected="selected"<!--{/if}-->><!--{$item.company}--></option>
			<!--{/foreach}-->
			</select>	
		</td>
	</tr>

	<tr class="tr4">
		<td class="td3">内容:</td>
		<td class="td4"><!--{$info.content}--></td>
	</tr>

	<tr class="tr4">
		<td class="td3">开始时间:</td>
		<td class="td4"><script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script><input type="tetx" name="info[starttime]" value='<!--{$info.starttime|date_format:"%Y-%m-%d"}-->'  class="Wdate" onClick="WdatePicker()" style="width:120px;"/></td>
	</tr>

	<tr class="tr4">
		<td class="td3">结束时间:</td>
		<td class="td4"><script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script><input type="tetx" name="info[endtime]" value='<!--{$info.endtime|date_format:"%Y-%m-%d"}-->'  class="Wdate" onClick="WdatePicker()" style="width:120px;"/></td>
	</tr>
</table>
<br />
<div style="padding-left:170px;"><input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->