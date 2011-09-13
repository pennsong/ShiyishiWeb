<!--{include file=header.tpl}-->
<div style="float:left;">
  <ul class="nav3">
    <li><a href="#" class="btn1"><span>查看“<!--{$uinfo.email}-->”的银行账户</span></a></li>
	<li><a href="<!--{$pageurl}-->/list.do?status=1" class="btn2"><span>返回会员列表</span></a></li>
  </ul>
</div>
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <th width="16%" height="29"class="tips10">所属银行</th>
    <th width="23%">银行账号</th>
    <th width="10%">姓名</th>
    <th width="37%">开户行</th>
    <th width="14%">状态</th>
  </tr>
  <!--{foreach from=$banks item=item}-->
  <tr class="tr3">
    <td height="31"class="tips10"><!--{$item.bank_name}--></td>
    <td ><!--{$item.card_number}--></td>
    <td ><!--{$item.card_user}--></td>
    <td ><!--{$item.bank_kaihu}--></td>
    <td ><!--{if $item.status==1}--><font color="red">收款账户</font><!--{else}-->无<!--{/if}--></td>
  </tr>
  <!--{foreachelse}-->
  <tr>
    <td colspan="5" align="center">暂无任何收款账户信息</td>
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
</div>
<!--{include file=footer.tpl}-->
