<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/tab.js" type="text/javascript"></script>
<form action="<!--{$pageurl}-->/purview.do" method="post">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<input type="hidden" name="m" value="<!--{$m}-->" />
<h2>权限设置 <!--{if $m=='admin'}-->【设置管理员 <!--{$info.admin_name}--> 的权限】 <!--{else}-->【设置 <!--{$info.duty_name}--> 的权限】<!--{/if}--></h2>
<ul class="nav4" id="tabbar-div">
<!--{foreach from=$purviewtops item=top}-->
<li><span id="tab_<!--{$top.id}-->" <!--{if $top.id!=1}-->class="tab-back"<!--{else}-->class="tab-front"<!--{/if}--> onmouseover="tabonmouseover(this);" onmouseout="tabonmouseout(this);" onclick="tabonclick(this);"><!--{$top.purview_name}--></span></li>
<!--{/foreach}-->
</ul>
<div style="padding:0 0 0 10px;color:#000;">
<!--{foreach from=$purviews item=purview1}-->
<div id="perview_<!--{$purview1.id}-->" style="display:<!--{if $purview1.id!=1}-->none<!--{/if}-->;">
<!--{foreach from=$purview1.children item=purview}-->
<h3 style="font-size:14px;padding:0;border-top:0px;"><!--{$purview.purview_name}--></h3>
<!--{foreach from=$purview.children item=purview2}-->
<!--{if $purview2.purview_link}-->
<!--{assign var="pur_link" value=admin_`$purview2.purview_link`}-->
	<h5 style="padding:0 0 5px 10px;background:#E8EAFF;"><img src="/images/Tp.gif"  /> <!--{$purview2.purview_name}--> <input type="checkbox" id="purview_a_<!--{$purview2.id}-->" onclick="checkChild(this);"></h5>
<ul style="line-height:200%;" id="purview_a_<!--{$purview2.id}-->_ul">
		<!--{foreach from=$purview2.children item=purview3}-->
		<li style="float:left;margin:0 10px 0 0;padding:0 0 0 20px;width:170px;"><input type="checkbox" name="info[purview][<!--{$pur_link}-->][]" value="<!--{$purview3.purview_link}-->"
		<!--{if $info.purview}-->
		<!--{foreach from=$info.purview key=key item=value}-->
		<!--{if $key == $pur_link}-->
		<!--{if $purview3.purview_link|in_array:$value}-->
		checked
		<!--{/if}-->
		<!--{/if}-->
		<!--{/foreach}-->
		<!--{/if}-->
		/> <!--{$purview3.purview_name}--></li>
		<!--{/foreach}-->
	</ul><div style="clear:both;"></div>
<!--{/if}-->
<!--{/foreach}-->
<br  />
<!--{/foreach}-->
</div>
<!--{/foreach}-->
</div>
<!--{if $m=='admin'}-->
<br/>
<div style="clear:both;color:red;margin:5px 10px;line-heght:25px;"><input type="checkbox" name="duty_p" value="<!--{$info.admin_zhiwu}-->"/>使用职务预设权限</div>
<input type="hidden" name="admin_type" value="<!--{$info.admin_type}-->" />
<!--{/if}-->
<br />
<div><input type="submit" value="提交" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
</form>
<script>
function checkChild(obj)
{
	var oid = obj.id+'_ul';
	var checked = obj.checked;
	var checkbox = document.getElementById(oid).getElementsByTagName("input");
	for(i=0;i<checkbox.length;i++){
		checkbox[i].checked = checked;
	}
}
</script>
<!--{include file=footer.tpl}-->