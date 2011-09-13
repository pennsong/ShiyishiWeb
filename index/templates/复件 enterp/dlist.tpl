<table width="100%" cellspacing="1" cellpadding="0" border="0">
<script type="text/javascript">
	var larray=[];
</script>
<!--{foreach from=$resume key=key item=item}-->
<script type="text/javascript">
	larray.push(<!--{$item.bid}-->);
	user[<!--{$item.bid}-->]='<!--{$item.uname}-->';
</script>
<tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
<td class="tdCheckbox"><input type="checkbox" onclick="selectbox(this)" id="box_<!--{$item.bid}-->" value="<!--{$item.bid}-->" name="PositionID[]"></td>
<td style="word-wrap: break-word;" class="bolditem"><!--{$item.id}--></td>
<td style="word-wrap: break-word;" class="bolditem"><!--{$item.uname}--></td>
<td nowrap="" class=" centerAlign"><!--{$item.f2}-->(<!--{$item.area}-->)</td>
<td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
<td style="word-wrap: break-word;"><!--{$item.work}--></td>
<td nowrap="" class=" centerAlign"><!--{$item.schoolname}--></td>
<td nowrap="" class=" centerAlign"><!--{$item.age}--></td>
<td nowrap="" class=" centerAlign"> <!--{$degrees.cn[$item.degree]}--></td>
<td class=" centerAlign"><!--{$item.area}--></td>
<td class=" centerAlign"><!--{$item.posttime|date_format:"%y-%m-%d"}--></td>
<td nowrap="" class="action centerAlign"><a  target="_blank" href="/enterp/resume/view.html?id=<!--{$item.id}-->&t=cn">查看</a> 
	<!--{if $item.rtype==3}-->
		<a  href="/enterp/resume/video.html?id=<!--{$item.id}-->" target="_blank" >视频</a> 
	<!--{/if}-->
		<a href="/enterp/resume/del.do?PositionID=<!--{$item.id}-->&type=down" onclick="if(confirm('确定删除?')==false){return false}else{ return true;}">删除</a>
</td>
</tr>
<!--{/foreach}-->
</table>