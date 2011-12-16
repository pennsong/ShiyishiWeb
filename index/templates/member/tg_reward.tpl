<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <h2>我的奖励</h2>
        <li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> 剩余奖励积分：<!--{$allmoney|default:0}-->分 (兑换￥<!--{$allmoney/10|default:0}-->元)；<!--{if $allmoney>1000}--><input type="button" value="申请领款" onclick="if(confirm('您确定要领取“￥<!--{$allmoney/10|default:0}-->元”吗')){this.disabled=true;window.frames['frame_main'].location.href='/member/do/ling.do';}"><!--{else}--><input type="button" value="申请领款" onclick="alert('提示：积分超过1000分后才可申请领款。')"><!--{/if}--></li>
        <table width="100%" cellspacing="1" cellpadding="0" id="ftable">
          <tr>
            <th width="20%">奖励积分</th>
            <th width="60%">奖励描述</th>
            <th width="20%">录用时间</th>
          </tr>
		  <!--{foreach from=$rows item=item}-->
          <tr>
            <td><!--{if $item.doact>0}-->+<!--{else}-->-<!--{/if}-->  <!--{$item.money}-->分</td>
            <td><!--{$item.aclog}--></td>
            <td><p><!--{$item.createdate}--></p></td>
          </tr>
		  <!--{foreachelse}-->
          <tr>
            <td colspan="3" align="center">暂无任何您的奖励记录，建议您<a href="<!--{$baseurl}-->/member/tg/code.html">开始推广</a></td>
          </tr>
		  <!--{/foreach}-->
          <!--{if $rows}-->
		  <tr>
            <td colspan="6"><div align="right"><!--{include file=page.tpl}--></div></td>
          </tr>
		  <!--{/if}-->
        </table>
		<div class="topmargin10px"></div>
        <h2>申请奖励历史记录</h2>
        <table id="ftable" width="100%" cellpadding="0" cellspacing="1">
          <tbody><tr>
            <th width="20%">申请时间</th>
            <th width="60%">审核结果</th>
            <th width="20%">未通过原因</th>
          </tr>
		  <!--{foreach from=$slrows item=item}-->
		  <tr>
		    <td><!--{$item.createdate}--></td>
		    <td>您的申请领款<!--{if $item.status==0}--><span class="red bold">未</span><!--{else}-->已经<!--{/if}-->审核通过！</td>
		    <td><p><!--{$item.aclog}--></p></td>
	      </tr>
		  <!--{foreachelse}-->
		  <tr>
            <td colspan="3" align="center">还没有申领记录</td>
          </tr>
		   <!--{/foreach}-->
          </tbody></table>
        <div class="topmargin10px"></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<iframe id="frame_main" name="frame_main" style="display:none;"></iframe>
<script language="JavaScript">
var turl = window.location.href;
function msg(_m,_s){
	alert(_m);
	if(_s){
		if(_s==2){
			window.location.href = '/member/tg/addbank.html';
		}else{
			window.location.href = turl;
		}
	}
}
</script>
<!--{include file="include/footer.tpl"}-->