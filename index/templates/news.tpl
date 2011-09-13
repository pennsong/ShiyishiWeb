<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/news.css">
<div class="main">
  <div class="n_left">
    <div class="gray_top_box left_width"></div>
    <div class="gray_center_box left_width bg_ffffff">
      <ul class="news_list">
        <!--{foreach from=$allnews item=item}--><li><!--{if $catid<=0}--><a href="<!--{$weburl}-->/news/cat_<!--{$item.catid}-->/">【<!--{$item.catname}-->】</a><!--{/if}--><a href="<!--{$weburl}-->/news/item/<!--{$item.id}-->.html" title="<!--{$item.subject}-->"><!--{$item.subject|substr:"60":""}--></a><span><!--{$item.createdate}--></span></li><!--{/foreach}-->
      </ul>
      <div class="pgnum">
        <ul id="pagination-flickr">
          <!--{include file="page.tpl"}-->
        </ul>
      </div>
    </div>
    <div class="gray_bottom_box left_width"></div>
  </div>
  <div class="n_right">
    <div class="gray_top_box right_width"></div>
    <div class="gray_center_box right_width bg_ffffff">
      <div class="title">本月排行榜</div>
      <ul>
        <!--{foreach from=$gz_shows key=key item=item}--><li><span><!--{$key+1}-->.</span><a href="<!--{$weburl}-->/view/<!--{$item.id}-->.html" title="<!--{$item.subject}-->"><!--{$item.subject}--></a></li><!--{/foreach}-->
      </ul>
    </div>
    <div class="gray_bottom_box right_width"></div>
    <div class="global_height"></div>
    <div class="gray_top_box right_width"></div>
      <!--{include file="include/newshow.tpl"}-->
    <div class="gray_bottom_box right_width"></div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->