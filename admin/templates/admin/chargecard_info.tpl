<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<ul class="nav3">
  <li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>礼品卡管理</span></a></li>
  <!--{if $info.id}-->
  <li><a href="#" class="btn1"><span>礼品卡设置</span></a></li>
  <!--{else}-->
  <li><a href="#" class="btn1"><span>添加礼品卡</span></a></li>
  <!--{/if}-->
</ul>
<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
  <input type="hidden" name="formhash" value="<!--{formhash}-->" />
  <input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
  <h2>礼品卡设置</h2>
  <table cellspacing="0" cellpadding="0" width="100%">
    <!--{if $info.id}-->
    <tr class="tr4">
      <td class="td3" width="150">礼品卡号:</td>
      <td class="td4"><!--{$info.activecode}--></td>
    </tr>
    <!--{/if}-->
    <tr class="tr4">
      <td class="td3" width="150">有效期:</td>
      <td class="td4"><input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$info.startdatetime}-->" name="info[startdatetime]"/> ~ <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$info.enddatetime}-->" name="info[enddatetime]"/>  <!--{if $info.id}--><span style="color:red">原则上是不作修改</span><!--{/if}--></td>
    </tr>
	<tr class="tr4">
      <td class="td3" width="150">面值:</td>
      <td class="td4"><input id="fee" name="info[fee]" type="text" value="50" alt="面值:空/长度@1-3/数字"/> 
        <span id="showResult_fee"></span>面值为0-999元</td>
    </tr>
    <!--{if $info.id}-->
    <tr class="tr4">
      <td class="td3">是否激活:</td>
      <td class="td4"><input name='info[isactive]' type='radio' value="1" 
        <!--{if $info.status==1}-->
        checked="checked"
        <!--{/if}-->
        />激活 <input name='info[isactive]' type='radio' value="0" 
        <!--{if $info.status!=1}-->
        checked="checked"
        <!--{/if}-->
        />以后激活</td>
    </tr>
    <!--{else}-->
    <tr class="tr4">
      <td class="td3" width="150">此次生成的数量:</td>
      <td class="td4"><input id="nums" name="nums" type="text" value="50" alt="礼品卡数量:空/长度@1-3/数字"/> 
        <span id="showResult_nums"></span>每次最多可生成999个</td>
    </tr>
    <!--{/if}-->
  </table>
  <br />
  <div style="padding-left:70px;">
    <input type="button" value="返 回" onclick="history.go(-1)" class="btn" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="确 定" class="btn" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="重 置" class="btn" />
  </div>
</form>
<!--{include file=footer.tpl}-->
