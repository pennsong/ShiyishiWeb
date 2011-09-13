<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/help.css">
<div class="main">
  <div class="gray_top_box main_width"></div>
  <div class="gray_center_box main_width bg_ffffff">
    <div class="m">
      <div class="top">帮助中心主题分类</div>
      <!--{foreach from=$faqs item=item}-->
      <div class="cont">
        <div class="title"><!--{$item.name}--></div>
        <ul>
          <li><!--{foreach from=$item.faqs key=key item=faq}--><!--{if $key>0}--> | <!--{/if}--><a href="<!--{$weburl}-->/faq/<!--{$faq.id}-->.html"><!--{$faq.subject}--></a><!--{/foreach}--></li>
        </ul>
      </div>
      <!--{/foreach}-->
    </div>
  </div>
  <div class="gray_bottom_box main_width" style="clear:both;"></div>
  <div class="global_height"></div>
</div>
<!--{include file="include/footer.tpl"}-->