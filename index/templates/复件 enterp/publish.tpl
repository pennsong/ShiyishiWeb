<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 职位管理 -发布新职位</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei">
                        <h2><!--{if !$jid}-->发布新<!--{else}-->修改<!--{/if}-->职位</h2>
						<!--{if !$jid}-->
                        <div id="hrzhiweilisttop">
                            使用模板：
                            <select name="subcompany" onchange="if(this.value)window.location.href='/enterp/publish_job/?tid='+this.value;">
								<option value="0">请选择职位模板</option>
									<!--{foreach from=$jobstemplate key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $tid==$item.id}--> selected<!--{/if}-->><!--{$item.title}--></option>
									<!--{/foreach}-->
							</select>
                        </div>
						<!--{/if}-->
                		<div id="hrzhiweimain">
							<form id="regForm" name="regForm"  method="post" action="/enterp/publish_job/save.do"  onsubmit="return submitCheck();">
                        	<h3>职位详细信息</h3>
                        	<ul>
							<input  name="info[id]" type="hidden" value="<!--{$info.id}-->" />
                                <li><span class="glogintext">职位名称：</span><input class="k" name="info[title]" id="title" type="text" value="<!--{$info.title}-->" alt="职位名称:空" /><span id="showResult_title"></span></li>
                                <li><span class="glogintext">工作地点：</span>
									  <select name="info[live_gnd_p]" onchange="setCity(this,'live_gnd_c');$('#showResult_live_gnd_c').html('');" id="live">
									  <option value="0">请选择</option>
										<!--{foreach from=$adatas key=key item=item}-->
										<option value="<!--{$item.id}-->"<!--{if $info.live_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
										<!--{/foreach}-->
									  </select>
									  <select name="info[live_gnd_c]" id="live_gnd_c" <!--{if !$aldatas}--> style="display:none;"<!--{/if}--> alt="现居住地:0">
										<!--{if $aldatas}-->
										<!--{foreach from=$aldatas key=key item=item}-->
										<option value="<!--{$item.id}-->"<!--{if $info.live_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
										<!--{/foreach}-->
										<!--{/if}-->
									  </select><span id="showResult_live_gnd_c"></span>
                                </li>

                                <li><span class="glogintext">分支机构：</span>
								  <select name="info[scid]"  id="scid"  alt="分支机构:空" onchange="$('#showResult_scid').html('');">
								  <option value="0">请选择</option>
									<!--{foreach from=$subcompany key=key item=item}-->
										<option value="<!--{$item.id}-->" <!--{if $info.scid==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
								  </select><span id="showResult_scid"></span>
                                </li>

                                <li><span class="glogintext">职位类别：</span>
								  <select name="info[funtype_1]" id="funtype_o" onchange="setSubData(this,'funtype');$('#showResult_funtype_t').html('');">
									<option value="">请选择</option>
									<!--{foreach from=$ftdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.funtype_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
								  </select>
								  <select name="info[funtype_2]" id="funtype_t"<!--{if !$subftdatas}-->  style="display:none;"<!--{/if}--> alt="职位类别:空">
									<!--{if $subftdatas}-->
									<!--{foreach from=$subftdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.funtype_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
									<!--{/if}-->
								  </select>
								  <span id="showResult_funtype_t"></span>
								  </li>

                                <li><span class="glogintext">公司类型：</span>
                                    <select name="info[company_type]" id="company_type"  alt="公司类型:空" onchange="$('#showResult_company_type').html('');">
										<option value="0">请选择</option>
										<!--{foreach from=$companytypes key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_type==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
								  <span id="showResult_company_type"></span>
                                </li>

                                <li><span class="glogintext">公司规模：</span>
                                 <select name="info[company_scale]" id="company_scale" alt="公司规模:空" onchange="$('#showResult_company_scale').html('');">
										<option value="0">请选择</option>
										<!--{foreach from=$companyscales key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_scale==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
								   <span id="showResult_company_scale"></span>
                                </li>

                                <li><span class="glogintext">公司性质：</span>
                                 <select name="info[company_properties]" id="company_properties" alt="公司性质:空" onchange="$('#showResult_company_properties').html('');">
										<option value="0">请选择</option>
										<!--{foreach from=$companyproperties key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_properties==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
								   <span id="showResult_company_properties"></span>
                                </li>


								<li><span class="glogintext">所属行业：</span>
								  <select name="info[dustrytype_1]" id="dustrytype_o" onchange="setSubData(this,'dustrytype');$('#showResult_dustrytype_t').html('');">
									<option value="">请选择</option>
									<!--{foreach from=$dtdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.dustrytype_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
								  </select>
								  <select name="info[dustrytype_2]" id="dustrytype_t"<!--{if !$subdtdatas}--> style="display:none;"<!--{/if}--> alt="所属行业:空">
									<!--{if $subdtdatas}-->
									<!--{foreach from=$subdtdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.dustrytype_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
									<!--{/if}-->
								  </select>
								   <span id="showResult_dustrytype_t"></span>
                                </li>
                                <li><span class="glogintext">薪资待遇：</span>
								  <select name="info[money]" id="money" alt="薪资待遇:空"  onchange="$('#showResult_money').html('');">
								  <option value="">请选择</option>
									<!--{foreach from=$salarys key=key item=item}-->
									<option value="<!--{$key}-->"<!--{if $info.money==$key}--> selected<!--{/if}-->><!--{$item}--></option>
									<!--{/foreach}-->
								  </select>
								   <span id="showResult_money"></span>
                                </li>

                                <li><span class="glogintext">职位性别：</span>
									<input name="info[gender]" type="radio" checked="checked" value="1"<!--{if $info.gender=='0'}--> checked<!--{/if}--> />不限
									<input name="info[gender]" type="radio" value="2"<!--{if $info.gender=='1'}--> checked<!--{/if}--> />男
									<input name="info[gender]" type="radio" value="3"<!--{if $info.gender=='2'}--> checked<!--{/if}--> />女
								</li>

                                <li><span class="glogintext">职位性质：</span>
									<input name="info[jobterm]" type="radio" value="1"<!--{if $info.jobterm=='1'}--> checked<!--{/if}--><!--{if !$info.jobterm}-->checked<!--{/if}-->/>全职
									<input name="info[jobterm]" type="radio" value="2"<!--{if $info.jobterm=='2'}--> checked<!--{/if}--> />兼职
									<input name="info[jobterm]" type="radio" value="3"<!--{if $info.jobterm=='3'}--> checked<!--{/if}--> />实习
								</li>

                                <li><span class="glogintext">语言要求：</span>
									<select name="info[language]" id="language"  alt="语言要求:空" onchange="$('#showResult_language').html('');">
									<option value="">请选择</option>
										<!--{foreach from=$languages key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.language==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
									</select>
								   <span id="showResult_language"></span>
                                </li>

                                <li><span class="glogintext">学历要求：</span>
									<select name="info[degree]" id="degree" alt="学历要求:空"  onchange="$('#showResult_degree').html('');">
									<option value="">请选择</option>
										<!--{foreach from=$degrees key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.degree==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
									</select>
								   <span id="showResult_degree"></span>
                                </li>

                                <li><span class="glogintext">招聘人数：</span><input class="k" id="pnum" name="info[pnum]" onclick="$('#checkbox').attr('checked','');" value="<!--{$info.pnum}-->" style="width:50px;" type="text" />
                                 
                                <input type="checkbox" name="pnum_x" id="checkbox" onclick="$('#pnum').val('');" <!--{if $info.pnum==0}--> checked="checked" <!--{/if}--> value="1" />
                                <label for="checkbox"></label>
                                聘用若干人</li>
                                <li><span class="glogintext">工作经验：</span>
                                <select name="info[work_exp]">
									<option value="0"<!--{if $info.work_exp=='0'}--> selected="selected"<!--{/if}-->>不限</option>
									<option value="1"<!--{if $info.work_exp=='1'}--> selected="selected"<!--{/if}-->>无经验</option>
									<option value="2"<!--{if $info.work_exp=='2'}--> selected="selected"<!--{/if}-->>1年以下</option>
									<option value="3"<!--{if $info.work_exp=='3'}--> selected="selected"<!--{/if}-->>1-3年</option>
									<option value="4"<!--{if $info.work_exp=='4'}--> selected="selected"<!--{/if}-->>3-5年</option>
									<option value="5"<!--{if $info.work_exp=='5'}--> selected="selected"<!--{/if}-->>5-10年</option>
									<option value="6"<!--{if $info.work_exp=='6'}--> selected="selected"<!--{/if}-->>10年以上</option>
                                </select>
                                </li>

								<li><span class="glogintext">有效期：</span>
									<input type="tetx" name="info[startdate]" value="<!--{$info.startdate}-->" class="Wdate" onClick="WdatePicker()" style="width:120px;" />&nbsp;-&nbsp;<input type="tetx" name="info[enddate]" value="<!--{$info.enddate}-->"  class="Wdate" onClick="WdatePicker()" style="width:120px;"/>&nbsp;格式：2008-10-11，留空为长期有效。
								</li>

                                <li><span class="glogintext">职位描述：</span><textarea name="info[jtext]" cols="" rows="" style="width:500px;height:100px;"><!--{$info.jtext}--></textarea></li>
                                <li><span class="glogintext">&nbsp;</span>
								<input type="image" onclick="$('#action').val('push');" src="/images/fabu.gif" />  
								<!--{if !$jid}-->
									<input type="image" onclick="$('#action').val('save');" src="/images/zhiweimuban.gif" />
								<!--{/if}-->
								 <input type="hidden" name="action" id="action" value="push" />
								 <input type="hidden" name="info[cid]"  value="<!--{$logininfo.uid}-->" />
								 </li>
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
	var str = '<img src="/images/no.jpg"><font color="red"> 该项目未选择选择</fonts>';
	//alert($('#live').val());
	//return false;
	if($('#live').val() == 0){
		$('#showResult_live_gnd_c').html(str);
		return false;
	}else{
		$('#showResult_live_gnd_c').html('');
	}

	if($('#scid').val() == 0){
		$('#showResult_scid').html(str);
		return false;
	}else{
		$('#showResult_scid').html('');
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

	if($('#company_properties').val() == 0){
		$('#showResult_company_properties').html(str);
		return false;
	}else{
		$('#showResult_company_properties').html('');
	}

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