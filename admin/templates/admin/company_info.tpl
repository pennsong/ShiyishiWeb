<!--{include file=header.tpl}-->
<style>
		#hrjigoumain{}
		#hrjigoumain h3{color:#f60;border-bottom:1px solid #ccc;padding:0 0 10px 30px;font-size:14px;margin:0 10px 10px 10px;}
		#hrjigoumain ul{padding:20px 0 0 0;}
		#hrjigoumain ul li{padding:5px 20px;}
		#hrjigoumain ul li input.k{padding:3px 5px;border:1px solid #B8BFE9;background:#F5F7FD;width:198px;}
		#hrcenter{border:1px solid #B8D3E1;width:600px;margin-left:100px;}
		#hrcenter a{color:#B8D3E1; text-decoration:underline;}
		#hrcenter a:hover{ text-decoration:none;}
</style>
        	<div class="grid_24">
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei">
					<h2>公司信息</h2>
                        <div id="hrjigoumain">
                          <ul>
                                <li><span class="glogintext">公司名称：</span><!--{$info.company}--></li>
                                <li><span class="glogintext">公司简称：</span><!--{$info.company_s}--></li>
                               <li><span class="glogintext">Email：</span><!--{$info.email}--></li>
                                <li><span class="glogintext">公司所属行业：</span>
								<!--{foreach from=$undtdata key=key item=item}-->
									<!--{$item.name}--> 
								<!--{/foreach}-->
                                </li>
                                <li><span class="glogintext">公司类型：</span>
										<!--{foreach from=$companytypes key=key item=item}-->
											<!--{if $info.company_type==$key}--><!--{$item}--><!--{/if}-->
										<!--{/foreach}-->
										</li>

                                <li><span class="glogintext">公司性质：</span>
										<!--{foreach from=$companyproperties key=key item=item}-->
											<!--{if $info.company_properties==$key}--><!--{$item}--><!--{/if}-->
										<!--{/foreach}-->
                                </li>

                                <li><span class="glogintext">公司规模：</span>
										<!--{foreach from=$companyscales key=key item=item}-->
											<!--{if $info.company_scale==$key}--> <!--{$item}--><!--{/if}-->
										<!--{/foreach}-->
                                </li>
                                <li><span class="glogintext">所在城市：</span>
										<!--{foreach from=$adatas key=key item=item}-->
											<!--{if $info.live_gnd_p==$item.id}--><!--{$item.name}--><!--{/if}-->
										<!--{/foreach}-->
										<!--{if $aldatas}-->
											<!--{foreach from=$aldatas key=key item=item}-->
												<!--{if $info.live_gnd_c==$item.id}--><!--{$item.name}--><!--{/if}-->
											<!--{/foreach}-->
										<!--{/if}-->
                                </li>
                                <li><span class="glogintext">邮政编码：</span><!--{$info.postcode}--></li>
                                <li><span class="glogintext">公司地址：</span><!--{$info.address}--></li>
                                <li><span class="glogintext">联系人：</span><!--{$info.contact}--></li>
                                <li><span class="glogintext">联系电话：</span><!--{$info.tel}--></li>
                                <li><span class="glogintext">公司LOGO：</span><img src="<!--{$info.logo}-->" /></li>
                                <li><span class="glogintext">公司介绍：</span><!--{$info.info}--></li>
                                <li><span class="glogintext">证件图片：</span>
								<!--{foreach from=$image key=key item=item}-->
									<img src="<!--{$img_domain}--><!--{$item}-->" />
								<!--{/foreach}-->
								</li>

                            </ul>
                      </div>
                    
                        <div class="clearfix"></div>
                    </div>
                </div>
        	</div>
<!--{include file=footer.tpl}-->