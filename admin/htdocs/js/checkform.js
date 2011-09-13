function fm_ini(){
	var fm,i,j;
	for(i=0;i<document.forms.length;i++){
		fm=document.forms[i];
		for(j=0;j<fm.length;j++){
			if((fm[j].alt+"").indexOf(":")==-1)
				continue;
			fm[j].onblur=function(){
				var ck = tx_chk(this);
				if(ck===true){
					success(this);
				}else if(ck===false){
					error(this);
				}else{
					isuccess(this);
				}
			}
			fm[j].onfocus=function(){
				if(this.id=='vdcode'){
					if(oo('vdimgck').style.display=='none'){
						oo('vdimgck').style.display='';
						oo('vdimgck').src = '/virfycode.do?random='+Math.random();
					}
				}else if(this.id=='vdcode1'){
					if(oo('lvdimgck').style.display=='none'){
						oo('lvdimgck').style.display='';
						oo('lvdimgck').src = '/virfycode.do?random='+Math.random();
					}
				}
				this.style.borderTop='1px solid #AFAFAF';
				this.style.borderLeft='1px solid #E2E2E4';
				this.style.borderBottom='1px solid #E8E9ED';
				this.style.borderRight='1px solid #DFE1E0';
				this.style.background='#FAFBFD';
				}
		}
	}
}
function error(obj){
	obj.style.borderTop='1px solid #FF0000'
	obj.style.borderLeft='1px solid #FF0000'
	obj.style.borderBottom='1px solid #FF0000'
	obj.style.borderRight='1px solid #FF0000'
	obj.style.background = '#F7AD16';
	if(oo("showResult_"+obj.id)){
		oo("showResult_"+obj.id).style.display = '';
		oo("showResult_"+obj.id).style.color = "red";
	}
}
function isuccess(obj){
	obj.style.borderTop='1px solid #AFAFAF'
	obj.style.borderLeft='1px solid #E2E2E4'
	obj.style.borderBottom='1px solid #E8E9ED'
	obj.style.borderRight='1px solid #DFE1E0'
	if(oo("showResult_"+obj.id)){
		oo("showResult_"+obj.id).style.display = '';
		oo("showResult_"+obj.id).style.color="#000000";
		oo("showResult_"+obj.id).innerHTML='可继续...';
	}
}
function success(obj){
	obj.style.borderTop='1px solid #AFAFAF'
	obj.style.borderLeft='1px solid #E2E2E4'
	obj.style.borderBottom='1px solid #E8E9ED'
	obj.style.borderRight='1px solid #DFE1E0'
	if(oo("showResult_"+obj.id)){
		oo("showResult_"+obj.id).style.display = '';
		oo("showResult_"+obj.id).style.color="#729500";
		oo("showResult_"+obj.id).innerHTML='<img src="/images/yes.jpg">';
	}
}
function successtrag(obj){
	obj.style.borderTop='0px'
	obj.style.borderLeft='0px'
	obj.style.borderBottom='0px'
	obj.style.borderRight='0px'
	obj.style.background = '#FFFFFF';
	if(oo("showResult_"+obj.id)){
		oo("showResult_"+obj.id).style.display = '';
		oo("showResult_"+obj.id).style.color="#729500";
	}
}
function fm_chk(fm){
	var isPass=true;
	for(var i=0;i<fm.length;i++){
		if((fm[i].alt+"").indexOf(":")==-1)
			continue;
		if(!tx_chk(fm[i])){
			isPass=false;
			error(fm[i]);
		}
	}
	if(isPass){
		return true;
	}else{
		alert("您填写的信息有误，请根据页面提示文字更改！");
		return false;
	}
}
function tx_chk(obj){
	var name,key,val=obj.value,oShow=oo("showResult_"+obj.id);
	name=obj.alt.slice(0,obj.alt.indexOf(":"));
	key="/"+obj.alt.slice(obj.alt.indexOf(":")+1)+"/"

	if(obj.style.display=='none'){
		return true;
	}

	if((key.indexOf("/空/")>-1||key.indexOf("/无内容/")>-1)&&val==""){
		oShow.innerHTML = errorMsg(name+"不能为空");
		return false;
	}
	if(key.indexOf("/任选@")>-1){
		var names = key.slice(key.indexOf("@")+1,-1).split("#");
		var tname = names[0];
		if(names[1].indexOf("/")>-1)names[1] = names[1].slice(0,names[1].indexOf("/"))
		var parm = names[1].split("-");
		var ret = false;
		for(var i=0;i<parm.length;i++){
			if(oo(parm[i]).value){
				ret = true;
			}
			success(oo(parm[i]));
		}
		if(ret==false){
			for(var i=0;i<parm.length;i++){
				error(oo(parm[i]));
				oo("showResult_"+parm[i]).innerHTML=errorMsg(tname+":选填一项");
			}
		}
		if(!val)return ret;
	}
	if(key.indexOf("/依赖!")>-1){
		var names = key.slice(key.indexOf("!")+1,-1).split("#");
		var tname = names[0];
		if(names[1].indexOf("/")>-1)names[1] = names[1].slice(0,names[1].indexOf("/"))
		var parm = names[1].split("-");
		var ret = false;
		for(var i=0;i<parm.length;i++){
			if(tname=='存'){
				if(oo(parm[i])){
					ret = true;
					break;
				}
			} else if(tname=='值'){
				if(oo(parm[i]).value){
					ret = true;
					break;
				}
			} else if(tname=='显'){
				if(oo(parm[i])&&oo(parm[i]).style.display!='none'){
					ret = true;
					break;
				}
			} else if(tname=='显值'){
				if(oo(parm[i])&&oo(parm[i]).style.display!='none'&&oo(parm[i]).value){
					ret = true;
					break;
				}
			}
		}
		if(ret==false){
			return '1';
		}else if(val==""){
			oShow.innerHTML = errorMsg(name+"不能为空");
			return false;
		}
	}
	if(key.indexOf("/同意@")>-1){
		var showid = key.slice(key.indexOf("@")+1,-1);
		if(obj.checked==false){
			oo("showResult_"+showid).innerHTML=errorMsg("必须同意"+name+"才能继续！");
			error(oo(showid));
			return false;
		}else{
			oo("showResult_"+showid).innerHTML='<img src="/images/yes.jpg">';
			successtrag(oo(showid));
		}
		return '1';
	}
	if(key.indexOf("/必选@")>-1){
		var showid = key.slice(key.indexOf("@")+1,-1);
		var ol=obj.form[obj.name],isSel=false
		for(var i=0;i<ol.length;i++){
			if(ol[i].checked)
				isSel=true
		}
		if(!isSel){
			oo("showResult_"+showid).innerHTML=errorMsg(name+"必须选择");
			error(oo(showid));
		}else{
			oo("showResult_"+showid).innerHTML='<img src="/images/yes.jpg">';
			successtrag(oo(showid));
		}
		return '1';
	}
	if(!val){
		return '1';
	}
	if(key.indexOf("/长度@")>-1){
		var parm = key.slice(key.indexOf("@")+1,-1).split("-");
		var parm1 = 0;
		if(parm.length==1){
			if(parm[0].indexOf("/")>0){
				parm[0] = parm[0].slice(0,parm[0].indexOf("/"));
			}
			if(strLen(val)!=parm[0]){
				oShow.innerHTML=errorMsg(name+"字符长度必须"+parm[0]+"位");
				return false;
			}
		}else{
			if(parm[1].indexOf("/")>0){
				parm1 = parm[1].slice(0,parm[1].indexOf("/"));
			}else{
				parm1 = parm[1];
			}
			if(strLen(val)<parm[0]||strLen(val)>parm1){
				oShow.innerHTML=errorMsg("长度必须"+parm[0]+"-"+parm1+"位");
				return false;
			}
		}
	}
	if(key.indexOf("/文件@")>-1){
		var parm = key.slice(key.indexOf("@")+1,-1).split(":");
		var n = parm.length-1;
		var partten = qtext = '';
		for(var i=0;i<=n;i++){
			if(i==n){
				if(parm[i].indexOf("/")>0){
					parm[i] = parm[i].slice(0,parm[i].indexOf("/"));
				}
				partten += '(:?'+parm[i]+')';
			}else{
				partten += '(:?'+parm[i]+')|';
			}
			qtext += " ."+parm[i];
		}
		//!(/(:?jpg)|(:?gif)|(:?bmp)$/i.test(sImgName))
		partten = new RegExp(partten);
		if (!(partten.test(val))) {
			oShow.innerHTML=errorMsg("文件类型只允许 "+qtext+"");
			return false;
		}
	}
	if(key.indexOf("/怪字符/")>-1&&(/>|<|,|\[|\]|\{|\}|\?|\/|\+|=|\||\'|\\|\"|:|;|\~|\!|\@|\#|\*|\$|\%|\^|\&|\(|\)|`/i).test(val)){
		oShow.innerHTML=errorMsg("请勿使用特殊字符");
		return false;
	}
	if(key.indexOf("/有空格/")>-1&&val.indexOf(" ")>-1){
		oShow.innerHTML=errorMsg("不能包含空格符");
		return false;
	}
	if(key.indexOf("/全数字/")>-1&&val!=""&&!isNaN(val)){
		oShow.innerHTML=errorMsg("不可以全是数字");
		return false;
	}
	if(key.indexOf("/有大写/")>-1&&/[A-Z]/.test(val)){
		oShow.innerHTML=errorMsg("不能有大写字母");
		return false;
	}
	if(key.indexOf("/英文/")>-1&&!/^[a-zA-Z_]*$/.test(val)){
		oShow.innerHTML=errorMsg("只允许输入英文");
		oShow.style.display="";
		return false;
	}
	if(key.indexOf("/数字/")>-1&&!/^[0-9_]*$/.test(val)){
		oShow.innerHTML=errorMsg("只允许输入数字");
		oShow.style.display="";
		return false;
	}
	if(key.indexOf("/英文数字/")>-1&&!/^[a-zA-Z0-9_]*$/.test(val)){
		oShow.innerHTML=errorMsg("只允许输入英文和数字");
		oShow.style.display="";
		return false;
	}
	if(key.indexOf("/全汉字/")>-1){
		var reg=/[\u4E00-\u9FA5]/g;
		if (!reg.test(val)){
			oShow.innerHTML=errorMsg("只允许输入汉字");
			return false;
		}
	}
	if(key.indexOf("/有全角/")>-1&&/[ａ-ｚ０-９]/.test(val)){
		oShow.innerHTML=errorMsg("不能有全角字符");
		return false;
	}
	if(key.indexOf("/有汉字/")>-1&&escape(val).indexOf("%u")>-1){
		oShow.innerHTML=errorMsg("不允许输入汉字");
		return false;
	}
	if(key.indexOf("/下划线/")>-1&&val.slice(val.length-1)=="_"){
		oShow.innerHTML=errorMsg("下划线不能在最后");
		return false;
	}
	if(key.indexOf("/确认@")>-1){
		var tmpid = key.slice(key.indexOf("@")+1,-1);
		if(oo(tmpid).value!=val){
			oShow.innerHTML = errorMsg(name+"不一致");
			return false;
		}
	}
	if(key.indexOf("/邮件/")>-1&&!(/^[a-z0-9_@\.-]+@([a-z0-9_-]+\.)+[a-z0-9_-]{2,3}$/.test(val))){
		oShow.innerHTML=errorMsg("邮件格式不正确");
		return false;
	}

	if(key.indexOf("/电话/")>-1&&!(/^(((\d{3}-)(\d{8})|(\d{4}-)(\d{7})))+(-\d{1,6})?$/.test(val))){
		oShow.innerHTML=errorMsg("电话格式不正确，正确格式如:010-89738888-101");
		return false;
	}
	if(key.indexOf("/手机/")>-1&&!(/^(((13[0-9]{1})|159|(15[0-9]{1}))+\d{8})$/.test(val))){
		oShow.innerHTML=errorMsg("手机格式不正确，正确格式如:13810888888");
		return false;
	}

	if(key.indexOf("/网址/")>-1&&!IsURL(val)){
		oShow.innerHTML=errorMsg("网址格式不正确，正确格式如:http://www.huangye88.com");
		return false;
	}
	if(key.indexOf("/请选择/")>-1&&val==""){
		oShow.innerHTML=errorMsg("请选择"+name);
		return false;
	}
	if(key.indexOf("/验证^")>-1){
		var ckid = key.slice(key.indexOf("^")+1,-1);
		if(checkInfo(ckid,val).indexOf("success")<0){
			oShow.innerHTML=errorMsg(name+"已经存在，请重新输入！");
			return false;
		}
	}
	return true;
}
function errorMsg(msg){
	return '<img src="/images/no.jpg"> '+msg;
}
function checkInfo(key,val){
	var url = window.location.href;
	if(url.indexOf("?")>-1){
		url = url + "&"+key+"="+val;
	}else{
		url = url + "?"+key+"="+val;
	}
	var x = new Ajax();
	return x.get1(url);
}

function strLen(key){
	var l=escape(key),len
	len=l.length-(l.length-l.replace(/\%u/g,"u").length)*4
	l=l.replace(/\%u/g,"uu")
	len=len-(l.length-l.replace(/\%/g,"").length)*2
	return len
}

function IsURL(str_url){ 
	var strRegex = "^((https|http|ftp|rtsp|mms)?://)"  
        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@  
        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184  
        + "|" // 允许IP和DOMAIN（域名） 
        + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.  
        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名  
        + "[a-z]{2,6})" // first level domain- .com or .museum  
        + "(:[0-9]{1,4})?" // 端口- :80  
        + "((/?)|" // a slash isn't required if there is no file name  
        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";  
	var re=new RegExp(strRegex);  
	if (re.test(str_url)){ 
		return (true);  
	}else{  
		return (false);  
	} 
} 
function oo(obj){
	return document.getElementById(obj);
}
onload = function(){fm_ini();}