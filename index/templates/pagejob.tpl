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
<div id="joblistpage">
<span class="floatRight">
<a href="<!--{$page_arr.url}-->">首页</a>
<!--{if $page_arr.page>1}-->
<a href="<!--{$page_arr.url}--><!--{if $page_arr.page-1>1}--><!--{$pext}--><!--{$page_arr.page-1}--><!--{$plast}--><!--{/if}-->">前页</a>
<!--{/if}-->
<!--{if $page_arr.page - $page_offset > 1}-->
<a class="underline" href="<!--{$page_arr.url}--><!--{$pext}--><!--{$plast}-->1">1 ...</a>
<!--{/if}-->
<!--{section name="loop" loop=$page_to+1 start=$page_from  max=$page_to-$page_from+1}-->
<!--{if $page_arr.page == $smarty.section.loop.index}-->
[<!--{$smarty.section.loop.index}-->]
<!--{else}-->
<a class="underline" href="<!--{$page_arr.url}--><!--{$pext}--><!--{$smarty.section.loop.index}--><!--{$plast}-->"><!--{$smarty.section.loop.index}--></a>
<!--{/if}-->
<!--{/section}-->
<!--{if $page_arr.page < $page_arr.pagesize}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$page_arr.page+1}--><!--{$plast}-->">后页</a>
<!--{/if}-->
<!--{if $page_to < $page_arr.pagesize}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$page_arr.page+$page_num}--><!--{$plast}-->">下<!--{$page_num}-->页</a>
<!--{/if}-->
<a href="<!--{$page_arr.url}--><!--{$pext}--><!--{$page_arr.pagesize}--><!--{$plast}-->">尾页</a>
<input type="text" style="width: 30px;" id="txt_FootPageNo" value="<!--{$page_arr.page}-->" name="txt_FootPageNo">
<input type="button" id="btn_FootGo" value="GO" name="btn_FootGo" onclick="javascript: if($('#txt_FootPageNo').val()>0)){ location='<!--{$page_arr.url}-->page='+$('#txt_FootPageNo'.val()+'';return false;}">
</span>
显示<span class="red"><!--{$page_arr.count}--></span>条，当前第<span class="red"><!--{$page_arr.page}--></span>页，共<span class="red"><!--{$page_arr.pagesize}--></span>页，共<!--{$page_arr.total}-->条结果</div>
<!--{/if}-->