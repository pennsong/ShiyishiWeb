<!--{include file=header.tpl}-->
<div style="float:left;">
  <ul class="nav3">
    <li><a href="#" class="btn1"><span>查看“<!--{$uinfo.email}-->”的推广奖励</span></a> 总奖励为：<!--{$allmoney/10}-->元</li>
	<li><a href="<!--{$pageurl}-->/list.do?status=1" class="btn2"><span>返回会员列表</span></a></li>
  </ul>
</div>
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal">行为</td>
	<td class="tal">描述</td>
	<td class="tal">时间</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td><!--{if $item.doact>0}-->+<!--{else}-->-<!--{/if}--> &yen;<!--{$item.money}-->积分</td>
    <td><!--{$item.aclog|replace:'您的':'他的'}--></td>
    <td><p><!--{$item.createdate}--></p></td>
  </tr>
  <!--{foreachelse}-->
  <tr>
    <td colspan="3" align="center">暂无任何奖励记录</td>
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
</div>
<!--{include file=footer.tpl}-->
