<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<title>Header</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="javascript" type="text/javascript" src="<!--{$baseurl}-->/js/cookie.js"></script>
<script language="javascript" type="text/javascript" src="<!--{$baseurl}-->/js/ajax.js"></script>
<script type="text/javascript">
var userAgent = navigator.userAgent.toLowerCase();
var is_opera = userAgent.indexOf('opera') != -1 && opera.version();
var is_moz = (navigator.product == 'Gecko') && userAgent.substr(userAgent.indexOf('firefox') + 8, 3);
var is_ie = (userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5, 3);
var is_safari = (userAgent.indexOf('webkit') != -1 || userAgent.indexOf('safari') != -1);
var now = new Date();
var proNum=0;
var defaultimg = "/images/none.gif";
var itemid = <!--{$itemid}-->;
var vtype = '<!--{$type|default:"item"}-->';
var maxi = 7;
if(itemid){
    Cookie.set('tmp_up_'+vtype+'id',''+vtype+'id'+itemid,24);
}else if(!Cookie.get('tmp_up_'+vtype+'id')||Cookie.get('tmp_up_'+vtype+'id').indexOf(''+vtype+'id')>-1){
    Cookie.set('tmp_up_'+vtype+'id','tempid'+parseInt(10*Math.random()),24);
}

function $(id) {
    return document.getElementById(id);
}
function startProgress(i)
{
    $('up_stat').value = 0;
    filegoold($('upfileinput'));
    $("progresszone"+i).style.display="block";
    $("progresszone"+i+"_img").className="fileimggray";
    $("optionzone"+i).innerHTML = "正在上传...";
	//setTimeout("runProgress(1)", 100);
}

function runProgress(loop){
    var i = $('img_pos').value;
    var url = "<!--{$pageurl}-->/ajax.do?do=getprogress&progress_key="+$('progress_key').value+"&loop="+loop;
    var x = new Ajax();
    var msg = x.get1(url);
    proNum=parseInt(msg);
    //alert(proNum);
    if(proNum>=0){
        $("progresszone"+i).innerHTML = proNum+"%";
        if ( proNum < 100){
            if(proNum>0)loop = loop+1;
            setTimeout("runProgress('"+loop+"')", 100);
        }else{
            $("progresszone"+i).innerHTML = "100%<br/>处理中..."
        }
    }else{
        $("forumdata").src = 'about:blank';
        if(proNum==-1){
            uploadError('文件大小超过了限制...',i);
        }
        else if(proNum==-2){
            uploadError('不允许上传的文件类型...',i);
        }
        else{
            uploadError('未知的错误...',i);
        }
    }
}

function reupload(i,id)
{
    if(confirm("你确定要删除该图片吗？")){
        id = id ? parseInt(id) : 0;
        var fid = $("img_id_"+i).value;
        var url = "<!--{$pageurl}-->/ajax.do?do=remove&id="+fid+"&itemid="+id;
        var x = new Ajax();
        var msg = x.get1(url);
        if(msg=='success'){
            updatefids(fid);
			updateupzone(i);
            $('upfileinput').outerHTML = $('upfileinput').outerHTML;
            $('upfileinput').value='';
            $("progresszone"+i).style.display="block";
            $("progresszone"+i+"_img").className="fileimggray";
            $("progresszone"+i+"_img").src=defaultimg;
            $("progresszone"+i).innerHTML="删除成功";
            $("optionzone"+i).innerHTML = '<input type="button" onmouseover="filestyle($(\'upfileinput\'),'+i+')" value="上传图片">';
            $('up_stat').value = 1;
            Cookie.unset('item'+Cookie.get('tmp_up_'+vtype+'id')+'_'+i);
            var fids = parent.document.getElementById("file_ids").value.split(",").length;
            successMsg("删除成功...您已经上传"+(fids-1)+"张图片");
        }else{
            errorMsg('删除过程出现异常...');
        }
    }
}

