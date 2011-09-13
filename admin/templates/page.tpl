<!--{assign var="page_num" value=$page_num|default:10}-->
<!--{if $page_arr.total > $page_arr.count}-->
<!--{assign var="page_offset" value=$page_offset|default:3}-->
<!--{assign var="page_from" value=$page_arr.page-$page_offset}-->
<!--{assign var="page_to" value=$page_from+$page_num-1}-->
<!--{if $page_from < 1}-->
<!--{assign var="page_to" value=$page_arr.page+1-$page_from}-->
<!--{assign var="page_from" value=1}-->
<!--{if $page_to - $page_from < $page_num}-->
<!--{assign var="page_to" value=$page_num}-->
<!--{/if}-->
<!--{elseif $page_to > $page_arr.pagesize}-->
<!--{assign var="page_from" value=$page_arr.pagesize-$page_num+1}-->
<!--{assign var="page_to" value=$page_arr.pagesize}-->
<!--{/if}-->
<!--{if $page_arr.pagesize < $page_num}-->
<!--{assign var="page_from" value=$page_arr.page-$page_offset}-->
<!--{assign var="page_to" value=$page_arr.pagesize}-->
<!--{if $page_from < 1}-->
<!--{assign var="page_from" value=1}-->
<!--{/if}-->
<!--{/if}-->
<div class="pages">
<!--{if $page_arr.page - $page_offset > 1}-->
<a href="<!--{$page_arr.url}-->page=1">1 ...</a>
<!--{/if}-->
<!--{section name="loop" loop=$page_to+1 start=$page_from  max=$page_to-$page_from+1}-->
<!--{if $page_arr.page == $smarty.section.loop.index}-->
<b><!--{$smarty.section.loop.index}--></b>
<!--{else}-->
<a href="<!--{$page_arr.url}-->page=<!--{$smarty.section.loop.index}-->"><!--{$smarty.section.loop.index}--></a>
<!--{/if}-->
<!--{/section}-->
<!--{if $page_to < $page_arr.pagesize}-->
<a href="<!--{$page_arr.url}-->page=<!--{$page_arr.page+$page_num}-->">下<!--{$page_num}-->页</a>
<!--{/if}-->
<span class="pagesone">共<font color="red"><!--{$page_arr.total}--></font>条|页数:<!--{$page_arr.page}-->/<!--{$page_arr.pagesize}-->&nbsp;
<input type="text" size="3" onkeydown="javascript: if(event.keyCode==13){ location='<!--{$page_arr.url}-->page='+this.value+'';return false;}"></span>
</div>
<!--{/if}-->