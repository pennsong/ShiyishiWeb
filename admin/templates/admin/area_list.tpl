<!--{include file=header.tpl}-->
<ul class="nav3">
<li><a href="#" class="btn1"><span>列表管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do?t=0" class="btn2"><span>添加省份</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do?t=-1" class="btn2"><span>添加直辖市</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do?t=99999" class="btn2"><span>添加城市</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do?t=-2" class="btn2"><span>添加直辖市下的区</span></a></li>
</ul>
<form action="<!--{$pageurl}-->/order.do" method="post">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal">[顺序]地区名称</td>
		<td class="tal">英文名称</td>
		<td class="tal">城市类型</td>
		<td class="tal" width="5%" style="text-align:center">设置</td>
		<td class="tal" width="5%" style="text-align:center">删除</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3" id="tr_<!--{$item.id}-->">
		<td class="tal">
			<input class="input tac" name="orderid[<!--{$item.id}-->]" value="<!--{$item.order_id}-->" size="2" type="text">
			<span class="fourm_name"><!--{$item.prename|default:$item.area_name}--></span><span id="s_<!--{$item.id}-->"><a onclick="showSubs(<!--{$item.id}-->);" style="cursor:pointer;color:red;" title="查看城市或地区">+</a></span>
		</td>
		<td><!--{$item.area_en}--></td>
		<td><!--{if $item.parent_id==0}-->省份<!--{else}--><!--{if $item.parent_id<0}-->直辖市：<!--{/if}--><!--{if $item.type==1}-->重点城市<!--{elseif $item.type==2}-->非重点城市<!--{elseif $item.type==3}-->非非重点城市<!--{else}-->非演出城市<!--{/if}--><!--{/if}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&backurl=<!--{$backurl}-->">编辑</a></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<input type="hidden" name="backurl" value="<!--{$backurl}-->" />
<br>
<center><input type="submit" class="btn" value="提 交" /> <input type="reset" class="btn" value="重 置" /></center>
</form>
<script type="text/javascript">
function showSubs(pid){
	$.ajax({
		type:"GET",
		url:"<!--{$baseurl}-->/admin/ajax/getsubcity.do",
		dataType:"html",
		data:"pid="+pid,
		beforeSend:function(XMLHttpRequest){
			$("#s_"+pid).text("正在查询...");
		},
		success:function(msg){
			if(!msg){
				$("#s_"+pid).hide();
			}else{
				$("#s_"+pid).html('<a onclick="hideSubs('+pid+');" style="cursor:pointer;color:red;" title="隐藏城市">-</a></span>');
				$("#tr_"+pid).after(msg);
			}
		}
	});
}
function hideSubs(pid){
	for(var i=0;i<100;i++){
		if(document.getElementById('subtr_'+pid+'_'+i)){
			$('#subtr_'+pid+'_'+i).remove(); 
			$("#s_"+pid).html('<a onclick="showSubs('+pid+');" style="cursor:pointer;color:red;" title="显示城市">+</a></span>');
		}else{
			break;
		}
	}
}
<!--{if $pid>0}-->
showSubs(<!--{$pid}-->);
<!--{/if}-->
</script>
<!--{include file=footer.tpl}-->