function updatefids(fid){
    var fids = parent.document.getElementById("file_ids").value;
    var fids = fids.split(",");
    var newfids = '';
    for(var i=0;i<fids.length;i++){
        if(fids[i] && fids[i]!=fid){
            newfids += ","+fids[i];
        }
    }
    parent.document.getElementById("file_ids").value = newfids;
}

function updateupzone(_i){
    var fids = parent.upzone;
    var fids = fids.split(",");
    var newfids = '';
    for(var i=0;i<fids.length;i++){
        if(fids[i] && fids[i]!=_i){
            newfids += ","+fids[i];
        }
    }
    parent.upzone = newfids;
}

function uploadSuccess(_val,imgurl){
    var i = $('img_pos').value;
    parent.document.getElementById("file_ids").value += ","+_val;
	parent.upzone += ","+i;
    $("optionzone"+i).innerHTML = '<input type="hidden" id="img_id_'+i+'" value="'+_val+'"><input type="button" onclick="reupload('+i+');" value="删 除">';
    $("progresszone"+i).style.display="none";
    $("progresszone"+i+"_img").className="fileimg";
    $("progresszone"+i+"_img").src = imgurl;
    $('upfileinput').outerHTML = $('upfileinput').outerHTML;
    $('upfileinput').value='';
    successimg($('progresszone'+i+'_img'));
    var fids = parent.document.getElementById("file_ids").value.split(",").length;
	if(fids==2){
		if(!parent.document.getElementById('pic_id').value){
			parent.document.getElementById('pic_id').value = _val + ',' + $("progresszone"+i+"_img").src;
			parent.document.getElementById('p_thumb').src = $("progresszone"+i+"_img").src;
		}
	}
    successMsg("上传成功...已经上传了"+(fids-1)+"张图片");
    $('up_stat').value = 1;
    Cookie.set('item'+Cookie.get('tmp_up_'+vtype+'id')+'_'+i, _val+','+imgurl,2);
	setclicke(i,_val);
}
function uploadError(_msg){
    var i = $('img_pos').value;
    $('up_stat').value = 1;
    $("optionzone"+i).innerHTML = '<input type="button" onmouseover="filestyle($(\'upfileinput\'),'+i+')" value="上传图片">';
    $('upfileinput').outerHTML = $('upfileinput').outerHTML;
    $('upfileinput').value='';
    $("progresszone"+i).innerHTML = "失败";
    errorMsg(_msg);
    errorimg($('progresszone'+i+'_img'));
}

function setclicke(i,_fid){
	$("progresszone"+i+"_img").title = '设置该图为默认显示！';
	$("progresszone"+i+"_img").onclick = function(){
		parent.document.getElementById('pic_id').value = _fid + ',' + $("progresszone"+i+"_img").src;
		parent.document.getElementById('p_thumb').src = $("progresszone"+i+"_img").src;
	}
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
    parent.document.getElementById("showResult_upload").style.color = 'red';
    parent.document.getElementById("showResult_upload").innerHTML = msg;
}

function successMsg(msg){
    msg = '<img src="/images/yes.jpg"> '+msg;
    parent.document.getElementById("showResult_upload").style.color = 'green';
    parent.document.getElementById("showResult_upload").innerHTML = msg;
}

function getEvent(){   
    var e;
    if (window.event) {
         e = window.event;
    } else {
        var caller = getEvent.caller;
        if (caller.arguments[0] != undefined && caller.arguments[0].target) {
            e = caller.arguments[0];
        } else {
            e = caller.caller.arguments[0];
        }
    }
    return e;
}   

function filegoold(obj){
    var evt=getEvent();
    var element=evt.srcElement || evt.target;
    with(obj){
        if(is_ie)
            style.posLeft=800;
        else
            style.left="800px";
    }
}

