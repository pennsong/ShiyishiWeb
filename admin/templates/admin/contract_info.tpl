<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<form id="infoForm" name="sForm" action="<!--{$baseurl}-->/admin/contract/save.do" method="post">
  <input type="hidden" name="formhash" value="<!--{formhash}-->" />
  <input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
  <input type="hidden" name="info[createdate]" id="info[createdate]" value="" />
  <input type="hidden" name="postaction" id="postaction" value="save" />
  <table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
      <td class="td33" width="80">合同编号:</td>
      <td class="td4">
        <input id="code" name="info[code]" type="text" value="<!--{$info.code}-->" style="width:150px;" alt="合同编号:无内容" />
        <span id="showResult_code"></span></td>
    </tr>
    <tr class="tr4">
      <td class="td3">签署公司:</td>
      <td class="td4">
		<select name="info[uid]" >
			<option value="0">请选择</option>
		 <!--{foreach from=$company item=item}-->
			<option  <!--{if $info.uid==$item.id}--> selected<!--{/if}--> value="<!--{$item.id}-->"><!--{$item.company}--></option>
		<!--{/foreach}-->
		</select>
		</td>
    </tr>
	<tr class="tr4">
      <td class="td33">文字简历下载总量:</td>
      <td class="td4"><input id="wordall" name="info[wordall]" type="text" value="<!--{$info.wordall}-->" style="width:150px;" alt="文字简历下载总量:无内容" />
        <span id="showResult_wordall"></span></td>
    </tr>
	<!--{if $info.word}-->
	<tr class="tr4">
      <td class="td33">文字简历剩余下载量:</td>
      <td class="td4"><input id="word" name="info[word]" type="text" value="<!--{$info.word}-->" style="width:150px;"  alt="文字简历剩余下载量:无内容"/>
        <span id="showResult_word"></span></td>
    </tr>
	<!--{/if}-->
	<tr class="tr4">
      <td class="td33">视频简历下载总量:</td>
      <td class="td4"><input id="videoall" name="info[videoall]" type="text" value="<!--{$info.videoall}-->" style="width:150px;" alt="视频简历下载总量:无内容" />
        <span id="showResult_videoall"></span></td>
    </tr>
	<!--{if $info.video}-->
	<tr class="tr4">
      <td class="td33">视频简历剩余下载量:</td>
      <td class="td4"><input id="video" name="info[video]" type="text" value="<!--{$info.video}-->" style="width:150px;"  alt="视频简历剩余下载量:无内容"/>
        <span id="showResult_video"></span></td>
    </tr>
	<!--{/if}-->

	<tr class="tr4">
      <td class="td33">合同开始时间:</td>
      <td class="td4"><input id="startdate" name="info[startdate]" type="text" value="<!--{$info.startdate}-->" style="width:150px;" onClick="WdatePicker()" alt="合同开始时间:无内容"/>
        <span id="showResult_startdate"></span></td>
    </tr>

	<tr class="tr4">
      <td class="td3">合同开始结束:</td>
      <td class="td4"><input id="enddate" name="info[enddate]" type="text" value="<!--{$info.enddate}-->" style="width:150px;" onClick="WdatePicker()" alt="同开始结束:无内容"/>
        <span id="showResult_enddate"></span></td>
    </tr>
  </table>
  <br />
  <div style="margin-left:120px;">
    <input type="button" value="保 存" class="btn" onclick="submitCheck(1);" />
  </div>
</form>
<script language="JavaScript">

function submitCheck(v)
{	
	var fm = oo('infoForm');
	if(fm_chk(fm)){
		if(v==2)oo('postaction').value = 'saveback';
		fm.submit();
	}
}
</script>