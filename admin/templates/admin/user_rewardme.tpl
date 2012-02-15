<!--{include file=header.tpl}-->
<div style="float:left;">
  <ul class="nav3">
    <li><a href="#" class="btn1"><span>查看<!--{$uinfo.email}-->的录入记录</span></a> 上线为：<!--{if $puinfo}--><!--{$puinfo.username|default:$puinfo.email}--><!--{else}-->无上线<!--{/if}--></li>
	<li><a href="<!--{$pageurl}-->/list.do?status=1" class="btn2"><span>返回会员列表</span></a></li>
  </ul>
</div>
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal">企业</td>
	<td class="tal">职位</td>
	<td class="tal">录入时间</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td><!--{$item.ename}--></td>
    <td><!--{$item.jobname}--></td>
    <td><p><!--{$item.createdate}--></p></td>
  </tr>
  <!--{foreachelse}-->
  <tr>
    <td colspan="3" align="center">暂无任何录入记录</td>
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
</div>
<!--{include file=footer.tpl}-->
