<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span><!--{$ename|default:'企业'}-->录用人员列表</span></a></li>
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
	<td class="tal">身份证</td>
	<td class="tal">录用时间</td>
	<td class="tal">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
	<td><!--{$item.uid}--></td>
	<td class="tal"><span class="fourm_name"><!--{$item.email}--></span></td>
    <td class="tal"><!--{$item.usercard}--></td>
	<td class="tal"><!--{$item.createdate}--></td>
	<td class="tal"><!--{if $item.status==1}--><a class="fourm-two" href="<!--{$pageurl}-->/enroll.do?opt=cancel&id=<!--{$item.id}-->" onclick="return confirm('确定驳回该人员录用吗？')" target="post_main">驳回</a><!--{else}-->已驳回<!--{/if}--></td>
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
