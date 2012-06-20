    	        <tr>
    	          <td height="1" colspan="2" bgcolor="#CCCCCC"></td>
   	            </tr>
    	        <tr>
    	          <td colspan="2">联系方式：
						<!--{if $rtype == 1 || $rtype == 3}-->
						<!--{$info.phone}--> 
						<!--{$info.email}-->
						<!--{/if}-->
					</td>
   	            </tr>
    	        <tr>
    	          <td colspan="2"><table border="0" cellspacing="0" cellpadding="0" width="600">
    	            <tbody>
    	              <tr>
    	                <td><strong>interested job:<!--{$info.funtype_2_name}--></strong></td>
    	                <td align="right" class="font14px bold">视一视招聘网</td>
  	                </tr>
  	              </tbody>
  	            </table>
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                      <tbody>
                        <tr>
                          <td width="81%">ID:<!--{$info.uid}--></td>
                          <td width="19%"><a href="/enterp/resume/view.html?uid=<!--{$info.uid}-->&t=cn">查看其中文简历</a></td>
                        </tr>
                        <tr>
                          <td colspan="2" style="border:1px solid #ccc"><div align="right">
						  <!--{if $down}--><!--{$info.uname}-->  id no：<!--{$info.idcard}-->  <!--{/if}--><!--{if $info.gender==1}-->male<!--{else}-->female<!--{/if}--> | <!--{$info.age}-->years old | height：<!--{$info.stature}-->CM | weight：<!--{$info.weight}-->KG <br/><br/> live add：<!--{$info.live_gnd_name}--><!--{$info.live_address}--> | birth add：<!--{$info.birth_gnd_name}--> 
						  </div></td>
                        </tr>
                      </tbody>
                  </table></td>
   	            </tr>
    	        <tr>
    	          <td colspan="2"><div  style="border:1px solid #ccc">
    	            <div>
    	              <div>
    	                <div class="grh2">Career Objective</div>
    	                <div class="grmain">
    	                  <table width="100%" border="0" cellpadding="2" cellspacing="0">
    	                    <tbody>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">desired type of employment：</td>
    	                        <td><!--{$info.jobterm}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">Desired Position：</td>
    	                        <td><!--{$info.funtype_2_name}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td valign="top" nowrap="nowrap" align="right">Desired Industry：</td>
    	                        <td><!--{$info.funtype_1_name}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">Desired Working Place：</td>
    	                        <td><!--{$info.work_gnd_name}--></td>
  	                        </tr>
    	                      <tr></tr>
    	                      <tr>
    	                        <td width="1%" nowrap="nowrap" align="right">Working Situation：</td>
    	       	                <td><!--{$info.nowzt}--></td>
  	                        </tr>
  	                        <tr>
    	                        <td width="1%" nowrap="nowrap" align="right">期望薪资：</td>
    	                        <td><!--{$salarys[$info.salary]}--></td>
  	                        </tr>
  	                      </tbody>
  	                    </table>
  	                  </div>
  	                </div>
					<!--{if $info.introduction}-->
    	              <div>
    	                <div class="grh2">Self-assessment</div>
    	                <div class="grmain">
    	                  <div><!--{$info.introduction}--></div>
  	                  </div>
  	                </div>
					<!--{/if}-->

					<!--{if $edus}-->
    	              <div>
    	                <div class="grh2">education background</div>
    	                <div class="grmain">
							<!--{foreach from=$edus key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->
						</div>
  	                </div>
					<!--{/if}-->

					<!--{if $ctfs}-->
    	              <div>
    	                <div class="grh2">certificate</div>
    	                <div class="grmain">
							<!--{foreach from=$ctfs key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->

    	                  <div></div>
    	                  
  	                  </div>
  	                </div>
					<!--{/if}-->

					<!--{if $works}-->
    	              <div>
    	                <div class="grh2">Working Experience</div>
    	                <div class="grmain">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
							<!--{foreach from=$works key=key item=item}-->
								<!--{$item}-->
							<!--{/foreach}-->
                          </table>
                          <div></div>
    	                 
  	                  </div>
  	                </div>
					<!--{/if}-->

					<!--{if $langs}-->
					<div>
						<div class="grh2">language skill</div>
						<div class="grmain">
							<!--{foreach from=$langs key=e item=lang}-->
								<!--{$languages[$lang.language]}-->
								reading&writing ability：：<!--{$lang.rwability}-->
								listening&oral ability：<!--{$lang.lsability}-->
								<br />
							<!--{/foreach}-->
						</div>
					</div>
					<!--{/if}-->

					<!--{if $its}-->
					<div>
						<div class="grh2">computer skill</div>
						<div class="grmain">
							<!--{foreach from=$its key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->
						</div>
					</div>
					<!--{/if}-->

					<!--{if $info.interest}-->
					<div>
						<div class="grh2">interests & hobbies</div>
						<div class="grmain">
							<!--{$info.interest}-->
						</div>
					</div>
					<!--{/if}-->

					<!--{if $info.zycourse}-->
					<div>
						<div class="grh2">main courses</div>
						<div class="grmain">
							<!--{$info.zycourse}-->
						</div>
					</div>
					<!--{/if}-->


  	              </div>
  	            </div>
				</td>
  	          </tr>
