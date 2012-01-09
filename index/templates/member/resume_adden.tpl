<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <form id="resumeAddForm" name="resumeAddForm" action="<!--{$baseurl}-->/member/do/addresume.do" method="post">
	  <input type="hidden" value="<!--{$info.id|default:0}-->" name="info[id]"/><input type="hidden" value="en" name="rtype"/>
	  <div id="gcenterrightc">
        <h2>我的简历-<!--{$pagetitle}--></h2>
        <div id="gloginrightmain">
          <h3>personal info.</h3>
          <ul>
            <li><span class="glogintexteng">name：</span>
              <input class="k" name="info[uname]" id="uname" type="text" value="<!--{$info.uname}-->" alt="name:空/长度@4-20/怪字符"/><span id="showResult_uname"></span>
            </li>
            <li><span class="glogintexteng">gender：</span>
              <input name="info[gender]" type="radio" value="1"<!--{if $info.gender!=2}--> checked<!--{/if}-->/>
              man
              <input name="info[gender]" type="radio" value="2"<!--{if $info.gender==2}--> checked<!--{/if}--> />
              woman</li>
            <li><span class="glogintexteng">ID code：</span>
              <input class="k" name="info[idcard]" id="idcard" value="<!--{$info.idcard}-->" alt="ID code:空/长度@15-18/英文数字" type="text" /><span id="showResult_idcard"></span>
            </li>
            <li><span class="glogintexteng">Stature(CM)：</span>
              <input class="k" name="info[stature]" id="stature" value="<!--{$info.stature}-->" alt="Stature:空/长度@2-3/数字" type="text" /><span id="showResult_stature"></span>
            </li>
            <li><span class="glogintexteng">Weight(KG)：</span>
              <input class="k" name="info[weight]" id="weight" value="<!--{$info.weight}-->" alt="Weight:空/长度@1-3/数字" type="text" /><span id="showResult_weight"></span>
            </li>
            <li><span class="glogintexteng">born place：</span>
              <select name="info[birth_gnd_p]" onchange="setCity(this,'birth_gnd_c');">
                <!--{foreach from=$adatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.birth_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.en}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[birth_gnd_c]" id="birth_gnd_c" title="born place:空">
                <option value="0">City</option>
				<!--{if $info.abdatas}-->
				<!--{foreach from=$info.abdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.birth_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.en}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span id="showResult_birth_gnd_c"></span>
            </li>
            <li><span class="glogintexteng">living place：</span>
              <select name="info[live_gnd_p]" onchange="setCity(this,'live_gnd_c');">
                <!--{foreach from=$adatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.live_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.en}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[live_gnd_c]" id="live_gnd_c" title="living place:空">
                <option value="0">City</option>
				<!--{if $info.aldatas}-->
				<!--{foreach from=$info.aldatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.live_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.en}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span id="showResult_live_gnd_c"></span>
            </li>
			<li><span class="glogintext">Address：</span>
				<input name="info[live_address]" id="live_address" class="k" value="<!--{$info.live_address}-->" title="Address:空"/>
				<span id="showResult_live_address"></span>
            </li>
            <li><span class="glogintexteng">born date：</span>
              <select name="info[birth_year]" id="birth_year">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.birth_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Year
              <select name="info[birth_month]" id="birth_month" onchange="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.birth_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Month
              <select name="info[birth_day]" id="birth_day">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.birth_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Day
            </li>
            <li><span class="glogintexteng">Education：</span>
              <select name="info[degree]" id="degree" title="Education:空">
                <option value="">Select</option>
                <!--{foreach from=$degrees key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.degree==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span id="showResult_degree"></span>
            </li>
            <li><span class="glogintexteng">Major：</span>
              <select name="info[speciality_1]" id="speciality_o" onchange="setSubData(this,'major');" title="Major:空">
                <option value="">Select</option>
				<!--{foreach from=$mjdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.speciality_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[speciality_2]" id="speciality_t"<!--{if !$info.submjdatas}--> style="display:none;"<!--{/if}-->>
			    <!--{if $info.submjdatas}-->
				<!--{foreach from=$info.submjdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.speciality_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span id="showResult_speciality_o"></span>
            </li>
            <li><span class="glogintexteng">Mobile：</span>
              <input class="k" name="info[phone]" id="phone" type="text" value="<!--{$info.phone}-->" alt="Mobile:空/手机"/><span id="showResult_phone"></span>
            </li>
            <li><span class="glogintexteng">E-mail：</span>
              <input class="k" name="info[email]" id="email" type="text" value="<!--{$info.email}-->" alt="E-mail:空/邮件"/><span id="showResult_email"></span>
            </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3>Career Objective.</h3>
          <ul>
            <li><span class="glogintexteng">desired type of employment：</span>
              <input name="info[jobterm]" type="radio" value="full-time"<!--{if $info.jobterm!='part-time'&&$info.jobterm!='intern'}--> checked<!--{/if}-->/>
              full-time
              <input name="info[jobterm]" type="radio" value="part-time"<!--{if $info.jobterm=='part-time'}--> checked<!--{/if}--> />
              part-time
              <input name="info[jobterm]" type="radio" value="intern"<!--{if $info.jobterm=='intern'}--> checked<!--{/if}--> />
              intern</li>
            <li><span class="glogintexteng">on board date：</span>
              <select name="info[entrytime]">
                <!--{foreach from=$entrytimes key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.entrytime==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>
            </li>
            <li><span class="glogintext">Desired Industry：</span>
       		<select name="info[funtype_1]" id="zhiweishuxin" onchange="setZhiweileibie();">
				<option value="">Select</option>
				 <!--{foreach from=$funtype item=item}-->
				 <option value="<!--{$item.id}-->" <!--{if $info.funtype_1==$item.id}--> selected<!--{/if}--> ><!--{$item.thename}--></option>
				 <!--{/foreach}-->
				</select>
              </select><span class="red bold">（必填）</span><span id="showResult_dustrytype_o"></span>
            </li>
            <li><span class="glogintext">Desired Position：</span>
		 		<select name="info[funtype_2]" id="funtype_t">
				<option value="">Select</option>
				</select>
              </select><span class="red bold">（必填）</span><span id="showResult_funtype_o"></span>
            </li>
            <li><span class="glogintexteng">Expected Salary：</span>
              <select name="info[salary]">
                <!--{foreach from=$salarys key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.salary==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>
            </li>
            <li><span class="glogintexteng">Desired Working Place：</span>
              <select name="info[work_gnd_p]" onchange="setCity(this,'work_gnd_c');">
                <!--{foreach from=$adatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.work_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.en}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[work_gnd_c]" id="work_gnd_c" title="Desired Working Place:空">
                <option value="0">City</option>
				<!--{if $info.awdatas}-->
				<!--{foreach from=$info.awdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.work_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.en}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span id="showResult_work_gnd_c"></span>
            </li>
            <li><span class="glogintexteng">Working Situation：</span>
              <input name="info[nowzt]" type="radio" value="in service"<!--{if $info.nowzt!='dimission'}--> checked<!--{/if}-->/>
              in service
              <input name="info[nowzt]" type="radio" value="dimission"<!--{if $info.nowzt=='dimission'}--> checked<!--{/if}--> />
              dimission</li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3>Self-assessment.</h3>
          <ul>
            <li><span class="glogintexteng">&nbsp;</span>
              <textarea name="info[introduction]" id="introduction" style="width:500px;height:100px;" oninput="checklen(this,500,'tn0');" onpropertychange="checklen(this,500,'tn0')"><!--{$info.introduction}--></textarea>
            </li>
            <li><span class="glogintexteng">&nbsp;</span>概述您的职业优势，如：3Year销售经验、5Year软件开发经验，(限500字 剩余<span id="tn0">500</span>字) </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('work');" style="cursor:pointer;">Add working experience</a></span>Working Experience</h3>
          <!--{foreach from=$works key=e item=work}--><input type="hidden" name="winfo[<!--{$e}-->][id]" value="<!--{$work.id|default:0}-->"/>
		  <ul id="resume_work_<!--{$e}-->">
            <li><span class="glogintexteng">working period：</span>
              <select name="winfo[<!--{$e}-->][from_year]" id="from_year_<!--{$e}-->">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.from_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Year
              <select name="winfo[<!--{$e}-->][from_month]" id="from_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.from_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Month
              <select name="winfo[<!--{$e}-->][from_day]" id="from_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.from_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Day
              -
              <select name="winfo[<!--{$e}-->][to_year]" id="to_year_<!--{$e}-->" onclick="checkdate(this);">
                <option value="Now"<!--{if $work.to_year=='Now'}--> selected<!--{/if}-->>Now</option>
				<!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.to_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span id="to_span_<!--{$e}-->"<!--{if $work.to_year=='Now'}--> style="display:none"<!--{/if}-->>Year
              <select name="winfo[<!--{$e}-->][to_month]" id="to_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.to_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Month
              <select name="winfo[<!--{$e}-->][to_day]" id="to_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.to_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Day</span>
            </li>
            <li><span class="glogintexteng">Firm：</span>
              <input class="k" name="winfo[<!--{$e}-->][company]" type="text" value="<!--{$work.company}-->" id="company_<!--{$e}-->" alt="Firm:空/长度@4-50"/><span id="showResult_company_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintexteng">The Nature of Firm：</span>
              <select name="winfo[<!--{$e}-->][companytype]">
                <!--{foreach from=$companytypes key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.companytype==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>
            </li>
            <li><span class="glogintexteng">Position：</span>
              <input class="k" name="winfo[<!--{$e}-->][position]" type="text" value="<!--{$work.position}-->" id="position_<!--{$e}-->" alt="职位名称:空/长度@4-30"/><span id="showResult_position_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintexteng">Salary：</span>
              <select name="winfo[<!--{$e}-->][income]" class="classFormEle_ok">
                <!--{foreach from=$salarys key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.income==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>
            </li>
            <li><span class="glogintexteng">working description：</span>
              <textarea name="winfo[<!--{$e}-->][responsiblity]" style="width:500px;height:100px;"><!--{$work.responsiblity}--></textarea>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('edu');" style="cursor:pointer;">Add education background</a></span>education background</h3>
          <!--{foreach from=$edus key=e item=edu}--><input type="hidden" name="einfo[<!--{$e}-->][id]" value="<!--{$edu.id|default:0}-->"/>
		  <ul id="resume_edu_<!--{$e}-->">
            <li><span class="glogintexteng">period：</span>
              <select name="einfo[<!--{$e}-->][from_year]" id="efrom_year_<!--{$e}-->">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.from_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Year
              <select name="einfo[<!--{$e}-->][from_month]" id="efrom_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.from_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Month
              <select name="einfo[<!--{$e}-->][from_day]" id="efrom_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.from_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Day
              -
              <select name="einfo[<!--{$e}-->][to_year]" id="eto_year_<!--{$e}-->" onclick="checkdate(this);">
                <option value="Now"<!--{if $edu.to_year=='Now'}--> selected<!--{/if}-->>Now</option>
				<!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.to_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span id="eto_span_<!--{$e}-->"<!--{if $edu.to_year=='Now'}--> style="display:none"<!--{/if}-->>Year
              <select name="einfo[<!--{$e}-->][to_month]" id="eto_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.to_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Month
              <select name="einfo[<!--{$e}-->][to_day]" id="eto_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.to_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Day</span>
            </li>
            <li><span class="glogintexteng">school：</span>
              <input class="k" name="einfo[<!--{$e}-->][schoolname]" type="text" id="schoolname_<!--{$e}-->" value="<!--{$edu.schoolname}-->" alt="school:空/长度@4-50"/><span id="showResult_schoolname_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintexteng">major：</span>
              <select name="einfo[<!--{$e}-->][major_1]" id="major_o_<!--{$e}-->" onchange="setSubData(this,'major');" title="major:空">
                <option value="">Select</option>
				<!--{foreach from=$mjdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $edu.major_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
              </select>
              <select name="einfo[<!--{$e}-->][major_2]" id="major_t_<!--{$e}-->"<!--{if !$edu.major}--> style="display:none;"<!--{/if}-->>
                <!--{if $edu.major}-->
				<!--{foreach from=$edu.major key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $edu.major_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span id="showResult_major_o_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintexteng">degree：</span>
              <select name="einfo[<!--{$e}-->][degree]">
                <!--{foreach from=$degrees key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.degree==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('ctf');" style="cursor:pointer;">Add certificate</a></span>certificate</h3>
          <!--{foreach from=$ctfs key=e item=ctf}--><input type="hidden" name="cinfo[<!--{$e}-->][id]" value="<!--{$ctf.id|default:0}-->"/>
		  <ul id="resume_ctf_<!--{$e}-->">
            <li><span class="glogintexteng">issue date：</span>
              <select name="cinfo[<!--{$e}-->][award_year]" id="award_year_<!--{$e}-->">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $ctf.award_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Year
              <select name="cinfo[<!--{$e}-->][award_month]" id="award_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $ctf.award_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Month
              <select name="cinfo[<!--{$e}-->][award_day]" id="award_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $ctf.award_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>Day
            </li>
            <li><span class="glogintexteng">issue authority：</span>
              <input class="k" name="cinfo[<!--{$e}-->][awardorg]" type="text" value="<!--{$ctf.awardorg}-->" id="awardorg_<!--{$e}-->" alt="issue authority:长度@4-50"/><span id="showResult_awardorg_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintexteng">name of certificate：</span>
              <input class="k" name="cinfo[<!--{$e}-->][ctfname]" type="text" value="<!--{$ctf.ctfname}-->" id="ctfname_<!--{$e}-->" alt="name of certificate:长度@4-50"/><span id="showResult_awardorg_<!--{$e}-->"></span>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('lang');" style="cursor:pointer;">Add language skill</a></span>language skill</h3>
          <!--{foreach from=$langs key=e item=lang}--><input type="hidden" name="linfo[<!--{$e}-->][id]" value="<!--{$lang.id|default:0}-->"/>
		  <ul id="resume_lang_<!--{$e}-->">
            <li><span class="glogintexteng">language：</span>
              <select name="linfo[<!--{$e}-->][language]">
                <!--{foreach from=$languages key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $lang.language==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>
            </li>
            <li><span class="glogintexteng">reading&writing ability：</span>
              <select name="linfo[<!--{$e}-->][rwability]">
                <option value="proficient"<!--{if $lang.rwability=='proficient'}--> selected<!--{/if}-->>proficient</option>
                <option value="general level"<!--{if $lang.rwability=='general level'}--> selected<!--{/if}-->>general level</option>
                <option value="not good"<!--{if $lang.rwability=='not good'}--> selected<!--{/if}-->>not good</option>
              </select>
            </li>
            <li><span class="glogintexteng">listening&oral ability：</span>
              <select name="linfo[<!--{$e}-->][lsability]">
                <option value="proficient"<!--{if $lang.lsability=='proficient'}--> selected<!--{/if}-->>proficient</option>
                <option value="general level"<!--{if $lang.lsability=='general level'}--> selected<!--{/if}-->>general level</option>
                <option value="not good"<!--{if $lang.lsability=='not good'}--> selected<!--{/if}-->>not good</option>
              </select>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('it');" style="cursor:pointer;">Add computer skill</a></span>computer skill</h3>
          <!--{foreach from=$its key=e item=it}--><input type="hidden" name="itinfo[<!--{$e}-->][id]" value="<!--{$it.id|default:0}-->"/>
		  <ul id="resume_it_<!--{$e}-->">
            <li><span class="glogintexteng">skill：</span>
              <input class="k" name="itinfo[<!--{$e}-->][skillname]" type="text" value="<!--{$it.skillname}-->" id="skillname_<!--{$e}-->" alt="skill:长度@2-20"/><span id="showResult_skillname_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintexteng">proficiency：</span>
              <select name="itinfo[<!--{$e}-->][ability]">
                <option value="proficient"<!--{if $it.ability=='proficient'}--> selected<!--{/if}-->>proficient</option>
                <option value="general level"<!--{if $it.ability=='general level'}--> selected<!--{/if}-->>general level</option>
                <option value="not good"<!--{if $it.ability=='not good'}--> selected<!--{/if}-->>not good</option>
              </select>
            </li>
            <li><span class="glogintexteng">use time (month)：</span>
              <input class="k" name="itinfo[<!--{$e}-->][usetime]" type="text" value="<!--{$it.usetime}-->" style="width:60px;" id="usetime_<!--{$e}-->" alt="使用时间:数字/长度@1-3"/>Month<span id="showResult_usetime_<!--{$e}-->"></span>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3>interests & hobbies</h3>
          <ul>
            <li><span class="glogintexteng">&nbsp;</span>
              <textarea name="info[interest]" id="interest" style="width:500px;height:100px;" oninput="checklen(this,500,'tn1');" onpropertychange="checklen(this,500,'tn1')"><!--{$info.interest}--></textarea>
            </li>
            <li><span class="glogintexteng">&nbsp;</span>概述您的兴趣爱好，(限500字 剩余<span id="tn1">500</span>字) </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3>main courses</h3>
          <ul>
            <li><span class="glogintexteng">&nbsp;</span>
              <textarea name="info[zycourse]" id="zycourse" style="width:500px;height:100px;" oninput="checklen(this,500,'tn2');" onpropertychange="checklen(this,500,'tn2')"><!--{$info.zycourse}--></textarea>
            </li>
            <li><span class="glogintexteng">&nbsp;</span>概述您的专业课程，(限500字 剩余<span id="tn2">500</span>字) </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <ul>
            <li><span class="glogintexteng">&nbsp;</span><input type="hidden" value="0" name="continue" id="continue"/><input type="image" onclick="return checkPostResume(false);" src="<!--{$baseurl}-->/images/shangchuan.gif" />&nbsp<a href="<!--{$baseurl}-->/member"><img src="<!--{$baseurl}-->/images/quxiao.gif" /></a></li>
          </ul>
        </div>
        <div class="topmargin10px"></div>
      </div>
	  </form>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<script type="text/javascript">
var worki = <!--{$worknum}-->;
var edui = <!--{$edunum}-->;
var ctfi = <!--{$ctfnum}-->;
var langi = <!--{$langnum}-->;
var iti = <!--{$itnum}-->;
function setZhiweileibie(_val){
	_val = typeof(_val) != 'undefined' ? _val : null;
	var tobj = document.getElementById("funtype_t");
	tobj.options.length = 0;
	tobj.options.add(new Option("Select",""));
	$.ajax({
		type:"POST",
		url:"/ajax/getZhiweileibie.do",
		dataType:"html",
		data:'zhiweishuxin='+$("#zhiweishuxin").val(),
		success:function(msg)
		{
			if (msg.length>0)
			{
				msg = msg.split(":");
				if(msg.length>0){
					for(var i=0;i<msg.length;i++){
						var val = msg[i].split("|");
						if (val[0] == _val)
						{
							tobj.options.add(new Option(val[1],val[0], false, true));
						}
						else
						{
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}

		}
	});
}

function checkPostResume(_t){
	if(fm_chk(oo('resumeAddForm'))){
		if(_t){
			$("#continue").val('1');
		}else{
			$("#continue").val('0');
		}
		return true;
	}
	return false;
}
//设置城市
function setCity(_o,_tid){
	var pid = _o.value;
	var tobj = document.getElementById(_tid);
	tobj.options.length = 0;
	if(!pid || pid<=0){
		alert("Select省份！！！");
	}else{
		$.ajax({
			type:"POST",
			url:"/ajax/getcitysbypid.do",
			dataType:"html",
			data:'pid='+pid,
			success:function(msg)
			{
				if(!msg){
					$("#"+_tid).hide();
				}else{
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
//setSubData(this,'dustrytype')
function setSubData(_o,_t){
	var pid = _o.value;
	var _tid = _o.id.replace('_o','_t')
	var tobj = document.getElementById(_tid);
	$("#"+_tid).hide();
	tobj.options.length = 0;
	if(!pid || pid<=0){
		alert("Select有效信息！！！");
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
function checkday(_obj){
	var _m = _obj.value;
	var _y = $("#" + _obj.id.replace('month','year')).val();
	var _do = document.getElementById(_obj.id.replace('month','day'));
	var _len = _do.options.length;
	if(_m==2){
		var _e = _y%4==0 ? 28 : 29;
	}else if(_m==4||_m==6||_m==9||_m==11){
		var _e = 30;
	}else{
		var _e = 31;
	}
	var _i = _len+1;
	if(_i<=_e){
		for(_i;_i<=_e;_i++) {
			_do.options.add(new Option(_i,_i));
		}
	}else{
		_do.options.length = _e;
	}
}

function checkdate(_obj){
	var _y = _obj.value;
	var _sid = _obj.id.replace('year','span');
	if(_y=='Now'){
		$("#" + _sid).hide();
	}else{
		$("#" + _sid).show();
	}
}

function AddHtml(_t){
	var i = getIvalue(_t);
	var bi = i-1;
	var bHtmlid = 'resume_'+_t+'_' + bi;
	var bObj = document.getElementById(bHtmlid);
	var bHtml = bObj.innerHTML;
	var oUl=document.createElement("ul");
	oUl.id = 'resume_'+_t+'_' + i;
	setIvalue(_t);
	bObj.parentNode.appendChild(oUl, bObj);
	oUl.innerHTML = toReplace(toReplace(toReplace(bHtml,'_'+bi,'_'+i),'selected',''),"\\["+bi+"\\]","["+i+"]");
	var inputs = oUl.getElementsByTagName("input");
	if(inputs.length>0){
		for(var j=0;j<inputs.length;j++){
			inputs[j].value = '';
		}
	}
	var textareas = oUl.getElementsByTagName("textarea");
	if(textareas.length>0){
		for(var j=0;j<textareas.length;j++){
			textareas[j].value = '';
		}
	}
	fm_ini();
}

function getIvalue(_t){
	if(_t=='work'){
		return worki;
	}else if(_t=='edu'){
		return edui;
	}else if(_t=='ctf'){
		return ctfi;
	}else if(_t=='lang'){
		return langi;
	}else if(_t=='it'){
		return iti;
	}else{
		return 0;
	}
}

function setIvalue(_t){
	if(_t=='work'){
		worki++;
	}else if(_t=='edu'){
		edui++;
	}else if(_t=='ctf'){
		ctfi++;
	}else if(_t=='lang'){
		langi++;
	}else if(_t=='it'){
		iti++;
	}
}

function toReplace(str,_b,_o){ 
     var RexStr = eval("/"+_b+"/g");
     str = str.replace(RexStr, _o) 
     return str; 
}

function strlen(str)
{
	var lenE = str.length;
	var lenC = 0;
	var CJK = str.match(/[^\x00-\xff]/g);
	if(CJK != null) lenC += CJK.length;
	var len = lenC + lenE;
	return len;	
}

function trim(str) 
{ 
	return str.replace(/^\s\s*/, '').replace(/\s\s*$/, ''); 
}

function checklen(obj,lenT,objname)
{
	var lenE = obj.value.length;
	var lenC = 0;
	var CJK = obj.value.match(/[^\x00-\xff]/g);
	if (CJK != null) lenC += CJK.length;
	var tno = document.getElementById(objname);
	tno.innerText = lenT - lenC - lenE;
	if (tno.innerText < 0) {
		var tmp = 0
		var cut = obj.value.substring(0, lenT);
		for (var i=0; i<cut.length; i++){
			tmp += /[^\x00-\xff]/.test(cut.charAt(i)) ? 2 : 1;
			if (tmp > lenT) break;
		}
		obj.value = cut.substring(0, i);
		tno.innerText = 0;
	}
}
function initLen(name1,name2,maxlen)
{
	var obj1 = document.getElementById(name1);
	var obj2 = document.getElementById(name2);
	var len = strlen(obj1.value);
	if(!maxlen)maxlen=200;
	if(maxlen-len <= 0)
	{
		obj2.innerText = 0;
	}
	else
	{
		obj2.innerText = maxlen - len;	
	}
}
initLen('introduction','tn0',500);
initLen('interest','tn1',500);
initLen('zycourse','tn2',500);
$(document).ready(function(){
	setZhiweileibie(<!--{$info.funtype_2}-->);
});
</script>
<!--{include file="include/footer.tpl"}-->