<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 控制面板 - 修改公司设置</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei">
                        <h2>修改公司设置</h2>
                        <div id="hrjigoumain">
                          <ul>
								<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/csave.do" method="post" onsubmit="return submitCheck();">
								<input name="info[id]" type="hidden" value="<!--{$info.id}-->"/>
								<input name="info[mobile]" type="hidden" value="<!--{$info.mobile}-->"/>
								<input name="info[dtype]" type="hidden" value="<!--{$info.dtype}-->"/>
								<input name="info[durl]" type="hidden" value="<!--{$info.durl}-->"/>
								<input name="info[email]" type="hidden" value="<!--{$info.email}-->"/>
								<input name="info[createtime]" type="hidden" value="<!--{$info.createtime}-->"/>
								<input name="info[lasttime]" type="hidden" value="<!--{$info.lasttime}-->"/>
								<input name="info[ip]" type="hidden" value="<!--{$info.ip}-->"/>
								<input name="info[username]" type="hidden" value="<!--{$info.username}-->"/>
								<input name="info[password]" type="hidden" value="<!--{$info.password}-->"/>
								<input name="info[dustrytype]" id="dustrytype" type="hidden" value="<!--{$info.dustrytype}-->"/>
								<input name="info[logo]" id="photo" type="hidden" value="<!--{$info.logo}-->"/>

                                <li><span class="glogintext">公司名称：</span><input class="k" name="info[company]" id="company" alt="公司名称:空" type="text" value="<!--{$info.company}-->"/>
								<span id="showResult_company"></span>
								</li>
                                <li><span class="glogintext">公司简称：</span><input class="k" name="info[company_s]" id="company_s" alt="公司简称:空" type="text" value="<!--{$info.company_s}-->"/>
								<span id="showResult_company_s"></span>
								</li>
                                <li><span class="glogintext">公司所属行业：</span>
                                <table cellspacing="0" cellpadding="0" border="0">
								<tbody><tr><td>
								<select style="width: 275px;" multiple="" size="5" name="industry" id="industry" ondblclick="moveOption(document.getElementById('industry'), document.getElementById('industrylist'));$('#showResult_industry').html('');">
									<!--{foreach from=$dtdatas key=key item=item}-->
									<option value="<!--{$item.id}-->" ><!--{$item.name}--></option>
									<!--{/foreach}-->
								</select>
							</td>
							<td width="90" align="center">
							<input type="button" onclick="moveOption(document.getElementById('industry'),document.getElementById('industrylist'));" value="添加&gt;&gt;" name="add" class="genButton1"><br><br>
							<input type="button" onclick="moveOption(document.getElementById('industrylist'),document.getElementById('industry'));" value="&lt;&lt;删除" name="delete" class="genButton1">
							</td>
							<td><select style="width: 275px;" multiple="" size="5" name="infox" id="industrylist" ondblclick="moveOption(document.getElementById('industrylist'), document.getElementById('industry'));$('#showResult_industry').html('');">
									<!--{foreach from=$undtdata key=key item=item}-->
									<option value="<!--{$item.id}-->" ><!--{$item.name}--></option>
									<!--{/foreach}-->
							</select></td></tr></tbody></table>
							 <span id="showResult_industry"></span>
                                </li>
                                <li><span class="glogintext">公司类型：</span>
                                    <select name="info[company_type]" id="company_type" onchange="$('#showResult_company_type').html('');">
										<option value="0">请选择</option>
										<!--{foreach from=$companytypes key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_type==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
								 <span id="showResult_company_type"></span>
                                </li>

                                <li><span class="glogintext">公司性质：</span>
                                    <select name="info[company_properties]" id="company_properties" onchange="$('#showResult_company_properties').html('');">
										<option value="0">请选择</option>
										<!--{foreach from=$companyproperties key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_properties==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
								 <span id="showResult_company_properties"></span>
                                </li>

                                <li><span class="glogintext">公司规模：</span>
                                 <select name="info[company_scale]" id="company_scale"  onchange="$('#showResult_company_scale').html('');">
										<option value="0">请选择</option>
										<!--{foreach from=$companyscales key=key item=item}-->
										<option value="<!--{$key}-->"<!--{if $info.company_scale==$key}--> selected<!--{/if}-->><!--{$item}--></option>
										<!--{/foreach}-->
                                   </select>
								 <span id="showResult_company_scale"></span>
                                </li>
                                <li><span class="glogintext">所在城市：</span>
									  <select name="info[live_gnd_p]" onchange="setCity(this,'live_gnd_c');$('#showResult_live_gnd_c').html('');" id="live">
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
									  </select>
									 <span id="showResult_live_gnd_c"></span>
                                </li>
                                <li><span class="glogintext">邮政编码：</span><input class="k" name="info[postcode]" id="postcode" alt="邮政编码:空/数字/" type="text" value="<!--{$info.postcode}-->"/>
								<span id="showResult_postcode"></span>
								</li>
                                <li><span class="glogintext">公司地址：</span><input class="k" name="info[address]" id="address" alt="公司地址:空" type="text" style="width:490px;" value="<!--{$info.address}-->"/>
								<span id="showResult_address"></span>
								</li>
                                <li><span class="glogintext">联系人：</span><input class="k" name="info[contact]" id="contact" alt="联系人:空"  type="text" value="<!--{$info.contact}-->"/>
								<span id="showResult_contact"></span>
								</li>
                                <li><span class="glogintext">联系电话：</span><input class="k" name="info[tel]" id="tel"  alt="联系电话:空/电话" type="text"  value="<!--{$info.tel}-->"/>
								<span id="showResult_tel"></span>
								</li>
                                <li><span class="glogintext">公司LOGO：</span><iframe src="<!--{$pageurl}-->/upload.do" scrolling="no" width="300" height="30" ></iframe><img id="uploadimg" src="<!--{$info.logo}-->" />
								<span id="showResult_tel"></span>
								</li>
                                <li><span class="glogintext">公司介绍：</span><textarea name="info[info]" alt="公司介绍:空" id="info" cols="" rows="" style="width:500px;height:100px;"><!--{$info.info}--></textarea>
								<span id="showResult_info"></span>
								</li>
                                <li><span class="glogintext">&nbsp;</span><input type="image" src="/images/baocun.gif" onclick="setdustrytype();" /></li>
								</form>

                            </ul>
                      </div>
                    
                        <div class="clearfix"></div>
                    </div>
                </div>
        	</div>
<SCRIPT LANGUAGE="JavaScript">  
<!--   
function setdustrytype(){
	var obj = document.getElementById('industrylist');
	var i=0;
	var l=obj.options.length
	var a = Array();
	var str = '';

	if(l){
		for(i;i<l;i++){
			a.push(obj.options[i].value);
		}
		str = a.join(",");
		document.getElementById('dustrytype').value = str;
	}else{
		document.getElementById('dustrytype').value = "";
	}
}

//移动   
function moveOption(obj1, obj2)   
{   
	 for(var i = obj1.options.length - 1 ; i >= 0 ; i--)   
	 {   
		 if(obj1.options[i].selected)   
		 {   
			var opt = new Option(obj1.options[i].text,obj1.options[i].value);   
			opt.selected = true;   
			obj2.options.add(opt);   
			obj1.remove(i);   
		}   
	 }   
}   

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

function submitCheck(){
	var obj = document.getElementById('industrylist');
	var l=obj.options.length

	var str = '<img src="/images/no.jpg"><font color="red"> 该项目未选择选择</fonts>';

	if(l == 0){
		$('#showResult_industry').html(str);
		return false;
	}else{
		$('#showResult_industry').html('');
	}

	if($('#live').val() == 0){
		$('#showResult_live_gnd_c').html(str);
		return false;
	}else{
		$('#showResult_live_gnd_c').html('');
	}

	if($('#company_type').val() == 0){
		$('#showResult_company_type').html(str);
		return false;
	}else{
		$('#showResult_company_type').html('');
	}

	if($('#company_properties').val() == 0){
		$('#showResult_company_properties').html(str);
		return false;
	}else{
		$('#showResult_company_properties').html('');
	}

	if($('#company_scale').val() == 0){
		$('#showResult_company_scale').html(str);
		return false;
	}else{
		$('#showResult_company_scale').html('');
	}

	return true;
}

    //-->  
</SCRIPT>  
<!--{include file="include/footer.tpl"}-->