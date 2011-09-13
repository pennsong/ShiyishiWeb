<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 职位管理 -设置职位模板</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei">
                        <h2>设置职位模板</h2>
                		<div id="hrzhiweimain">
							<form name="form1" method="post" action="/enterp/publish_job/save.do">
                        	<ul>
                                <li><span class="glogintext">职位名称：</span><input class="k" name="info[title]" type="text" value="<!--{$info.title}-->" alt="职位名称:空" /></li>
                                <li><span class="glogintext">工作地点：</span>
									  <select name="info[live_gnd_p]" onchange="setCity(this,'live_gnd_c');" id="live">
									  <option value="0">请选择</option>
										<!--{foreach from=$adatas key=key item=item}-->
										<option value="<!--{$item.id}-->"<!--{if $info.live_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
										<!--{/foreach}-->
									  </select>
									  <select name="info[live_gnd_c]" id="live_gnd_c" <!--{if !$aldatas}--> style="display:none;"<!--{/if}--> alt="现居住地:空">
										<option value="0">市/区</option>
										<!--{if $aldatas}-->
										<!--{foreach from=$aldatas key=key item=item}-->
										<option value="<!--{$item.id}-->"<!--{if $info.live_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
										<!--{/foreach}-->
										<!--{/if}-->
									  </select><span id="showResult_live_gnd_c"></span>
                                </li>
                                <li><span class="glogintext">分支机构：</span>
								  <select name="info[scid]">
									<option value="0">请选择</option>
									<!--{foreach from=$subcompany key=key item=item}-->
										<option value="<!--{$item.id}-->" <!--{if $info.scid==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
								  </select>
                                </li>
                                <li><span class="glogintext">职位类别：</span>
								  <select name="info[funtype_1]" id="funtype_o" onchange="setSubData(this,'funtype');" alt="职位类别:空">
									<option value="">请选择</option>
									<!--{foreach from=$ftdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.funtype_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
								  </select>
								  <select name="info[funtype_2]" id="funtype_t"<!--{if !$subftdatas}-->  style="display:none;"<!--{/if}-->>
									<!--{if $subftdatas}-->
									<!--{foreach from=$subftdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.funtype_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
									<!--{/if}-->
								  </select>
								  </li>

                                <li><span class="glogintext">公司类型：</span>
                                    <select name="info[company_type]">
										<option value="0">请选择</option>
										<!--{foreach from=$companytypes key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_type==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
                                </li>
                                <li><span class="glogintext">公司规模：</span>
                                 <select name="info[company_scale]">
										<option value="0">请选择</option>
										<!--{foreach from=$companyscales key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_scale==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
                                </li>

                                <li><span class="glogintext">公司性质：</span>
                                 <select name="info[company_properties]">
										<option value="0">请选择</option>
										<!--{foreach from=$companyproperties key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_properties==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
                                </li>


								<li><span class="glogintext">所属行业：</span>
								  <select name="info[dustrytype_1]" id="dustrytype_o" onchange="setSubData(this,'dustrytype');" alt="职位类别:空">
									<option value="">请选择</option>
									<!--{foreach from=$dtdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.dustrytype_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
								  </select>
								  <select name="info[dustrytype_2]" id="dustrytype_t"<!--{if !$subdtdatas}--> style="display:none;"<!--{/if}-->>
									<!--{if $subdtdatas}-->
									<!--{foreach from=$subdtdatas key=key item=item}-->
									<option value="<!--{$item.id}-->"<!--{if $info.dustrytype_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
									<!--{/foreach}-->
									<!--{/if}-->
								  </select>

                                </li>
                                <li><span class="glogintext">薪资待遇：</span>
								  <select name="info[money]">
									<option value="">请选择</option>
									<!--{foreach from=$salarys key=key item=item}-->
									<option value="<!--{$key}-->"<!--{if $info.money==$key}--> selected<!--{/if}-->><!--{$item}--></option>
									<!--{/foreach}-->
								  </select>

                                </li>

                                <li><span class="glogintext">职位性别：</span>
									<input name="info[gender]" type="radio" value="1"<!--{if $info.gender=='0'}--> checked<!--{/if}--><!--{if !$info.gender}-->checked<!--{/if}-->/>不限
									<input name="info[gender]" type="radio" value="2"<!--{if $info.gender=='1'}--> checked<!--{/if}--> />男
									<input name="info[gender]" type="radio" value="3"<!--{if $info.gender=='2'}--> checked<!--{/if}--> />女
								</li>

                                <li><span class="glogintext">职位性质：</span>
									<input name="info[jobterm]" type="radio" value="1"<!--{if $info.jobterm=='1'}--> checked<!--{/if}--><!--{if !$info.jobterm}-->checked<!--{/if}-->/>全职
									<input name="info[jobterm]" type="radio" value="2"<!--{if $info.jobterm=='2'}--> checked<!--{/if}--> />兼职
									<input name="info[jobterm]" type="radio" value="3"<!--{if $info.jobterm=='3'}--> checked<!--{/if}--> />实习
								</li>

                                <li><span class="glogintext">语言要求：</span>
									<select name="info[language]">
									<option value="">请选择</option>
										<!--{foreach from=$languages key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.language==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
									</select>
                                </li>

                                <li><span class="glogintext">学历要求：</span>
									<select name="info[degree]">
										<option value="">请选择</option>
										<!--{foreach from=$degrees key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.degree==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
									</select>
                                </li>
                                <li><span class="glogintext">招聘人数：</span><input class="k" name="info[pnum]"  value="<!--{$info.pnum}-->" style="width:50px;" type="text" />
                                 
                                <input type="checkbox" name="pnum_x" id="checkbox" value="1" />
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

                                <li><span class="glogintext">职位描述：</span><textarea name="info[jtext]" cols="" rows="" style="width:500px;height:100px;"></textarea></li>
                                <li><span class="glogintext">&nbsp;</span><input type="image"  src="/images/zhiweimuban.gif" />
								 <input type="hidden" name="action" id="action" value="save" />
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
</script>
<!--{include file="include/footer.tpl"}-->