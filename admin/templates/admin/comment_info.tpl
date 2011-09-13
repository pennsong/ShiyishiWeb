<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>评论管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>修改评论</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加评论</span></a></li>
<!--{/if}-->
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>添加/修改评论</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">分类:</td>
		<td class="td4">
			<select name="info[catid]" id="catid" alt="分类:无内容">
			<option value="" >请选择分类</option>
			<!--{foreach from=$cats item=item}-->
			<option value="<!--{$item.id}-->" <!--{if $item.id==$info.catid}-->selected<!--{/if}-->><!--{$item.prename}--></option>
			<!--{/foreach}-->
			</select><span id="showResult_catid"></span>
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3">评论名称:</td>
		<td class="td4"><input id="subject" name="info[subject]" type="text" value="<!--{$info.subject}-->" alt="评论名称:无内容" style="width:300px;"/><span id="showResult_subject"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">关键词:</td>
		<td class="td4"><input id="keywords" name="info[keywords]" type="text" value="<!--{$info.keywords}-->" alt="关键词:无内容" style="width:300px;" /><span id="showResult_keywords"></span>多个关键词用,隔开</td>
	</tr>
	<tr class="tr4">
		<td class="td3">兑换所需积分:</td>
		<td class="td4"><input type="text" class="input" size="3" name="info[needpoints]" value="<!--{$info.needpoints|default:500}-->" /><span id="showResult_needpoints"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">评论总数:</td>
		<td class="td4"><input type="text" class="input" size="3" name="info[allnum]" value="<!--{$info.allnum|default:10}-->" /><span id="showResult_allnum"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">排序数字:</td>
		<td class="td4"><input type="text" class="input" size="3" name="info[order_id]" value="<!--{$info.order_id|default:0}-->" /><span id="showResult_order_id"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">状态:</td>
		<td class="td4"><input type="radio" name="info[status]" value="1" <!--{if $item.status!='0'}-->checked<!--{/if}-->/>上架 <input type="radio" name="info[status]" value="0" <!--{if $item.status=='0'}-->checked<!--{/if}-->/>下架 </td>
	</tr>
	<tr class="tr4">
		<td class="td3">评论内容:</td>
		<td class="td4"><!--{$info.content}--></td>
	</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->