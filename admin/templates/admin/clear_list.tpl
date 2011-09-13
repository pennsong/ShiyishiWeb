<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="#" class="btn1"><span>缓存管理</span></a></li>
</ul>
<form action="<!--{$pageurl}-->/clear.do" method="post">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<h2>清除缓存--请选择要清除的缓存</h2>
<div style="padding:0 0 0 10px;color:#000;">
<!--{foreach from=$caches key=key item=item}-->
	<h5 style="padding:0 0 5px 10px;background:#E8EAFF;"><img src="/images/Tp.gif"  /> <!--{$item.name}--><!--{if $item.fields}--><input type="checkbox" id="cache_a_<!--{$key}-->" onclick="checkChild(this);"/><input type="hidden" name="caches[]" value="<!--{$key}-->"/><!--{/if}--></h5>
	<ul style="line-height:200%;" id="cache_a_<!--{$key}-->_ul">
		<!--{foreach from=$item.fields item=cname key=ckey}-->
		<li style="float:left;margin:0 10px 0 0;padding:0 0 0 20px;width:170px;"><input type="checkbox" name="info[<!--{$key}-->][]" value="<!--{$ckey}-->" /> <!--{$cname}--></li>
		<!--{foreachelse}-->
		<li style="float:left;margin:0 10px 0 0;padding:0 0 0 20px;width:170px;">暂无</li>
		<!--{/foreach}-->
	</ul><div style="clear:both;"></div>
<!--{/foreach}-->
	<h5 style="padding:0 0 5px 10px;background:#E8EAFF;"><img src="/images/Tp.gif"  /> 数据表结构缓存<input type="checkbox" id="cache_a_db" onclick="checkChild(this);"/></h5>
	<ul style="line-height:200%;" id="cache_a_db_ul">
		<!--{foreach from=$db_caches item=item}-->
		<li style="float:left;margin:0 10px 0 0;padding:0 0 0 20px;width:225px;"><input type="checkbox" name="dbinfo[]" value="<!--{$item}-->" /> <!--{$item}--></li>
		<!--{foreachelse}-->
		<li style="float:left;margin:0 10px 0 0;padding:0 0 0 20px;width:225px;">暂无</li>
		<!--{/foreach}-->
	</ul>
	<div style="clear:both;"></div>
</div>

<br />
<div style="padding-left:25px;"><input type="submit" value="提交" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
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