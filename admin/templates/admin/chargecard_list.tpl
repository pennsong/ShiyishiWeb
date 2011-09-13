<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script language="JavaScript">
function checkAll(checked)
{
	var oid = 'ftable';
	var checkbox = document.getElementById(oid).getElementsByTagName("input");
	for(i=0;i<checkbox.length;i++){
		checkbox[i].checked = checked;
	}
}
var turl = '<!--{$turl}-->'
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do?isactive=1" <!--{if 1==$s.isactive}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>已激活</span></a></li>
	<li><a href="<!--{$pageurl}-->/list.do?isactive=0" <!--{if '0'==$s.isactive}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>未激活</span></a></li>
	<li><a href="<!--{$pageurl}-->/list.do?isactive=10" <!--{if 10==$s.isactive}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>已删除</span></a></li>
    <li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加</span></a></li>
  </ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
  <form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
  <input type="hidden" value="<!--{$s.isactive}-->" name="isactive"/>
	<select name="isuse">
      <option value="" >充值？</option>
      <option value="1" <!--{if 1==$s.isuse}-->selected<!--{/if}-->>已充值
      </option>
      <option value="0" <!--{if '0'==$s.isuse}-->selected<!--{/if}-->>未充值
      </option>
    </select>
	时间段：
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.startdatetime}-->" name="startdatetime"/>
    至
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.enddatetime}-->" name="enddatetime"/>
    
	卡号:
    <input name="cardnum" type="text" value="<!--{$s.cardnum}-->" style="width:90px;"/>
	面值:
    <input name="fee" type="text" value="<!--{$s.fee}-->" style="width:50px;"/>
    <input class="btn" type="submit" name="search" value="搜 索" />
  </form>
</div>
<form id="listform" name="listform" action="<!--{$pageurl}-->/check.do" method="post" target="post_main">
<div style="clear:both;">
<input type="hidden" value="1" name='isactive' id='chkisactive'/>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal"></td>
	<td class="tal">卡号</td>
    <td class="tal">密码</td>
    <td class="tal" width="8%">面值</td>
    <td class="tal" width="8%">激活？</td>
    <td class="tal" width="8%">充值？</td>
	<td class="tal" width="15%">充值日期</td>
    <td class="tal" width="20%">有效期</td>
    <td class="tal" width="12%">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
	<td class="tal"><span class="fourm_name"><!--{$item.cardnum}--></span></td>
    <td class="tal"><!--{$item.cardpwd}--></td>
    <td class="tal"><!--{$item.fee}--> 元</td>
    <td class="tal"><!--{if $item.isactive==1}-->已激活<!--{elseif $item.isactive==10}-->已删除<!--{else}-->未激活<!--{/if}--></td>
    <td><!--{if $item.isuse==1}-->已充值<!--{else}-->未充值<!--{/if}--></td>
    <td><!--{$item.usedatetime}--></td>
    <td><!--{$item.velidatetime}--></td>
    <td><!--{if $item.isactive!=1}--> <a class="fourm-two" href="<!--{$pageurl}-->/check.do?isactive=1&id=<!--{$item.id}-->" target="post_main">激活</a> | <!--{/if}--><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&page=<!--{$page}-->">编辑</a> | <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
  </tr>
  <!--{/foreach}-->
</table>
<div style="float:left;width:365px;margin-top:8px;"><input type="button" onclick="checkAll(true);" value="全选" class="btn"/> <input type="button" onclick="checkAll(false);" value="反选" class="btn"/> <!--{if $s.isactive=='0'}--><input type="submit" value="激活" onclick="if(confirm('确定激活选中的礼品卡吗?')){document.getElementById('chkisactive').value='1';return true}else{return false}" class="btn" /> <!--{/if}--><!--{if $s.isactive==1}--><input type="submit" value="取消激活" onclick="if(confirm('确定取消激活选中的礼品卡吗?')){document.getElementById('chkisactive').value='0';return true}else{return false}" class="btn" /> <!--{/if}--><!--{if $s.isactive!=10}--><input type="submit" value="删 除" onclick="if(confirm('确定删除吗?')){document.getElementById('chkisactive').value='10';return true}else{return false}" class="btn" /><!--{else}--><input type="submit" value="恢 复" onclick="if(confirm('确定要恢复选中已删除的礼品卡吗?恢复后需重新激活才能使用。')){document.getElementById('chkisactive').value='0';return true}else{return false}" class="btn" /><!--{/if}--></div><div class="rpage"><!--{include file=page.tpl}--><!--{if $rows}--><a href="<!--{$excelurl}-->" class="btn2"><span>导出</span></a><!--{/if}--></div>
</div>
</form>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
