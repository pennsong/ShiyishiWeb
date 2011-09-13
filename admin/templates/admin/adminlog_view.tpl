<!--{include file=header.tpl}-->
<h2>日志详细信息</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="70">操作管理员:</td>
		<td class="td4">姓名：<!--{$item.adminname}-->；ID：<!--{$item.adminid}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3">管理员IP:</td>
		<td class="td4"><!--{$item.onlineip}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3">操作URL:</td>
		<td class="td4"><!--{$item.logurl}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3">时间:</td>
		<td class="td4"><!--{$item.createtime}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3">具体操作:</td>
		<td class="td4"><!--{$item.dothing}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3">详细数据流:</td>
		<td class="td4"><div style="width:370px;height:120px;overflow:auto;text-align:left;"><pre><!--{$item.requestvar}--></pre></div></td>
	</tr>
</table>
</body>
</html>