<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>分类管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>分类设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加分类</span></a></li>
<!--{/if}-->
</ul>
<form action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>分类设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">上级分类:</td>
		<td class="td4">
			<select name="info[parent_id]">
			<option value="0">一级分类</option>
			<!--{foreach from=$cats item=cat}-->
			<option value="<!--{$cat.id}-->" <!--{if $info.parent_id==$cat.id}-->selected<!--{/if}-->><!--{$cat.cat_name}--></option>
			<!--{/foreach}-->
			</select>
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3">分类名称:</td>
		<td class="td4"><input type="text" id="cat_name" class="input" name="info[cat_name]" value="<!--{$info.cat_name}-->" alt="分类名称:4-50/无内容/有全角/有空格"/>
		<span id="showResult_cat_name"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">英文名称:</td>
		<td class="td4"><input type="text" id="cat_en" class="input" name="info[cat_en]" value="<!--{$info.cat_en}-->" alt="英文名称:2-50/英文数字/无内容/有全角/有空格"/>
		<span id="showResult_cat_en"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">显示顺序:</td>
		<td class="td4"><input type="text" id="order_id" class="input" name="info[order_id]" value="<!--{$info.order_id|default:50}-->" alt="显示顺序:0-6/数字/无内容"/>
		<span id="showResult_order_id"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">所属城市:</td>
		<td class="td4" id="citybox">
		<input type="checkbox" onclick="checkAll(this);" id="checkallbox"/>全部
		<!--{foreach from=$citys key=key item=item}-->
		<input name="info[cityids][]" type="checkbox" value="<!--{$item.id}-->" <!--{$item.checked}--> /><!--{$item.name}-->
		<!--{/foreach}-->
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3">属性:</td>
		<td class="td4"><input type="checkbox" id="active" class="input" name="info[active]" value="1" <!--{if $info.active==1}-->checked<!--{/if}-->/>启用 <input type="checkbox" id="is_hot" class="input" name="info[is_hot]" value="1" <!--{if $info.is_hot==1}-->checked<!--{/if}-->/>热门</td>
	</tr>
	<tr class="tr4">
		<td class="td3">SEO标题:</td>
		<td class="td4"><input type="text" id="seo_title" class="input" name="info[seo_title]" value="<!--{$info.seo_title}-->" style="width:360px;"/>
		<span id="showResult_seo_title"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">SEO关键词:</td>
		<td class="td4"><input type="text" id="seo_keyword" class="input" name="info[seo_keyword]" value="<!--{$info.seo_keyword}-->" style="width:360px;" />
		<span id="showResult_seo_keyword"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">SEO描述:</td>
		<td class="td4"><input type="text" id="seo_description" class="input" name="info[seo_description]" value="<!--{$info.seo_description}-->" style="width:360px;" />
		<span id="showResult_seo_description"></span></td>
	</tr>
</table>
<br />
<div style="padding-left:75px;"> <input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提 交" class="btn" /></div>
</form>
<script language="JavaScript">
<!--{if $info.cityids}-->
var str="<!--{$info.cityids}-->",k = document.getElementsByName("info[cityids][]");
str = str.split(",");
for(L=0;L<str.length;L++){
	for(i=0;i<k.length;i++){
		if(str[L]==k[i].value){
			k[i].checked = true;
		}
	}
}
if(str.length==k.length){
	document.getElementById('checkallbox').checked = true;
}
<!--{/if}-->
</script>
<!--{include file=footer.tpl}-->