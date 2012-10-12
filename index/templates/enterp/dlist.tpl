<table width="100%" cellspacing="1" cellpadding="0" border="0">
<script type="text/javascript">
	var larray=[];
</script>
	<tr class="tabHead">
	<th width="32" class="blankTd"></th>
	<th width="43">编号</th>
	<th width="152">姓名</th>
	<th width="124" nowrap="" class=" centerAlign">期望职位</th>
	<th width="56" nowrap="" class=" centerAlign">性别</th>
	<th width="69" nowrap="">工作年限</th>
	<th width="113" nowrap="" class="centerAlign">毕业院校</th>
	<th width="56" nowrap="" class=" centerAlign">年龄</th>
	<th width="56" nowrap="" class=" centerAlign">学历</th>
	<th width="68" nowrap="" class=" centerAlign">现居住地</th>
	<th width="83" nowrap="" id="suspendAnchor" class=" centerAlign">投递日期</th>
	<th width="108" nowrap="" class="centerAlign">操作</th>
</tr>
<!--{foreach from=$resume key=key item=item}-->
<script type="text/javascript">
	larray.push(<!--{$item.bid}-->);
	user[<!--{$item.bid}-->]='<!--{$item.uname}-->';
</script>
<tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
<td class="tdCheckbox"><input type="checkbox" onclick="selectbox(this)" id="box_<!--{$item.bid}-->" value="<!--{$item.bid}-->" name="PositionID[]"></td>
<td style="word-wrap: break-word;" class="bolditem"><!--{$item.uid}--></td>
<td style="word-wrap: break-word;" class="bolditem"><!--{$item.uname}--></td>
<td nowrap="" class=" centerAlign"><!--{$item.f2}--></td>
<td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
<td style="word-wrap: break-word;"><!--{$item.work}--> 年</td>
<td nowrap="" class=" centerAlign"><!--{$item.schoolname}--></td>
<td nowrap="" class=" centerAlign"><!--{$item.age}--> 岁</td>
<td nowrap="" class=" centerAlign"> <!--{$degrees.cn[$item.degree]}--></td>
<td class=" centerAlign"><!--{$item.area}--></td>
<td class=" centerAlign"><!--{$item.posttime|date_format:"%y-%m-%d"}--></td>
<td nowrap="" class="action centerAlign">
<!--{if $item.lqstat!=1}-->
	<a target="frame_main" href="javascript:;" onclick="lquser('<!--{$item.uid}-->','<!--{$item.resumetype|default:'cn'}-->')">录用</a>
<!--{else}-->已录取
<!--{/if}--> 
<a class="songDefA" target="_blank" href="/enterp/resume/view.html?id=<!--{$item.id}-->&t=cn&from=downlist">查看<!--{if $item.viewed == 1}-->(v)<!--{/if}--></a> <a href="/enterp/resume/del.do?PositionID=<!--{$item.id}-->&type=down" onclick="if(confirm('确定删除?')==false){return false}else{ return true;}">删除</a><br/>
<!--{if $item.rtype==3 || $item.rtype==2}-->
		<a class="songDefA"  href="/enterp/resume/video.html?id=<!--{$item.id}-->" target="_blank" title="目前网络繁忙，建议下载到本地观看。">在线观看</a>
		<!--{if $item.video}-->
		<a class="songDefA"  href="<!--{$item.videoShiyishi}-->" target="_blank" >下载本地</a> 
		<!--{/if}-->
	<!--{/if}-->
		
</td>
</tr>
<!--{/foreach}-->
</table>