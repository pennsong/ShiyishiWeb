<!--{include file=header.tpl}-->
<div style="float:left;">
  <ul class="nav3">
    <li><a href="#" class="btn1"><span>会员推广奖励已发放汇总列表</span></a></li>
  </ul>
</div>
<table cellspacing="0" cellpadding="0" width="100%" id="">
  <tr class="tr3 s3">
	<td class="tal">总金额</td>
	<td class="tal"><!--{$totalRow[0].totalMoney}--></td>
	<td class="tal">总人次</td>
	<td class="tal"><!--{$totalRow[0].totalTime}--></td>
  </tr>
</table>
<hr>
<table cellspacing="0" cellpadding="0" width="100%" id="">
  <tr class="tr3 s3">
	<th class="tal">日期</th>
	<th class="tal">金额</th>
	<th class="tal">发放人次</th>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr>
  	<td class="tal"><a href="<!--{$pageurl}-->/list.do?statusFilter=3&s_date=<!--{$item.dateOnly}-->&e_date=<!--{$item.dateOnly}-->"><!--{$item.dateOnly}--></a></td>
	<td class="tal"><!--{$item.dayMoney}--></td>
	<td class="tal"><!--{$item.times}--></td>	
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=footer.tpl}-->
