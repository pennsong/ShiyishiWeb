<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/book.css">
<div class="main">
  <div class="buzhou_gwc">
    <div></div>
  </div>
  <div class="gray_top_box center_bulletin_width"></div>
  <div class="gray_center_box bg_ffffff">
    <!--{foreach from=$mycarts item=vitem}-->
	<div class="address_title"><!--{$vitem.cityname}-->演出</div>
    <div class="bg_fffce2">
      <div class="ycdaohang">
        <div class="yc">演出信息</div>
        <div class="sm">说明</div>
        <div class="dj">单价</div>
        <div class="sl">数量</div>
        <div class="cz">操作</div>
      </div>
      <!--{foreach from=$vitem.child key=key item=item}-->
      <div class="yckuai bg_fffce2" id="ShopCart_<!--{$item.id}-->">
        <div class="yc_k"> <img src="<!--{$item.show.thumbsrc|default:'/images/fm.jpg'}-->" />
          <div class="info"> <span><a href="<!--{$item.show.citylink}-->show/<!--{$item.show.pid}-->.html"><!--{$item.show.fullname}--></a></span><br />
            地点：<!--{$item.show.venuename}-->[<!--{$item.show.cityname}-->]<br />
            时间：<!--{$item.show.wdatetime}--></div>
        </div>
        <div class="sm_k"><!--{$item.description|substr:12:''|default:'&nbsp;'}--></div>
        <div class="dj_k"><input type="hidden" id="price_<!--{$item.id}-->" value="<!--{$item.allprice}-->"><!--{$item.newprice}-->元</div>
        <div class="sl_k"><!--{$item.ticketnum}--></div>
        <div class="cz_k"><span class="btn_del"><a href="javascript:DelIt(<!--{$item.id}-->);" id="del_<!--{$item.id}-->">删 除</a></span></div>
      </div>
	  <!--{foreachelse}-->
	  <div class="yckuai bg_fffce2">
	    <div class="yc_k" style="width:auto;text-align:center;line-height:78px;"> 您的购物车中没有任何票务信息，请重新购物。
        </div>
	  </div>
      <!--{/foreach}-->
      <div class="g_car"> <span class="btn_jixu"><a href="http://<!--{$cookiecity.area_en}--><!--{$webdomain}-->/">继续购物</a></span> <span class="btn_jiesuan"><a href="<!--{$baseurl}-->/orderconfirm.html?sid=<!--{$vitem.sid}-->">去结算中心&gt;&gt;</a></span> <span class="wz" style="width:200px;">合计：&yen;<font id="totalprice"><!--{$vitem.allfee}--></font> 元</span> </div>
    </div>
	<!--{foreachelse}-->
	<div class="address_title"></div>
	  <div class="yc_k" style="width:auto;text-align:center;line-height:78px;"> 您的购物车中没有任何票务信息，<a href="http://<!--{$cookiecity.area_en}--><!--{$webdomain}-->/">请重新购物</a>。
      </div>
	</div>
    <!--{/foreach}-->
  </div>
  <div class="gray_bottom_box center_bulletin_width"></div>
</div>
<script type="text/javascript">
function DelIt(_id){
	if(!confirm('确定删除吗?'))return;
	$.ajax({
		type:"GET",
		url:"<!--{$baseurl}-->/ajax/delmycart.do",
		dataType:"html",
		data:"id="+_id,
		beforeSend:function(XMLHttpRequest){
			$("#del_"+_id).text("删除中");
		},
		success:function(msg){
			if(msg=='success'){
				$('#totalprice').html(parseFloat($('#totalprice').html()).toFixed(2)-$('#price_'+_id).val());
				$('#ShopCart_'+_id).remove(); 
			}else{
				$("#del_"+_id).text("删 除");
			}
		}
	});
}
</script>
<!--{include file="include/footer.tpl"}-->