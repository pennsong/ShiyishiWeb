<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
		<div id="" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 职位管理 - 录取确认</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei">
                		<div id="hrzhiweimain">
							<form id="regForm" name="regForm"  method="post" action="/enterp/resume/admitdo.do"  onsubmit="return confirm('确定该应聘者已经被吗？')">
                        	<h3>被录取详细信息</h3>
								<input  name="info[rid]" type="hidden" value="<!--{$info.id}-->" />
								 <input type="hidden" name="info[cid]"  value="<!--{$logininfo.uid}-->" />
								 <input type="hidden" name="info[uid]"  value="<!--{$info.uid}-->" />
								 <input type="hidden" name="info[name]"  value="<!--{$info.uname}-->" />
								 <input type="hidden" name="info[personid]"  value="<!--{$info.idcard}-->" />
                        	<ul>
                                <li><span class="glogintext" style="float:none;margin-left:30px;">应聘者姓名：</span><!--{$info.uname}--></li>
                                <li><span class="glogintext" style="float:none;margin-left:30px;">应聘者身份证号：</span><!--{$info.idcard}--></li>
                                <li><input type="submit" value="确定"  style="float:none;margin-left:30px;" /></li>

                            </ul>
							</form>
                        </div>
                    
                        <div class="clearfix"></div>
                    </div>
                </div>
        	</div>

<script type="text/javascript">



function setCity(_o,_tid){
	var pid = _o.value;
	var tobj = document.getElementById(_tid);
	tobj.options.length = 0;
	if(!pid || pid<=0){
		alert("请选择省份！！！");
		$("#live_gnd_c").hide();
	}else{
		$.ajax({
			type:"POST",
			url:"/ajax/getcitysbypid.do",
			dataType:"html",
			data:'pid='+pid,
			success:function(msg)
			{
				if(!msg){
					$("#_tid").hide();
				}else{
					msg = msg.split(":");
					if(msg.length>0){
						$("#dcity").show();
						$("#live_gnd_c").show();
						for(var i=0;i<msg.length;i++){
							var val = msg[i].split("|");
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}
		});
	}
}

function setSubData(_o,_t){
	var pid = _o.value;
	var _tid = _o.id.replace('_o','_t')
	var tobj = document.getElementById(_tid);
	$("#"+_tid).hide();
	tobj.options.length = 0;
	if(!pid || pid<=0){
		alert("请选择有效信息！！！");
	}else{
		$.ajax({
			type:"POST",
			url:"/ajax/getsubdatabypid.do",
			dataType:"html",
			data:'rtype=cn&type='+_t+'&pid='+pid,
			success:function(msg)
			{
				if(msg){
					msg = msg.split(":");
					if(msg.length>0){
						$("#"+_tid).show();
						for(var i=0;i<msg.length;i++){
							var val = msg[i].split("|");
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}
		});
	}
}

function submitCheck(){
	var str = '<img src="/images/no.jpg"><font color="red"> 该项目未选择</fonts>';
	//alert($('#live').val());
	//return false;
	if($('#live').val() == 0){
		$('#showResult_live_gnd_c').html(str);
		return false;
	}else{
		$('#showResult_live_gnd_c').html('');
	}

//	if($('#scid').val() == 0){
//		//$('#showResult_scid').html(str);
//		//return false;
//	}else{
//		$('#showResult_scid').html('');
//	}
	if( document.getElementById('live_gnd_c').style.display=="none" ){
		$('#showResult_live_gnd_c').html(str);
		return false;
	}

	if( document.getElementById('funtype_t').style.display=="none" ){
		$('#showResult_funtype_t').html(str);
		return false;
	}

	if( document.getElementById('dustrytype_t').style.display=="none" ){
		$('#showResult_dustrytype_t').html(str);
		return false;
	}

	if($('#funtype_o').val() == 0){
		$('#showResult_funtype_t').html(str);
		return false;
	}else{
		$('#showResult_funtype_t').html('');
	}

	if($('#company_type').val() == 0){
		$('#showResult_company_type').html(str);
		return false;
	}else{
		$('#showResult_company_type').html('');
	}

	if($('#company_scale').val() == 0){
		$('#showResult_company_scale').html(str);
		return false;
	}else{
		$('#showResult_company_scale').html('');
	}

//	if($('#company_properties').val() == 0){
//		$('#showResult_company_properties').html(str);
//		return false;
//	}else{
//		$('#showResult_company_properties').html('');
//	}

	if($('#dustrytype_o').val() == 0){
		$('#showResult_dustrytype_t').html(str);
		return false;
	}else{
		$('#showResult_dustrytype_t').html('');
	}

	if($('#money').val() == 0){
		$('#showResult_money').html(str);
		return false;
	}else{
		$('#showResult_money').html('');
	}

	if($('#language').val() == 0){
		$('#showResult_language').html(str);
		return false;
	}else{
		$('#showResult_language').html('');
	}

	if($('#degree').val() == 0){
		$('#showResult_degree').html(str);
		return false;
	}else{
		$('#showResult_degree').html('');
	}

	return true;
}
</script>
<!--{include file="include/footer.tpl"}-->