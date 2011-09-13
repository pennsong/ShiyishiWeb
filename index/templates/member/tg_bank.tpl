<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <div id="gcrnav">
          <ul>
            <li><a href="<!--{$baseurl}-->/member/tg/addbank.html">添加银行账户</a></li>
          </ul>
        </div>
        <h2>我的银行账户</h2>
        <ul>
          <li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> 说明：收款的账号以您最后一次添加的为准。</li>
        </ul>
        <table width="100%" cellspacing="1" cellpadding="0" id="ftable">
          <tr>
            <th width="16%" height="29"class="tips10">所属银行</th>
            <th width="23%">银行账号</th>
            <th width="10%">姓名</th>
            <th width="37%">开户行</th>
            <th width="14%">状态</th>
          </tr>
		  <!--{foreach from=$banks item=item}-->
          <tr>
            <td height="31"class="tips10"><!--{$item.bank_name}--></td>
            <td ><strong class="mian_strong"><!--{$item.card_number}--></strong></td>
            <td ><span class="mian_span"><!--{$item.card_user}--></span></td>
            <td ><!--{$item.bank_kaihu}--></td>
            <td ><!--{if $item.status==1}--><span class="mian_span">收款账户</span><!--{else}-->无<!--{/if}--></td>
          </tr>
          <!--{foreachelse}-->
          <tr>
            <td height="31" colspan="6">您还没有银行账户信息。</td>
          </tr>
          <!--{/foreach}-->
        </table>
        <div class="topmargin10px"></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->