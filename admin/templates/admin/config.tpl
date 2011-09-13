<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn1"><span>站点设置</span></a></li>
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>站点基本资料设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">网站名称:</td>
		<td class="td4"><input id="webname" name="info[webname]" type="text" value="<!--{$info.webname}-->" alt="网站名称:无内容" /><span id="showResult_webname"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">网站链接:</td>
		<td class="td4"><input id="weburl" name="info[weburl]" type="text" value="<!--{$info.weburl}-->" alt="网站链接:无内容/有全角" /><span id="showResult_weburl"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">网站域名:</td>
		<td class="td4"><input id="domain" name="info[domain]" type="text" value="<!--{$info.domain}-->" alt="网站域名:无内容/有全角" /><span id="showResult_domain"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">图片链接:</td>
		<td class="td4"><input id="imgurl" name="info[imgurl]" type="text" value="<!--{$info.imgurl}-->" alt="图片链接:无内容/有全角" /><span id="showResult_imgurl"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">网站编码:</td>
		<td class="td4"><input id="webcharset" name="info[charset]" type="text" value="<!--{$info.charset|default:'utf-8'}-->" alt="网站编码:无内容" /><span id="showResult_webcharset"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">版本Version:</td>
		<td class="td4"><input id="version" name="info[version]" type="text" value="<!--{$info.version}-->"/><span id="showResult_version"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">ICP报备信息:</td>
		<td class="td4"><input id="icp" name="info[icp]" type="text" value="<!--{$info.icp}-->"/><span id="showResult_icp"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">客服电话:</td>
		<td class="td4"><input id="kfphone" name="info[kfphone]" type="text" value="<!--{$info.kfphone}-->" style="width:120px;"/><span id="showResult_kfphone"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">提现起点:</td>
		<td class="td4"><input id="txmoney" name="info[txmoney]" type="text" value="<!--{$info.txmoney|default:100}-->" style="width:120px;" alt="提现起点:无内容"/><span id="showResult_txmoney"></span>积分</td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">强制个人上传视频简历:</td>
		<td class="td4"><input name="info[isvideo]" type="radio" value="1" <!--{if $info.isvideo==1}--> checked<!--{/if}-->/>是 <input name="info[isvideo]" type="radio" value="0" <!--{if $info.isvideo!=1}--> checked<!--{/if}-->/>否 </td>
	</tr>
</table>
<h2>站点SEO设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="150">SEO站点标题:</td>
		<td class="td4"><input id="seo_title" name="info[seo_title]" type="text" value="<!--{$info.seo_title}-->" style="width:300px;"/><span id="showResult_seo_title"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">SEO站点关键词:</td>
		<td class="td4"><input id="seo_keyword" name="info[seo_keyword]" type="text" value="<!--{$info.seo_keyword}-->" style="width:500px;" /><span id="showResult_seo_keyword"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">SEO站点描述:</td>
		<td class="td4"><input id="seo_description" name="info[seo_description]" type="text" value="<!--{$info.seo_description}-->" style="width:500px;" /><span id="showResult_seo_description"></span></td>
	</tr>
</table>
<h2>站点数据库设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3">数据表名:</td>
		<td class="td4"><input id="dbname" name="db[dbname]" type="text" value="<!--{$dbinfo.dbname}-->" alt="数据表名:无内容/有全角" /><span id="showResult_dbname"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">表前缀:</td>
		<td class="td4"><input id="dbprefix" name="db[prefix]" type="text" value="<!--{$dbinfo.prefix|default:'zp_'}-->" alt="表前缀:无内容/有全角" /><span id="showResult_dbprefix"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">数据库编码:</td>
		<td class="td4"><input id="dbcharset" name="db[charset]" type="text" value="<!--{$dbinfo.charset|default:'utf8'}-->" /><span id="showResult_dbcharset"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3" width="150">数据库服务器:</td>
		<td class="td4"><input id="dbhost" name="db[write][dbhost]" type="text" value="<!--{$dbinfo.write.dbhost|default:'localhost'}-->" alt="数据库服务器:无内容" /><span id="showResult_dbhost"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">数据库用户名:</td>
		<td class="td4"><input id="dbusername" name="db[write][username]" type="text" value="<!--{$dbinfo.write.username}-->" alt="数据库用户名:无内容" /><span id="showResult_dbusername"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">数据库密码:</td>
		<td class="td4"><input id="dbpassword" name="db[write][password]" type="text" value="<!--{$dbinfo.write.password}-->" alt="数据库密码:无内容" /><span id="showResult_dbpassword"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">数据库端口:</td>
		<td class="td4"><input id="dbport" name="db[write][port]" type="text" value="<!--{$dbinfo.write.port|default:3306}-->" alt="数据库端口:无内容" /><span id="showResult_dbport"></span></td>
	</tr>
</table>
<br />
<div style="padding-left:125px;"> <input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->