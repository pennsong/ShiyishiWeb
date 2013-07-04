<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/box.js"></script>

		<div id="content" class="container_24">
        	<div class="grid_24">
            	<div id="hrlogin">
                	<div id="hrloginleft">
                    	<ul>
                        	<li>联系我们请拨打:<br />010-59181986</li>
                        </ul>
                    </div>
                    <div id="hrloginright">
                    	<h2></h2>
						<form method="post" id="regForm" name="regForm" action="/enterp/register/save.do" enctype="multipart/form-data" >
                        <ul>
                       	    <li><span class="hrlogintext">单位名称：</span><input class="k" name="info[company]" id="company" type="text" alt="单位名称:空"/><span class="red bold">（必填）</span><span id="showResult_company"></span></li>
                       	    <li><span class="hrlogintext">联系人：</span><input class="k" name="info[contact]" id="contact"  type="text" alt="联系人:空"/><span class="red bold">（必填）</span><span id="showResult_contact"></span></li>
                        	<li><span class="hrlogintext">固定电话：</span><input class="k" name="info[tel]" id="tel"  type="text" alt="固定电话:空/电话" /><span class="red bold">（必填）</span><span id="showResult_tel"></span></li>
                        	<li><span class="hrlogintext">手机：</span><input class="k" name="info[mobile]"  id="mobile" type="text" alt="手机:空/手机" /><span class="red bold">（必填）</span><span id="showResult_mobile"></span></li>
                        	<li><span class="hrlogintext">邮箱：</span><input class="k" name="info[email]"  id="email" type="text" alt="邮箱:空/邮箱" /><span class="red bold">（必填）</span><span id="showResult_email"></span></li>
                        	<li><span class="hrlogintext">证件上传：</span><input name="info[dtype]" type="radio" checked ="checked" value="0"  onclick="$('#upfile').show();" /> 扫描件 <input name="info[dtype]" type="radio" value="1" onclick="$('#upfile').hide();" /> 传真件 </li>
                        	<li id="upfile"><span class="hrlogintext">&nbsp;</span>
							<!--<input class="file" name="file" id="file" type="file"  />-->
							<input name="info[durl]" id="photo" type="hidden" value="<!--{$info.logo}-->"/>
							<iframe src="<!--{$pageurl}-->/upload.do" id="upload_img" name="upload_img" scrolling="no" width="300" height="30" ></iframe><br>
								<span id="image_list">
								</span>
							</li>
                        	<li style="clear:both;"><span class="hrlogintext">&nbsp;</span><span class="hui">企业法人营业执照副本（带年检章）、特殊行业的用户需加贴"特殊行业许可证书</span></li>
                        	<li><span class="hrlogintext">&nbsp;</span>传真号码：010-59181984</li>
                        	<li><span class="hrlogintext">&nbsp;</span><span class="hui">企业法人营业执照副本（带年检章）、特殊行业的用户需加贴"特殊行业许可证书</span></li>
                        	<li><span class="hrlogintext">&nbsp;</span><input type="checkbox" checked="checked" id="termV"/>
          我已阅读并接受视一视<a onclick="showTerm();" style="cursor:pointer;">企业用户协议</a></li>
                            <li><span class="hrlogintext">&nbsp;</span><input type="image" onclick="return submitCheck();" src="/images/hrloginbutton.gif" /></li>
                        </ul>
						</form>
                    </div>
                    <div class="clearfix"></div>
                </div>
        	</div>
<script type="text/javascript">
function submitCheck(){
	if(fm_chk(oo('regForm'))){
		return true;
	}
	return false;
}
function showTerm(){
	//$("<div id='MaskLyer'/>").appendTo("body").css({width:$(window).width()-5,height:500});
	var h = 462;//$(window).height();
	var w = 580;//h*4.4/3;
	$.box.show('',"<!--{$baseurl}-->/enterp/term.html",w,h,5);
	if ($.browser.msie && $.browser.version<7) $("select").hide();
}

function delupimg(i){
	if(i<0){
		return false;
	}
	var photo = $('#photo').val();
	$.post("<!--{$pageurl}-->/del.do",{"i":i,"photo": photo},function(data){
		if(data=='0'){
			alert("非法操作！");
		}else{
			var img = Array();
			if(data.indexOf("|||")==-1){
				img[0] = data;
			}else{
				img = data.split("|||");
			}
			var img_list = '';
			for(var n=0;n<img.length;n++){
				img_list += '<div class="up_img"><img  src="<!--{$img_domain}-->'+img[n]+'"/><div><a href="javascript:{}" onclick="delupimg('+n+');">删除</a></div></div>';
			}
			$('#photo').val(data);
			$('#image_list').html(img_list);
			$("iframe")[0].contentWindow.document.getElementById("up_image").value = data;
			$("iframe")[0].contentWindow.document.getElementById("up_num").value = img.length;
			if(img.length<4)
				$("iframe")[0].contentWindow.document.getElementById("upload").disabled=false;
		}
	});	
	//getIframe("upload_img").getElementById("ooxx").style.backgroundColor="#f00"
}
</script>
<!--{include file="include/footer.tpl"}-->
