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
<!--{if $page_arr.t==2}-->
<!--{assign var="pext" value='pn'}-->
<!--{assign var="plast" value='/'}-->
<!--{else}-->
<!--{assign var="pext" value='page='}-->
<!--{assign var="plast" value=''}-->
<!--{/if}-->
<a href="<!--{$page_arr.url}-->">首页</a>
<!--{if $page_arr.page>1}-->
<a href="<!--{$page_arr.url}--><!--{if $page_arr.page-1>1}--><!--{$pext}--><!--{$page_arr.page-1}--><!--{$plast}--><!--{/if}-->">上一页</a>
<!--{/if}-->
<!--{if $page_arr.page - $page_offset > 1}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$plast}-->1">1 ...</a>
<!--{/if}-->
<!--{section name="loop" loop=$page_to+1 start=$page_from  max=$page_to-$page_from+1}-->
<!--{if $page_arr.page == $smarty.section.loop.index}-->
<!--{$smarty.section.loop.index}-->
<!--{else}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$smarty.section.loop.index}--><!--{$plast}-->"><!--{$smarty.section.loop.index}--></a>
<!--{/if}-->
<!--{/section}-->
<!--{if $page_arr.page < $page_arr.pagesize}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$page_arr.page+1}--><!--{$plast}-->">下一页</a>
<!--{/if}-->
<!--{if $page_to < $page_arr.pagesize}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$page_arr.page+$page_num}--><!--{$plast}-->">下<!--{$page_num}-->页</a>
<!--{/if}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$page_arr.pagesize}--><!--{$plast}-->">尾页</a>
<!--{/if}-->