<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="glogin2">
    <div id="<!--{if !$logininfo.company}-->gloginright2<!--{else}-->hrloginright2<!--{/if}-->">
      <h2></h2>
      <!--{if $type == '1'}-->
      <div class="wcdingdan"> <span class="chenggong"><!--{foreach from=$msg item=item}--><!--{$item}--> <!--{/foreach}--></span><br />
        <br />
        <a href="javascript:history.back(-1);">点击返回</a>，回到上一页。<br />
        <br />
      <!--{else}-->
	  <!--{if $w == '1'}-->
      <div class="wcdingdan"> <span class="chenggong"><!--{foreach from=$msg item=item}--><!--{$item}--> <!--{/foreach}--></span><br />
        <br />
        <br />
        <a href="<!--{$jumpurl}-->"><!--{$msg2|default:'点击继续'}--></a>，<a href="javascript:history.back(-1);">点击返回</a>。</a>
	  <!--{else}-->
      <div class="wcdingdan"> <span class="chenggong"><!--{foreach from=$msg item=item}--><!--{$item}--> <!--{/foreach}--></span><br />
        <br />
        <br />
        <a href="<!--{$jumpurl}-->">如果页面没有响应，点击这里，<!--{$msg2|default:'继续您刚才的操作'}-->。</a>
	    <script>
var t = 3;
var timeInterval;
function checktime(){
	t--;
	if(t==0){
		clearTimeout(timeInterval);
		window.location.href="<!--{$jumpurl}-->";
	}
}
timeInterval = setInterval("checktime()",1000);
        </script><!--{/if}-->
      <!--{/if}-->
	  </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->