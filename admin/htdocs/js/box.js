(function($){
$.box = {
	doc: $(document),
	init: function(settings){
		if(this.pop)
			return;

		var self=this;
		var top = document.documentElement.scrollTop;

		this.settings = $.extend({
			header: true,
			close: true,
			move: true,
			mask:true,
			iframe:true,
			border: '0px',
			backgound:'#fff'
		}, settings || {});

		if(this.settings.backgound){
			this.settings.backgound = 'background:'+this.settings.backgound+';';
		}else{
			this.settings.backgound = '';
		}
		if(this.settings.border){
			this.settings.border = 'border:'+this.settings.border+';';
		}else{
			this.settings.border = 'border:0px;';
		}
		this.t = {
			body: $('<div id="popdiv2" class="popup_body" style="position:absolute;overflow:hidden;left:0;top:'+top+'px;width:100%;height:100%;z-index:65530;'+this.settings.border+this.settings.backgound+'"></div>'),
			header: $('<div style="width:100%;" class="pop_header"></div>'),
			close: $('<button class="pop_close" title="关闭"></button>'),
			title: $('<span style="height:22px;line-height:22px;padding-left:4px;font-weight:bold"></span>'),
			content: $('<div class="popup_content"></div>'),
			iframe: $('<iframe style="width:100%;height:100%;" scrolling="no" frameborder=0></iframe>')
		};

		if(this.settings.header){
			if(this.settings.close){
				this.t.close.click(function(){
					self.close();
				});
				this.t.header.append(this.t.close);
			}
			this.t.header.append(this.t.title);
			this.t.body.append(this.t.header);
		}
		this.t.body.append(this.t.content);
		this.pop = $('<div id="popdiv" style="position:absolute;left:0px;top:'+top+'px;width:100%;height:100%;z-index:65520;display:none;"><div id="popdiv1" style="position:absolute;z-index:65521;left:0;top:'+top+'px;width:100%;height:100%;"></div></div>');
		this.pop.append(this.t.body);
		if(this.settings.iframe){
			this.t.content.append(this.t.iframe);
		}
		$('body').append(this.pop);
	},

	showMask: function(){
		if(!this.mask){
			var height = Math.min(4000,document.documentElement.scrollHeight);
			height = Math.max(document.documentElement.clientHeight,height);
			this.mask = $('<div id="popupbody" style="position:absolute;left:0px;top:0px;z-index:65510;background:#000;filter: alpha(opacity=30); -moz-opacity :0.3; opacity: 0.3;width:100%;height:'+height+'px;"></div>');
			$('body').append(this.mask);
		}
		//var _h = $(document).height();
		//var _w = $(document).width();
		//this.mask.css({width:_w, height:_h});
		this.mask.show();
	},

	hideMask: function (){
		try{this.mask.hide();}catch(e){};
	},

	show: function(title, html, width, height,showtype){
		var self=this;
		this.init();
		this.showMask();
		this.t.title.html(title);
		

		if(showtype==2)this.t.content.html(html);
		else{
			this.t.iframe.get(0).src = html;
			this.t.iframe.css({width:width,height:height});
		}


		var _w,_h;
		this.f = $('body').offset();
		_w=width || this.f.w;
		_h=height || this.f.h;
		this.f.x = this.f.left;
		this.f.y = $.browser.safari ? (this.f.top || window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0) : this.f.top;
		
		this.f.w = $(window).width();
		this.f.h = $(window).height();

		this.f.left = Math.round(Math.max( this.f.x,  this.f.x + ( this.f.w / 2.0) - (_w / 2.0)));
		this.f.top = Math.round(Math.max( this.f.y,  this.f.y + ( this.f.h / 2.0) - (_h / 2.0)));
		
		this.pop.css({left: this.f.left, top: this.f.top, width: _w, height: _h});
		this.pop.show();
		this.t.header.show();
		if(!title || showtype==5)this.t.header.hide();
		this.t.header.bind("mousedown",this.DragStart);
	},

	close: function (){
		if(this.callback)
			this.callback();
		this.callback=null;
		this.hideMask();

		this.t.iframe.get(0).src = 'about:blank';

		this.pop.hide();

		//this.t.content.empty();
	},

	DragStart: function(e){
		var self = $.box;
		if(e.target.tagName=="OBJECT")return;
		if(e.target.tagName=="BUTTON")return;

		if(document.body.setCapture)document.body.setCapture();
		
		var f = self.pop.offset();

		self.f = $('body').offset();

		self.f.x = self.f.left;
		self.f.y = self.f.top;
		
		self.f.w = $(window).width();
		self.f.h = $(window).height();


		self.cc = $('<div style="position:absolute;background:#000;opacity:0.2; filter:alpha(opacity=20)"></div>');
		self.cc.css({top:f.top-self.f.y, left:f.left-self.f.x, width:self.pop.width(), height:self.pop.height()});
		self.cc.css('zIndex',65535);
		$('body').append(self.cc);

		

		self.g_MDoc = {
			x:e.pageX-parseInt(f.left),
			y:e.pageY-parseInt(f.top)
		};
		self.doc.bind("mousemove",self.DragMove);
		self.doc.bind("mouseup",self.DragEnd);
		return false;
	},

	DragMove: function(e){
		var self = $.box;
		if(e.which !=1 ){
			self.DragEnd();
			return;
		}

		if(self.g_MDoc){
			var mX=e.pageX-self.g_MDoc.x;
			var mY=e.pageY-self.g_MDoc.y;
			mY = Math.max(mY, self.f.y);
			mX = Math.min(mX, (self.f.x+self.f.w  - self.pop.width()));
			mY = Math.min(mY, (self.f.y+self.f.h - self.pop.height()));
		
			if (mX < 0)
				mX = 0;
			if (mY < 0)
				mY = 0;

			self.cc.css({left:mX-self.f.x,top:mY-self.f.y});


			self.pop.css({left:mX,top:mY});
			
		}
		return false;
	},

	DragEnd: function(e){
		var self = $.box;
		self.g_MDoc = null;


		self.cc.remove();


		if(document.body.releaseCapture)document.body.releaseCapture();
		self.doc.unbind("mousemove",self.DragMove);
		self.doc.unbind("mouseup",self.DragEnd);
		return false;
	}

};
})(jQuery);
function popup(_t,_c,_w,_h,_s){
	_t = _t ? _t : '';
	_w = _w ? _w : 500;
	_h = _h ? _h : 380;
	_s = _s ? _s : 1;
	$.box.show(_t,_c,_w,_h,_s);
}