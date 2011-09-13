<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>广告管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>广告修改</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加广告</span></a></li>
<!--{/if}-->
</ul>
<script type="text/javascript"> 
function showAttr(id) {
    $("tr").each(function(i){
        if(this.id.length>0 && (this.id==id||this.id.substr(0,id.length+1)==id+'_')) {
            this.style.display="";
        }
        if(this.id.length>0 && (this.id==id||this.id.substr(0,id.length+1)!=id+'_')) {
            this.style.display="none";
        }
    });
}
</script>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>广告设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
	<td class="td3" width="145">广告主题：</td>
	<td class="td4" ><input name="info[subject]" type="text" id="subject" value="<!--{$info.subject}-->" alt="标题:无内容" style="width:300px;"/><span id="showResult_subject"></span></td>
</tr>
<tr class="tr4">
	<td class="td3">投放位置:</td>
	<td class="td4" id="citybox">
	<input name="info[adplace]" type="text" id="adplace" value="<!--{$info.adplace}-->" alt="位置:无内容" style="width:200px;"/><span id="showResult_adplace">请仔细填写该广告的标识位，如首页的某个广告位，您可以填入“home1”</span>
	</td>
</tr>
<tr class="tr4">
	<td class="td3">所属城市:</td>
	<td class="td4" id="citybox">
	<!--{foreach from=$citys key=key item=item}-->
	<input name="info[cityids][]" type="checkbox" value="<!--{$item.id}-->" <!--{$item.checked}--> /><!--{$item.name}-->
	<!--{/foreach}-->
	</td>
</tr>
<tr class="tr4">
	<td class="td3">广告类型：</td>
	<td class="td4">
<div>
<input type="radio" name="info[adtype]" id="adtype_1" value="1" <!--{if $info.adtype==1}-->checked <!--{/if}-->onclick="showAttr('font');" /><label for="adtype_1">超链接</label>
<input type="radio" name="info[adtype]" id="adtype_2" value="2" <!--{if $info.adtype==2}-->checked <!--{/if}--> onclick="showAttr('img');" /><label for="adtype_2">图片</label>
<input type="radio" name="info[adtype]" id="adtype_3" value="3" <!--{if $info.adtype==3}-->checked <!--{/if}--> onclick="showAttr('flash');" /><label for="adtype_3">Flash</label>
<input type="radio" name="info[adtype]" id="adtype_4" value="4" <!--{if $info.adtype==4}-->checked <!--{/if}--> onclick="showAttr('html');" /><label for="adtype_4">html代码</label>
</div>
</td>
</tr>
<tr class="tr4">
	<td class="td3">有效期：</td>
	<td class="td4"><input type="tetx" name="info[begintime]" value="<!--{$info.begintime}-->" class="Wdate" onClick="WdatePicker()" style="width:120px;" />&nbsp;-&nbsp;<input type="tetx" name="info[endtime]" value="<!--{$info.endtime}-->"  class="Wdate" onClick="WdatePicker()" style="width:120px;"/>&nbsp;格式：2008-10-11，留空为长期有效。</td>
</tr>
<!--------------------------文字-------------------------->
<tr class="tr4" id="font_title"<!--{if $info.adtype!=1}--> style="display:none"<!--{/if}-->>
	<td class="td3">文字标题：</td>
	<td class="td4"><input name="info[content][font_title]" type="text" value="<!--{$info.content.font_title}-->" style="width:300px;" /></td>
</tr>
<tr class="tr4" id="font_src"<!--{if $info.adtype!=1}--> style="display:none"<!--{/if}-->>
	<td class="td3">文字大小：</td>
	<td class="td4"><input name="info[content][font_size]" type="text" value="<!--{$info.content.font_size}-->" />&nbsp;px</td>
</tr>
<tr class="tr4" id="font_href"<!--{if $info.adtype!=1}--> style="display:none"<!--{/if}-->>
	<td class="td3">文字连接：</td>
	<td class="td4"><input name="info[content][font_href]" type="text" value="<!--{$info.content.font_href}-->" style="width:300px;" /></td>
</tr>
<!--------------------------图片-------------------------->
<tr class="tr4" id="img_title"<!--{if $info.adtype!=2}--> style="display:none"<!--{/if}-->>
	<td class="td3">图片标题：</td>
	<td class="td4"><input name="info[content][img_title]" type="text" value="<!--{$info.content.img_title}-->" style="width:300px;" /></td>
</tr>
<tr class="tr4" id="img_src"<!--{if $info.adtype!=2}--> style="display:none"<!--{/if}-->>
	<td class="td3">图片地址：</td>
	<td class="td4"><input type="hidden" name="info[content][img_src]" id="bigimg" value="<!--{$info.content.img_src}-->" /><!--{$uploadsimplezone}--><br/><span id="showResult_uploadsimple">可以上传 GIF,JPG,PNG的图片；为了保证页面的美观性,请结合页面上传合适的图片，本图不做压缩处理</span></td>
</tr>
<tr class="tr4" id="img_size"<!--{if $info.adtype!=2}--> style="display:none"<!--{/if}-->>
	<td class="td3">图片尺寸(宽x高)：</td>
	<td class="td4"><input name="info[content][img_width]" type="text" value="<!--{$info.content.img_width}-->" />&nbsp;x&nbsp;<input name="info[content][img_height]" type="text" value="<!--{$info.content.img_height}-->" /></td>
</tr>
<tr class="tr4" id="img_href"<!--{if $info.adtype!=2}--> style="display:none"<!--{/if}-->>
	<td class="td3">图片连接：</td>
	<td class="td4"><input name="info[content][img_href]" type="text" value="<!--{$info.content.img_href}-->" style="width:300px;" /></td>
</tr>
<!--------------------------Flash-------------------------->
<tr class="tr4" id="flash_src"<!--{if $info.adtype!=3}--> style="display:none"<!--{/if}-->>
	<td class="td3">Flash地址：</td>
	<td class="td4"><input name="info[content][flash_src]" type="text" value="<!--{$info.content.flash_src}-->" style="width:300px;" /></td>
</tr>
<tr class="tr4" id="flash_size"<!--{if $info.adtype!=3}--> style="display:none"<!--{/if}-->>
	<td class="td3">Flash(宽x高)：</td>
	<td class="td4"><input name="info[content][flash_width]" type="text" value="<!--{$info.content.flash_width}-->" style="width:120px;" />&nbsp;x&nbsp;<input name="info[content][flash_height]" type="text" class="txtbox4" value="<!--{$info.content.flash_height}-->" style="width:120px;" /></td>
</tr>
<!--------------------------代码-------------------------->
<tr class="tr4" id="html_code"<!--{if $info.adtype!=4}--> style="display:none"<!--{/if}-->>
	<td class="td3">HTML代码：</td>
	<td class="td4"><textarea name="info[content][code]" rows="8" cols="65"><!--{$info.code}--></textarea></td>
</tr>
<tr class="tr4">
	<td class="td3">自定义属性：</td>
	<td class="td4"><input type="tetx" name="info[attr]" class="txtbox5"  value="<!--{$info.attr}-->" style="width:300px;" />&nbsp;限 10 字符。</td>
</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<script language="JavaScript">
onload = function(){fm_ini();}
</script>
<!--{include file=footer.tpl}-->