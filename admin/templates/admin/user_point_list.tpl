<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>会员积分增减记录</span></a></li>
  </ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
    用户名:
    <input name="username" type="text" value="<!--{$s.username}-->" style="width:50px;"/>
	增减日期:
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
	<td class="tal">用户名</td>
    <td class="tal">增加/减少</td>
	<td class="tal">积分</td>
	<td class="tal">日期</td>
	<td class="tal">说明</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
	<td><!--{$item.uid}--></td>
	<td class="tal"><span class="fourm_name"><!--{$item.username}--></span></td>
    <td class="tal"><strong><!--{if $item.doact=='1'}--><font color="green">增加</font><!--{elseif $item.doact=='-1'}--><font color="red">减少</font><!--{else}-->无效<!--{/if}--></strong></td>
    <td class="tal"><!--{$item.points}--></td>
	<td class="tal"><!--{$item.createdate}--></td>
	<td class="tal"><!--{$item.aclog}--></td>
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
</div>
<!--{include file=footer.tpl}-->
