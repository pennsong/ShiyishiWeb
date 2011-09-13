<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
  <div class="grid_19">
    <div id="yxx">
      <div id="yxx_location"><img src="<!--{$baseurl}-->/images/Icon1.gif" /> 您现在的位置是：<a href="<!--{$baseurl}-->/">首页</a> - <a href="<!--{$baseurl}-->/help.html">帮助中心</a> -正文</div>
      <div id="yxxmain">
        <h1><!--{$faq.subject}--></h1>
        <div id="yxxmainp"> <!--{$info.content}-->
        </div>
      </div>
    </div>
  </div>
  <div class="grid_5">
    <div id="hotjob">
      <h2>帮助中心</h2>
      <!--{foreach from=$faqs item=item}-->
      <ul>
        <!--{foreach from=$item.faqs item=faq}-->
        <li<!--{if $faq.id==$info.id}--> class="curr"<!--{/if}-->><a href="<!--{$baseurl}-->/help/<!--{$faq.id}-->.html"><!--{$faq.subject}--></a></li>
        <!--{/foreach}-->
      </ul>
      <!--{/foreach}-->
    </div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->