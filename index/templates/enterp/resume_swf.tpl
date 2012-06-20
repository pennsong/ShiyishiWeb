
联系方式：
<!--{if $rtype == 1 || $rtype == 3}-->
<!--{$info.phone}--> 
<!--{$info.email}-->
<!--{/if}-->
应聘职位:<!--{$info.funtype_2_name}-->
ID:<!--{$info.uid}-->
<!--{if $down}--><!--{$info.uname}-->
身份证号：<!--{$info.idcard}--><!--{/if}-->
<!--{if $info.gender==1}-->男<!--{else}-->女<!--{/if}-->
<!--{$info.age}-->岁
身高：<!--{$info.stature}-->CM
体重：<!--{$info.weight}-->KG
现居住于：<!--{$info.live_gnd_name}--><!--{$info.live_address}-->
户籍所在地：<!--{$info.birth_gnd_name}--> 
==============
求职意向
期望工作性质：<!--{$info.jobterm}-->
期望从事职业：<!--{$info.funtype_2_name}-->
期望从事行业：<!--{$info.funtype_1_name}-->
期望工作地点：<!--{$info.work_gnd_name}-->
目前状况：<!--{$info.nowzt}-->
期望薪资：<!--{$salarys[$info.salary]}-->
<!--{if $info.introduction}-->
自我评价<!--{$info.introduction}-->
<!--{/if}-->
<!--{if $edus}-->
==============
教育经历
<!--{foreach from=$edus key=key item=item}-->
<!--{$item}-->
<!--{/foreach}-->
<!--{/if}-->
<!--{if $ctfs}-->
==============
证书奖励
<!--{foreach from=$ctfs key=key item=item}-->
<!--{$item}-->
<!--{/foreach}-->
<!--{/if}-->
<!--{if $works}-->
==============
工作经历
<!--{foreach from=$works key=key item=item}-->
<!--{$item}-->
<!--{/foreach}-->
<!--{/if}-->
<!--{if $langs}-->
==============
语言能力
<!--{foreach from=$langs key=e item=lang}-->
<!--{$languages[$lang.language]}-->
读写能力：<!--{$lang.rwability}-->
听说能力：<!--{$lang.lsability}-->
<!--{/foreach}-->
<!--{/if}-->
<!--{if $its}-->
计算机操作技能
<!--{foreach from=$its key=key item=item}-->
<!--{$item}-->
<!--{/foreach}-->
<!--{/if}-->
<!--{if $info.interest}-->
兴趣爱好
<!--{$info.interest}-->
<!--{/if}-->
<!--{if $info.zycourse}-->
专业课程
<!--{$info.zycourse}-->
<!--{/if}-->