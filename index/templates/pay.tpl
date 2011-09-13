<!--{include file="header.tpl"}-->
<script>
function checkPay(rd){
	if(document.getElementById('paytype1'))document.getElementById('paytype1').value = rd;
	document.getElementById('bsubmit').disabled = false;
}
</script>
  <div id="mainContent_js">
    <div class="dg"> <img src="<!--{$baseurl}-->/images/zf_44.gif" width="908" height="64" />
      <div class="form_star">
      <form name="payform" onsubmit="document.getElementById('bsubmit').disabled = true;return true;" action="<!--{$pageurl}-->/check.do" method="post" target="_blank">
      <input type="hidden" name="proname" value="<!--{$orderinfo.proname}-->"/>
      <input type="hidden" name="procat" value="成人英语"/>
      <input type="hidden" id="paytype1" name="paytype1"/>
	  <input type="hidden" name="ordernum" value="<!--{$orderinfo.ordernum}-->"/>
	  <input type="hidden" name="totalprice" value="<!--{$orderinfo.totalprice}-->"/>
        <div id="u21_rtf">订单信息：以下信息将发送到您的Email邮箱中。</div>
        <table class="zf">
          <tr>
            <td width="112" align="right"><em>*</em>订单号：</td>
            <td width="9">&nbsp;</td>
            <td width="218"><!--{$orderinfo.ordernum}--></td>
            <td width="94" align="right"><em>*</em>订购人姓名：</td>
            <td width="10">&nbsp;</td>
            <td width="287"><!--{$orderinfo.username}--></td>
          </tr>
          <tr>
            <td align="right"><em>*</em>Email：</td>
            <td>&nbsp;</td>
            <td><!--{$orderinfo.useremail}--></td>
            <td align="right"><em>*</em>手机号码：</td>
            <td>&nbsp;</td>
            <td><!--{$orderinfo.mobile}--></td>
          </tr>
          <tr>
            <td align="right"><em>*</em>课程信息：</td>
            <td>&nbsp;</td>
            <td><!--{$orderinfo.proname}--></td>
            <td align="right"><em>*</em>订单金额：</td>
            <td>&nbsp;</td>
            <td><!--{$orderinfo.totalprice}--></td>
          </tr>
          <tr>
            <td align="right" valign="top"><em>*</em>支付银行：</td>
            <td colspan="5"><table width="98%" cellspacing="5">
              <tr>
                <!--{foreach from=$netbank item=item key=key}-->
                <td width="384">
                <input type="hidden" id="paytype_<!--{$item.id}-->" value="<!--{$item.paytype}-->"/>
                <input type="radio" name="payid" id="pay_<!--{$item.id}-->" value="<!--{$item.bankid}-->" onclick="checkPay($('#paytype_<!--{$item.id}-->').val());"/>
                <label for="pay_<!--{$item.id}-->"><img alt="<!--{$item.bankname}-->" src="<!--{$baseurl}-->/images/<!--{$item.banklogo}-->" align="absmiddle" onclick="document.getElementById('pay_<!--{$item.id}-->').checked=true;"/></label>
                </td>
                <!--{if $key%3==2}--></tr><tr><!--{/if}-->
                <!--{/foreach}-->
              </tr>
            </table></td>
          </tr>
        </table>
        <div class="clear"></div>
        <div  class="btnbox">
          <button type="submit" id="bsubmit" class="button3" disabled="disabled">付款</button>
        </div>
        </form>
      </div>
      <img src="<!--{$baseurl}-->/images/kcjs_56.gif" width="908" height="9" /> </div>
  </div>
<!--{include file="footer.tpl"}-->