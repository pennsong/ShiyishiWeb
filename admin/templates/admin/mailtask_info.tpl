<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>邮件任务管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>邮件任务设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加邮件任务</span></a></li>
<!--{/if}-->
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>邮件任务设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<!--{if $info.createdate}-->
	<tr class="tr4">
		<td class="td3" width="150">添加时间:</td>
		<td class="td4"><input type="text" value="<!--{$info.createdate}-->" disabled="disabled"/></td>
	</tr>
	<!--{/if}-->
	<tr class="tr4">
		<td class="td3" width="150">任务名:</td>
		<td class="td4"><input id="taskname" name="info[taskname]" type="text" value="<!--{$info.taskname}-->" alt="任务名:无内容" style="width:220px;"/><span id="showResult_taskname"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">邮件模板:</td>
		<td class="td4"><select name="info[templateid]" id="templateid" alt="邮件模板:空">
          <option value="" >请选择模板</option>
          <!--{foreach from=$mailtemplates key=key item=item}-->
          <option value="<!--{$key}-->" 
          <!--{if $key==$info.templateid}-->
          selected
          <!--{/if}-->
          >
          <!--{$item.name}-->
          </option>
          <!--{/foreach}-->
        </select>
		<span id="showResult_templateid"></span></td>
	</tr>
	<input name="info[sendfrequency]" type="hidden" value="0"/>
	<tr class="tr4">
		<td class="td3" width="150">执行动作:</td>
		<td class="td4"><select name="info[action]" id="action" alt="执行动作:空">
          <option value="" >请选择执行动作</option>
          <!--{foreach from=$taskaction key=key item=item}-->
          <option value="<!--{$key}-->" 
          <!--{if $key==$info.action}-->
          selected
          <!--{/if}-->
          >
          <!--{$item}-->
          </option>
          <!--{/foreach}-->
        </select><span id="showResult_action"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">状态:</td>
		<td class="td4"><input name="info[status]" type="radio" value="show" <!--{if $info.status!='hide'}-->checked<!--{/if}-->/> 有效 &nbsp; <input name="info[status]" type="radio" value="hide" <!--{if $info.status=='hide'}-->checked<!--{/if}-->/> 无效</td>
	</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->