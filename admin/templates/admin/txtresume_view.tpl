<!--{include file=header.tpl}-->
<style>
.bold{font-weight:bold;}
.font14px{font-size:14px;}
#gerenjl{}
#gerenjl table{}
#gerenjl table td{padding:3px;}
.grh2{color:#f60;font-weight:bold;padding:10px 0 10px 10px;border-bottom:1px solid #ccc;}
.grmain{padding:10px 0 10px 10px;}
</style>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn2"><span>简历列表</span></a></li>
	<li><a href="#" class="btn1"><span>简历详情</span></a></li>
  </ul>
</div>
<div style="clear:both;" id="gerenjl">
<table border="0" cellspacing="5" cellpadding="0" width="640">
  <tbody>
	<tr>
	  <td height="1" colspan="2" bgcolor="#CCCCCC"></td>
	</tr>
	<tr>
	  <td colspan="2">联系方式有：
			<!--{$info.phone}--> 
			<!--{$info.email}-->
		</td>
	</tr>
	<tr>
	  <td colspan="2"><table border="0" cellspacing="0" cellpadding="0" width="600">
		<tbody>
		  <tr>
			<td><strong>简历名称:<!--{$info.funtype_2_name}--> <!--{$info.live_gnd_name}--></strong></td>
			<td align="right" class="font14px bold">视一视招聘网</td>
		</tr>
	  </tbody>
	</table>
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		  <tbody>
			<tr>
			  <td width="81%">ID:<!--{$info.id}--></td>
			</tr>
			<tr>
			  <td colspan="2" style="border:1px solid #ccc"><div align="right"><!--{$info.uname}--> <!--{if $info.gender==1}-->男<!--{else}-->女<!--{/if}--> | <!--{$info.birth_year}-->年<!--{$info.birth_month}-->月生 | 现居住于：<!--{$info.live_gnd_name}--> </div></td>
			</tr>
		  </tbody>
	  </table></td>
	</tr>
	<tr>
	  <td colspan="2"><div  style="border:1px solid #ccc">
		<div>
		  <div>
			<div class="grh2">求职意向</div>
			<div class="grmain">
			  <table width="100%" border="0" cellpadding="2" cellspacing="0">
				<tbody>
				  <tr>
					<td nowrap="nowrap" align="right">期望工作性质：</td>
					<td><!--{$info.jobterm}--></td>
				</tr>
				  <tr>
					<td nowrap="nowrap" align="right">期望从事职业：</td>
					<td><!--{$info.funtype_2_name}--></td>
				</tr>
				  <tr>
					<td valign="top" nowrap="nowrap" align="right">期望从事行业：</td>
					<td><!--{$info.dustrytype_2_name}--></td>
				</tr>
				  <tr>
					<td nowrap="nowrap" align="right">期望工作地区：</td>
					<td><!--{$info.work_gnd_name}--></td>
				</tr>
				  <tr></tr>
				  <tr>
					<td width="1%" nowrap="nowrap" align="right">目前状况：</td>
					<td>我目前处于离职状态，可立即上岗</td>
				</tr>
			  </tbody>
			</table>
		  </div>
		</div>

		  <div>
			<div class="grh2">自我评价</div>
			<div class="grmain">
			  <div><!--{$info.introduction}--></div>
		  </div>
		</div>

		  <div>
			<div class="grh2">教育经历</div>
			<div class="grmain">
				<!--{foreach from=$edus key=key item=item}-->
					<!--{$item}--><br/>
				<!--{foreachelse}-->
					该求职者未填写教育经历。
				<!--{/foreach}-->
			</div>
		</div>
		  <div>
			<div class="grh2">证书奖励</div>
			<div class="grmain"><br />
			  <br />
				<!--{foreach from=$ctfs key=key item=item}-->
					<!--{$item}--><br/>
				<!--{foreachelse}-->
					该求职者未填写证书奖励。
				<!--{/foreach}-->

			  <div></div>
			  <p><br />
			</p>
		  </div>
		</div>

		  <div>
			<div class="grh2">工作经历</div>
			<div class="grmain"><br />
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<!--{foreach from=$works key=key item=item}-->
					<!--{$item}-->
				<!--{foreachelse}-->
					<tr><td colspan="2" align="center">该求职者未填写工作经历。</td></tr>
				<!--{/foreach}-->
				</table>
			  <div></div>
			  <p><br />
			</p>
		  </div>
		</div>

		  <div>
			<div class="grh2">语言能力</div>
			<div class="grmain">
				<!--{foreach from=$its key=key item=item}-->
					<!--{$item}--><br/>
				<!--{foreachelse}-->
					该求职者未填写语言能力。
				<!--{/foreach}-->
			</div>
		</div>

	  </div>
	</div></td>
  </tr>
  </tbody>
</table>
</div>
</div>
<!--{include file=footer.tpl}-->
