<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<title>Header</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="javascript" type="text/javascript" src="<!--{$baseurl}-->/js/ajax.js"></script>
<script type="text/javascript">
var now = new Date();
var defaultimg = "/images/none.gif";

function $(id) {
    return document.getElementById(id);
}
function startProgress()
{
    $("progresszone").style.display="block";
    $("progresszone_img").className="fileimggray";
    $("optionzone").innerHTML = "正在上传...";
	//setTimeout("runProgress(1)", 100);
}

function runProgress(loop){
    var url = "<!--{$pageurl}-->/ajax.do?do=getprogress&progress_key="+$('progress_key').value+"&loop="+loop;
    var x = new Ajax();
    var msg = x.get1(url);
    proNum=parseInt(msg);
    //alert(proNum);
    if(proNum>=0){
        $("progresszone").innerHTML = proNum+"%";
        if ( proNum < 100){
            if(proNum>0)loop = loop+1;
            setTimeout("runProgress('"+loop+"')", 100);
        }else{
            $("progresszone").innerHTML = "100%<br/>处理中..."
        }
    }else{
        $("forumdata").src = 'about:blank';
        if(proNum==-1){
            uploadError('文件大小超过了限制...');
        }
        else if(proNum==-2){
            uploadError('不允许上传的文件类型...');
        }
        else{
            uploadError('未知的错误...');
        }
    }
}

function reupload(i,id)
{
    if(confirm("你确定要删除该图片吗？")){
		$('upfileinput').outerHTML = $('upfileinput').outerHTML;
		$('upfileinput').value='';
		$("progresszone").style.display="block";
		$("progresszone_img").className="fileimggray";
		$("progresszone_img").src=defaultimg;
		$("progresszone").innerHTML="删除成功";
		$("optionzone").innerHTML = '<input type="button" value="上传图片">';
		successMsg("删除成功...");
    }
}

function uploadSuccess(_s,_b){
    if(parent.document.getElementById("smallimg")){
		parent.document.getElementById("smallimg").value = _s;
	}
	if(parent.document.getElementById("bigimg")){
		parent.document.getElementById("bigimg").value = _b;
	}
	$("optionzone").innerHTML = '<input type="button" value="更换图片">';
    $("progresszone").style.display="none";
    $("progresszone_img").className="fileimg";
    $("progresszone_img").src = _s;
    $('upfileinput').outerHTML = $('upfileinput').outerHTML;
    $('upfileinput').value='';
    successimg($('progresszone_img'));
    successMsg("上传成功...");
}
function uploadError(_msg){
    $('up_stat').value = 1;
    $("optionzone").innerHTML = '<input type="button" value="上传图片">';
    $('upfileinput').outerHTML = $('upfileinput').outerHTML;
    $('upfileinput').value='';
    $("progresszone").innerHTML = "失败";
    errorMsg(_msg);
    errorimg($('progresszone_img'));
}

function errorimg(obj){
    obj.style.borderTop='1px solid #FF0000'
    obj.style.borderLeft='1px solid #FF0000'
    obj.style.borderBottom='1px solid #FF0000'
    obj.style.borderRight='1px solid #FF0000'
}

function successimg(obj){
    obj.style.borderTop='1px solid #AFAFAF'
    obj.style.borderLeft='1px solid #E2E2E4'
    obj.style.borderBottom='1px solid #E8E9ED'
    obj.style.borderRight='1px solid #DFE1E0'
}

function errorMsg(msg){
    msg = '<img src="/images/no.jpg"> '+msg;
    parent.document.getElementById("showResult_uploadsimple").style.color = 'red';
    parent.document.getElementById("showResult_uploadsimple").innerHTML = msg;
}

function successMsg(msg){
    msg = '<img src="/images/yes.jpg"> '+msg;
    parent.document.getElementById("showResult_uploadsimple").style.color = 'green';
    parent.document.getElementById("showResult_uploadsimple").innerHTML = msg;
}

</script>
<style>
div.fileopt{float:left;width:100px;text-align:center;}
div.fileopt .progresszone{position:absolute;z-index:999;margin-left:10px;margin-top:40px;width:80px;text-align:center;display:none;color:red;}
img.fileimg{border:1px solid #AFAFAF;margin:10px;width:80px;height:80px;}
img.fileimggray{border:1px solid #AFAFAF;margin:10px;width:80px;height:80px;opacity:0.30;filter:alpha(opacity=30);}
img.fileimggray2{border:1px solid #AFAFAF;cursor:pointer;margin:10px;width:80px;height:80px;opacity:0.70;filter:alpha(opacity=70);}
div.optionzone{line-height:18px;color:green;}
div.optionzone input{height:22px;}
.upfileinput{position:absolute;top:100px;opacity:0;filter:alpha(opacity=0);left:15px;top:103px;width:30px;}
.c {clear:both;float:left;}
.fl {float:left;}
</style>
</head>
<body style="margin:0px;padding:0px;">
<div style="float:left">
  <div class="fileopt"><span id="progresszone" class="progresszone"></span><img id="progresszone_img" src="<!--{$smallimg|default:'/images/none.gif'}-->" class="<!--{if $smallimg}-->fileimg<!--{else}-->fileimggray<!--{/if}-->"><br/>
    <div id="optionzone" class="optionzone"><input type="button" value="<!--{if $smallimg}-->更换<!--{else}-->上传<!--{/if}-->图片"></div>
  </div>
</div>
<form action="<!--{$pageurl}-->/save.do" method="post" id="uploadForm" name="uploadForm" enctype="multipart/form-data" target="forumdata">
  <input type="hidden" name="APC_UPLOAD_PROGRESS" id="progress_key" value="<!--{$fid}-->"/>
  <input type="hidden" name="st" value="<!--{$st|default:'0'}-->"/>
  <input type="hidden" name="m_type" value="<!--{$type}-->"/>
  <input name="file" type="file" class="upfileinput" id="upfileinput" onchange="startProgress();$('uploadForm').submit();" size="1" hidefocus>
</form>
<iframe id="forumdata" name="forumdata" style="display:none;"></iframe>
</body>
</html>