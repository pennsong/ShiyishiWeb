<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
  <li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>页面管理</span></a></li>
  <!--{if $info}-->
  <li><a href="#" class="btn1"><span>页面设置</span></a></li>
  <!--{else}-->
  <li><a href="#" class="btn1"><span>添加页面</span></a></li>
  <!--{/if}-->
</ul>
<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
  <input type="hidden" name="formhash" value="<!--{formhash}-->" />
  <input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
  <h2>页面设置</h2>
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="tr4">
      <td class="td3" width="150">页面名:</td>
      <td class="td4"><input type='text' id="pagetitle" name='info[pagetitle]' value='<!--{$info.pagetitle}-->' alt="页面名:空" style="width:300px;"/>
        <span id="showResult_pagetitle"></span></td>
    </tr>
    <tr class="tr4">
      <td class="td3" width="150">文件名:</td>
      <td class="td4"><input id="pagename" name="info[pagename]" type="text" value="<!--{$info.pagename}-->" alt="文件名:空/长度@2-20/有汉字"/>
        <span id="showResult_pagename"></span></td>
    </tr>
    <tr class="tr4">
      <td class="td3" width="150">页面模版:</td>
      <td class="td4"><input id="template" name="info[template]" type="text" value="<!--{$info.template|default:'page_default.tpl'}-->" alt="模板:空/有汉字"/>
        <span id="showResult_template"></span></td>
    </tr>
    <tr class="tr4">
      <td class="td3">状态:</td>
      <td class="td4"><input name='info[status]' type='radio' value="show" 
        <!--{if $info.status=='show'}-->
        checked="checked"
        <!--{/if}-->
        />有效 <input name='info[status]' type='radio' value="hide" 
        <!--{if $info.status=='hide'}-->
        checked="checked"
        <!--{/if}-->
        />无效</td>
    </tr>
    <tr class="tr4">
      <td class="td3">页面内容:</td>
      <td class="td4"><!--{$info.content}--></td>
    </tr>
  </table>
  <br />
  <div style="padding-left:70px;">
    <input type="button" value="返 回" onclick="history.go(-1)" class="btn" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="保 存" class="btn" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="重 置" class="btn" />
  </div>
</form>
<script language="JavaScript">
onload = function(){fm_ini();}
</script>
<!--{include file=footer.tpl}-->
