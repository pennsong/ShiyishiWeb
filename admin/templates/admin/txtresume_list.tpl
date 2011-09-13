
<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>简历列表【<!--{$page_arr.total}-->】</span></a></li>
  </ul>
</div>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
    用户ID:
    <input name="uid" type="text" value="<!--{if $s.uid>0}--><!--{$s.uid}--><!--{/if}-->" style="width:50px;"/>
	姓名:
    <input name="uname" type="text" value="<!--{$s.uname}-->" style="width:50px;"/>
	时间:
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.s_date}-->" name="s_date"/>
	~
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.e_date}-->" name="e_date"/>
	<input type="submit" name="search" value="搜索" />
</div>
</form>
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
	<td width="55" class="tal">用户ID</td>
    <td width="67" class="tal">姓名</td>
	<td width="48" class="tal">性别</td>
	<td width="105" class="tal">手机</td>
	<td width="75" class="tal">邮箱</td>
	<td width="104" class="tal">身份证</td>
	<td width="66" class="tal">现居住地</td>
	<td width="72" class="tal">最高学历</td>
	<td width="149" class="tal">专业</td>
	<td width="39" class="tal">英文</td>
	<td width="44" class="tal">视频</td>
	<td width="76" class="tal">更新时间</td>
	<td width="66" class="tal">创建时间</td>
    <td width="61" class="tal">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
	<td class="tal"><span class="fourm_name"><!--{$item.uid}--></span></td>
    <td class="tal"><!--{$item.uname}--></td>
	<td class="tal"><!--{if $item.gender==1}-->男<!--{elseif $item.gender==2}-->女<!--{else}-->保密<!--{/if}--></td>
    <td class="tal"><!--{$item.phone}--></td>
	<td class="tal"><!--{$item.email}--></td>
	<td class="tal"><!--{$item.idcard}--></td>
	<td class="tal"><!--{$item.live_gnd_name}--></td>
	<td class="tal"><!--{$item.degree}--></td>
	<td class="tal"><!--{$item.speciality_name}--></td>
	<td class="tal"><a class="fourm-two" href="<!--{$pageurl}-->/view.do?uid=<!--{$item.uid}-->&t=en">英文</a></td>
	<td class="tal"><a class="fourm-two" href="<!--{$baseurl}-->/admin/videoresume.do?uid=<!--{$item.uid}-->">视频</a></td>
	<td class="tal"><!--{$item.modifydate|date_format:"%Y-%m-%d"}--></td>
	<td class="tal"><!--{$item.createdate}--></td>
    <td>
	<a class="fourm-two" href="<!--{$pageurl}-->/view.do?id=<!--{$item.id}-->">详情</a>	</td>
  </tr>
  <!--{foreachelse}-->
  <tr class="tr3">
	<td colspan="14"><!--{if $s.uid>0}-->该会员没有上传文字简历！<!--{else}-->没有任何文字简历！<!--{/if}-->	</td>
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
</div>
<!--{include file=footer.tpl}-->
