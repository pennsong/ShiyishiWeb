<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>会员推广奖励申领记录</span></a></li>
	<li><a href="<!--{$pageurl}-->/excel.do" class="btn2"><span>导出银行账号及金额</span></a></li>
  </ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
    UID:
    <input name="uid" type="text" value="<!--{$s.uid}-->" style="width:50px;"/>
	日期:
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.s_date}-->" name="s_date"/>
	~
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.e_date}-->" name="e_date"/>
	<input type="submit" name="search" value="搜索" />
</div>
</form>
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
	<td class="tal">用户ID</td>
	<td class="tal">EMAIL</td>
	<td class="tal">申领金额</td>
	<td class="tal">申领时间</td>
	<td class="tal">推广数据</td>
	<td class="tal">银行账号</td>
	<td class="tal">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
	<td><!--{$item.uid}--></td>
	<td class="tal"><span class="fourm_name"><!--{$item.email}--></span></td>
    <td class="tal">&yen;<!--{$item.money/10}--> 元</td>
	<td class="tal"><!--{$item.createdate}--></td>
	<td class="tal"><a class="fourm-two" href="<!--{$baseurl}-->/admin/user/record.do?uid=<!--{$item.uid}-->" title="查看朋友">朋友</a> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/user/reward.do?uid=<!--{$item.uid}-->" title="查看奖励">奖励</a></td>
	<td class="tal"><a class="fourm-two" href="<!--{$baseurl}-->/admin/user/bank.do?uid=<!--{$item.uid}-->" title="查看银行账号">银行账号</a></td>
	<td class="tal">
	<!--{if $item.status==1}-->
		<a class="fourm-two" href="<!--{$pageurl}-->/check.do?status=2&id=<!--{$item.id}-->" onclick="return confirm('确定已经向用户发放了该笔款项？')" target="post_main">已发放</a> 
		| 
		<a class="fourm-two" href="<!--{$pageurl}-->/check.do?status=0&id=<!--{$item.id}-->" target="post_main">驳回</a>
	<!--{elseif $item.status==2}-->
		已发放
	<!--{else}-->
		已驳回
	<!--{/if}-->
	</td>
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
</div>
<script language="JavaScript">
var turl = window.location.href;
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
