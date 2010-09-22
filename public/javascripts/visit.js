(function(){	  
  var uniqueId = function() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
      return v.toString(16);
    }).toUpperCase();
  };
    
	var readCookie = function(cookieName) {
		var theCookie=""+document.cookie;
		var ind=theCookie.indexOf(cookieName);
		if (ind==-1 || cookieName=="") return false; 
		var ind1=theCookie.indexOf(';',ind);
		if (ind1==-1) ind1=theCookie.length; 
		var value = unescape(theCookie.substring(ind+cookieName.length+1,ind1));
		return value;
	};

	var setCookie = function(cookieName, cookieValue, msec_in_utc) {
		var expire = new Date(msec_in_utc);
		document.cookie = cookieName + "=" + escape(cookieValue) + ";path=/" +";expires=" + expire.toUTCString();
	};

  var referrer = (window.decodeURI)?window.decodeURI(document.referrer):document.referrer;

  if (referrer || referrer.match('\:\/\/'+window.location.host + '[^\w]')) {    
    referrer = '';
  }

	var today = new Date().getTime();

  var uniq = readCookie('_y');
  var visit = readCookie('_yy')

  if (!uniq) {
    uniq = uniqueId();
    setCookie('_y', uniq, today + (1000*60*60*24*360*20)) // 20 years 
  }

  if(!visit) {
    new Image().src = '/visit/record.gif?a='+ uniq + '&r=' +encodeURIComponent(referrer)+'&'+ today;
  }

	// set return visit cookie, always advance this. 
	setCookie('_yy', '.', today + (1000*60*30)); // 30 mins
}());

