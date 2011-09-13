/*
	$Id: script_cookie.js 2009/12/31 01:41:36Z Arli.Yao $
*/
function rpall(str, sptr, sptr1) {
	while (str.indexOf(sptr) >= 0)
	{
		str = str.replace(sptr, sptr1);
	}
	return str;
}

Cookie = {	

	/** Get a cookie's value
	 *
	 *  @param integer	key		The token used to create the cookie
	 *  @return void
	 */
	get: function(key) {
		return (new RegExp("(?:; )?" + key + "=([^;]*);?")).test(document.cookie) ?  rpall(unescape(decodeURIComponent(RegExp["$1"])),"#","_") : null
		/*
		// Still not sure that "[a-zA-Z0-9.()=|%/]+($|;)" match *all* allowed characters in cookies
		alert(document.cookie);
		tmp =  document.cookie.match((new RegExp(key +'=[a-zA-Z0-9.()=|%/]+($|;)','g')));
		alert(tmp);
		if(!tmp || !tmp[0]) return null;
		else return rpall(unescape(tmp[0].substring(key.length+1,tmp[0].length).replace(';','')),'#','_') || null;
		*/
	},	
	
	/** Set a cookie
	 *
	 *  @param integer	key		The token that will be used to retrieve the cookie
	 *  @param string	value	The string to be stored
	 *  @param integer	ttl		Time To Live (hours)
	 *  @param string	path	Path in which the cookie is effective, default is "/" (optional)
	 *  @param string	domain	Domain where the cookie is effective, default is window.location.hostname (optional)
	 *  @param boolean 	secure	Use SSL or not, default false (optional)
	 * 
	 *  @return setted cookie
	 */
	set: function(key, value, ttl, path, domain, secure) {
		//alert(escape(rpall(value,'_','+')));
		cookie = [key+'='+    escape(rpall(value,'_','#')),
		 		  'path='+    ((!path   || path=='')  ? '/' : path),
		 		  'domain='+  ((!domain || domain=='')?  document.domain : domain)];
		
		if (ttl)         cookie.push('expires='+Cookie.hoursToExpireDate(ttl));
		if (secure)      cookie.push('secure');
		return document.cookie = cookie.join('; ');
	},
	
	/** Unset a cookie
	 *
	 *  @param integer	key		The token that will be used to retrieve the cookie
	 *  @param string	path	Path used to create the cookie (optional)
	 *  @param string	domain	Domain used to create the cookie, default is null (optional)
	 *  @return void
	 */
	unset: function(key, path, domain) {
		path   = (!path   || typeof path   != 'string') ? '/' : path;
        domain = (!domain || typeof domain != 'string') ? document.domain : domain;
		if (Cookie.get(key)) Cookie.set(key, '', 'Thu, 01-Jan-70 00:00:01 GMT', path, domain);
	},

	/** Return GTM date string of "now" + time to live
	 *
	 *  @param integer	ttl		Time To Live (hours)
	 *  @return string
	 */
	hoursToExpireDate: function(ttl) {
		if (parseInt(ttl) == 'NaN' ) return '';
		else {
			now = new Date();
			now.setTime(now.getTime() + (parseInt(ttl) * 60 * 60 * 1000));
			return now.toGMTString();			
		}
	},

	
	/** If Firebug JavaScript console is present, it will dump cookie string to console.
	 * 
	 *  @return void
	 */
	dump: function() {
		if (typeof console != 'undefined') {
			console.log(document.cookie.split(';'));
		}
	}
}