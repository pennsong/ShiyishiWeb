<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>城市管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>修改城市</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加城市</span></a></li>
<!--{/if}-->
</ul>
<form action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>城市设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<!--{if $info.parent_id>0}-->
	<tr class="tr4">
		<td class="td3" width="130">选择省份:</td>
		<td class="td4">
			<select name="info[parent_id]">
				<!--{foreach from=$areas item=area}-->
				<option value="<!--{$area.id}-->"<!--{if $area.id == $info.parent_id}--> selected<!--{/if}-->><!--{$area.area_name}--></option>
				<!--{/foreach}-->
			</select>
		</td>
	</tr>
	<!--{elseif $info.type==-1}-->
	<tr class="tr4">
		<td class="td3" width="130">选择直辖市:</td>
		<td class="td4">
			<select name="info[parent_id]">
				<!--{foreach from=$areas item=area}-->
				<option value="<!--{$area.id}-->"<!--{if $area.id == $info.parent_id}--> selected<!--{/if}-->><!--{$area.area_name}--></option>
				<!--{/foreach}-->
			</select>
		</td>
	</tr>
	<!--{else}-->
	<input type="hidden" name="info[parent_id]" value="<!--{$info.parent_id|default:0}-->" />
	<!--{/if}-->
	<tr class="tr4">
		<td class="td3" width="130">名称:</td>
		<td class="td4"><input type="text" id="area_name" class="input" name="info[area_name]" value="<!--{$info.area_name}-->" alt="城市名称:4-50/无内容/有全角/有空格"/>
		<span id="showResult_area_name"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">拼音:</td>
		<td class="td4"><input type="text" id="area_en" class="input" name="info[area_en]" value="<!--{$info.area_en}-->" alt="域名:2-50/英文数字/无内容/有全角/有空格"/>
		<span id="showResult_area_en">请使用拼音或者英文</span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">显示顺序:</td>
		<td class="td4"><input type="text" id="order_id" class="input" name="info[order_id]" value="<!--{$info.order_id|default:50}-->" alt="显示顺序:0-6/数字/无内容"/>
		<span id="showResult_order_id"></span></td>
	</tr>
	<!--{if $info.parent_id!=0&&$info.type!=-1}-->
	<tr class="tr4">
		<td class="td3">城市属性:</td>
		<td class="td4"><input type="radio" name="info[type]"value="1" <!--{if $info.type==1}-->checked<!--{/if}--> />重点城市 <input type="radio" name="info[type]" value="2" <!--{if $info.type==2}-->checked<!--{/if}-->/>非重点城市 <input type="radio" name="info[type]" value="3" <!--{if $info.type==3}-->checked<!--{/if}-->/>非非重点城市
		</td>
	</tr>
	<!--{/if}-->
	<!--{if $info.type==-1}--><input type="hidden" name="info[type]" value="<!--{$info.type}-->" /><!--{/if}-->
</table>
<br />
<div style="padding-left:155px;"> <input type="submit" value="提 交" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->