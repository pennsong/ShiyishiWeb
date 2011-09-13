<!--{include file=header.tpl}-->
<style>
.b0{ margin-bottom:10px; color:#090; font-size:14px; font-weight:700; }
.b1{ margin-bottom:10px; color:#C00; font-size:14px; font-weight:700; }
.b2{ margin-bottom:10px; color:#09C; font-size:14px; font-weight:700; }
</style>
<!--{if !$w}-->
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<!--{/if}-->
<div class="message" style="<!--{if $w>0}-->position:absolute;top:50%;margin-top:-60px;width:<!--{$w}-->px;<!--{/if}-->">
<table width="100%">
<tr><td width="150" class="tac">
<img src="<!--{$baseurl}-->/images/ok.gif"></td><td class="tal">
<!--{if $jumpurl}-->
<p><meta http-equiv="refresh" content="2; url=<!--{$jumpurl}-->"></p>
<!--{/if}-->
<!--{if $type == '1'}-->
<ul class="b1">
<!--{foreach from=$msg item=item}-->
<li><!--{$item}--></li>
<!--{/foreach}-->
</ul>
<a href="javascript:history.go(-1);">点击这里返回上一页</a>
<!--{elseif $type == '2'}-->
<ul class="b2">
<!--{foreach from=$msg item=item}-->
<li><!--{$item}--></li>
<!--{/foreach}-->
</ul>
<form action="<!--{$baseurl}-->/log/add.do" method="post">
<input type="hidden" name="jumpurl" value="<!--{$jumpurl}-->">
<span class="gray">输入操作理由 <input class="input" type="text" name="content" value="" size="20"><input class="btn" type="submit" value="确定"><br />
(请在必要的时候输入理由，方便查看日志记录信息）</span><br />
<a href="<!--{$jumpurl}-->">点击这里继续操作</a>
</form>
<!--{elseif $type == '4'}-->
<ul class="b1">
<!--{foreach from=$msg item=item}-->
<li><!--{$item}--></li>
<!--{/foreach}-->
</ul>
<a href="javascript:self.top.location.href='/login.do';">点击这里进行登录</a>
<!--{elseif $type == '5'}-->
<ul class="b1">
<!--{foreach from=$msg item=item}-->
<li><!--{$item}--></li>
<!--{/foreach}-->
</ul>
<script language="JavaScript">
setTimeout(function(){self.parent.backfunc();},2000)
</script>
<a href="javascript:self.parent.backfunc();">点击这里返回...</a>
<!--{else}-->
<ul class="b0">
<!--{foreach from=$msg item=item}-->
<li><!--{$item}--></li>
<!--{/foreach}-->
</ul>
<a href="<!--{$jumpurl}-->">如果您的浏览器没有自动跳转，请点击这里</a>
<!--{/if}-->
</td></tr>
</table>
</div>
<!--{if !$w}-->
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<!--{include file=footer.tpl}-->
<!--{else}-->
</div>
</body>
</html>
<!--{/if}-->