function filestyle(obj,pos){
    if($('up_stat').value != 1)return false;
    var evt=getEvent();
    var element=evt.srcElement || evt.target;
	var bodyw = document.body.scrollWidth;
	var allw = parseInt((100*(pos))/bodyw);
	var extheight = 124*allw;
    with(obj){
        
        var x=(evt.x ? evt.x : evt.pageX)-offsetWidth/2
        if(x<element.offsetLeft)x=element.offsetLeft
        if(x>element.offsetLeft+element.offsetWidth-offsetWidth){
            if(is_ie=='6.0'||is_ie=='7.0')
                x=x+element.offsetWidth-offsetWidth;
            else
                x=element.offsetLeft+element.offsetWidth-offsetWidth;
        }
        if(is_ie){
            style.posTop=extheight+element.offsetTop
			style.posLeft=x;
        }else{
			style.top=(element.offsetTop)+"px";
			style.left=(x-40)+"px";
        }
    }
    $('img_pos').value = pos;
    $('progress_key').value = $('def_fid').value + now.getSeconds()*Math.random();
}

function AddNewOne(){
	var noteObj = $('addimgdiv');
	var newimg = '<div class="fileopt"><span id="progresszone'+maxi+'" class="progresszone"></span><img id="progresszone'+maxi+'_img" src="'+defaultimg+'" class="fileimggray"><br/><div id="optionzone'+maxi+'" class="optionzone"><input type="button" onmouseover="filestyle($(\'upfileinput\'),'+maxi+')" value="上传图片"></div></div>';
	var oSpan=document.createElement("div");
	noteObj.parentNode.insertBefore(oSpan, noteObj);
	oSpan.innerHTML = newimg;
	maxi++;
	var bodyw = document.body.scrollWidth;
	var allw = parseInt((100*(maxi))/bodyw);
	if(allw >0){
		parent.document.getElementById("uploadiframe").style.height = (130+allw*122)+'px';
	}
}

