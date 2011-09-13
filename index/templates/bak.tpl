<select name="info[speciality_1]" id="speciality_o" onchange="setSubData(this,'major');" title="专业:空">
<option value="">请选择</option>
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
</select>





<select name="einfo[<!--{$e}-->][major_1]" id="major_o_<!--{$e}-->" onchange="setSubData(this,'major');" title="专业:空">
<option value="">请选择</option>
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
</select>


<a href="<!--{$baseurl}-->/member/getpwd.html">忘记密码</a> 

 <img src="<!--{$baseurl}-->/images/Icon1.gif" /> <a href="<!--{$baseurl}-->/member/getpwd.html">找回密码</a>