window.onload = function(){
    //ckkey = 'item<!--{$item.mid}-->_<!--{$key+1}-->';
    var filekey = '';
    var filesrc = '';
    var nosave = false;
    var j=1;
	for(var i=1;i<13;i++){
        filekey = vtype+itemid+'_'+i;
        filesrc = Cookie.get(filekey);
        nosave = false;
        if(!filesrc && itemid!=Cookie.get('tmp_up_'+vtype+'id')){
            filesrc = Cookie.get('item'+Cookie.get('tmp_up_'+vtype+'id')+'_'+i);
            nosave = true;
        }
        if(filesrc){
            if(j>6){
				AddNewOne();
			}
			filesrc = filesrc.split(","); 
            if(filesrc.length==2){
                $("optionzone"+j).innerHTML = '<input type="hidden" id="img_id_'+j+'" value="'+filesrc[0]+'"><input type="button" onclick="reupload('+j+','+itemid+');" value="删 除">';
                $("progresszone"+j).style.display="none";
                $("progresszone"+j+"_img").className="fileimg";
                $("progresszone"+j+"_img").src = 'http://img.piaochong.com'+filesrc[1];
                if(nosave){
                    parent.fileids += ","+filesrc[0];
                    $("progresszone"+j).style.display="block";
                    $("progresszone"+j+"_img").className="fileimggray2";
                    $("progresszone"+j).innerHTML = "未保存";
                }
				parent.upzone += ","+j;
                setclicke(j,filesrc[0]);
                j++;
            }
        }
    }
    parent.document.getElementById('file_ids').value = parent.fileids;
    var fids = parent.fileids.split(",").length;
    if(fids>0){
        parent.document.getElementById("showResult_upload").style.color = 'green';
        parent.document.getElementById("showResult_upload").innerHTML = "已经上传"+(fids-1)+"张图片...您还可继续上传其他图片";
    }
}
</script>
<style>
div.fileopt{float:left;width:100px;text-align:center;}
div.fileopt .progresszone{position:absolute;z-index:999;margin-left:10px;margin-top:40px;width:80px;text-align:center;display:none;color:red;}
img.fileimg{border:1px solid #AFAFAF;margin:10px;width:80px;height:80px;cursor:pointer;}
img.fileimggray{border:1px solid #AFAFAF;margin:10px;width:80px;height:80px;opacity:0.30;filter:alpha(opacity=30);}
img.fileimggray2{border:1px solid #AFAFAF;cursor:pointer;margin:10px;width:80px;height:80px;opacity:0.70;filter:alpha(opacity=70);}
div.optionzone{line-height:18px;color:green;}
div.optionzone input{height:22px;}
.upfileinput{position:absolute;top:100px;opacity:0;filter:alpha(opacity=0);width:30px;}
.c {clear:both;float:left;}
.fl {float:left;}
</style>
</head>
<body style="margin:0px;padding:0px;">
<div style="float:left">
  <div class="fileopt"><span id="progresszone1" class="progresszone"></span><img id="progresszone1_img" src="/images/none.gif" class="fileimggray"><br/>
    <div id="optionzone1" class="optionzone"><input type="button" onmouseover="filestyle($('upfileinput'),1)" value="上传图片"></div>
  </div>
</div>
<div style="float:left">
  <div class="fileopt"><span id="progresszone2" class="progresszone"></span><img id="progresszone2_img" src="/images/none.gif" class="fileimggray"><br/>
    <div id="optionzone2" class="optionzone"><input type="button" onmouseover="filestyle($('upfileinput'),2)" value="上传图片"></div>
  </div>
</div>
<div style="float:left">
  <div class="fileopt"><span id="progresszone3" class="progresszone"></span><img id="progresszone3_img" src="/images/none.gif" class="fileimggray"><br/>
    <div id="optionzone3" class="optionzone"><input type="button" onmouseover="filestyle($('upfileinput'),3)" value="上传图片"></div>
  </div>
</div>
<div style="float:left">
  <div class="fileopt"><span id="progresszone4" class="progresszone"></span><img id="progresszone4_img" src="/images/none.gif" class="fileimggray"><br/>
    <div id="optionzone4" class="optionzone"><input type="button" onmouseover="filestyle($('upfileinput'),4)" value="上传图片"></div>
  </div>
</div>
<div style="float:left">
  <div class="fileopt"><span id="progresszone5" class="progresszone"></span><img id="progresszone5_img" src="/images/none.gif" class="fileimggray"><br/>
    <div id="optionzone5" class="optionzone"><input type="button" onmouseover="filestyle($('upfileinput'),5)" value="上传图片"></div>
  </div>
</div>
<div style="float:left">
  <div class="fileopt"><span id="progresszone6" class="progresszone"></span><img id="progresszone6_img" src="/images/none.gif" class="fileimggray"><br/>
    <div id="optionzone6" class="optionzone"><input type="button" onmouseover="filestyle($('upfileinput'),6)" value="上传图片"></div>
  </div>
</div>
<div style="float:left" id="addimgdiv">
  <div class="fileopt"><img src="/images/addnew.gif" onclick="AddNewOne();" class="fileimg" style="cursor:pointer"><br/>
  </div>
</div>
<input type="hidden" id="up_stat" value="1"/><input type="hidden" id="img_pos" value="1"/><input type="hidden" id="def_fid" value="<!--{$fid}-->"/>
<form action="<!--{$pageurl}-->/save.do" method="post" id="uploadForm" name="uploadForm" enctype="multipart/form-data" target="forumdata">
  <input type="hidden" name="m_type" value="<!--{$type}-->"/>
  <input type="hidden" name="APC_UPLOAD_PROGRESS" id="progress_key" value="<!--{$fid}-->"/>
  <input name="file" type="file" class="upfileinput" id="upfileinput" onchange="startProgress($('img_pos').value);$('uploadForm').submit();" size="1" hidefocus>  
</form>
<iframe id="forumdata" name="forumdata" style="display:none;"></iframe>
</body>
</html>