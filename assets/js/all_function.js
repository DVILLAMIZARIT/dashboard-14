/**-- Classes handler --*/

/**
 * check if element has class
 * @param {Object} element the object to be checked
 * @param {String} value the class name
 * @returns {Boolean}
 */
var hasClass = function(element, value) {
    return element.className.search(new RegExp('(\\s|^)'+ value +'(\\s|$)')) > -1;
};

/**
 * add a class to an element
 * @param {Object} element the object to update
 * @param {String} value the class name
 * @returns {Boolean}
 */
var addClass = function (element, value) {
    if (!hasClass(element, value)) {
        element.className += ' ' + value;
    }
};

/**
 * remove a class from an element
 * @param {Object} element the object to update
 * @param {String} value the class name
 * @returns {Boolean}
 */
var removeClass = function(element, value) {
    if (hasClass(element, value)) {
        var reg = new RegExp('(\\s|^)' + value + '(\\s|$)');
        element.className = element.className.replace(reg, ' ');
    }
};

/**
 * execute a HttpRequest
 * @param {String} url link of the file to run
 * @param {Boolean} jsonParse if response as JSON Array wished
 * @param {Function} callback function using the response
 * @return request's response as text or JSON array
 */
var runHttpRequest = function(url, jsonParsed, callback) {
    var xmlhttp;

    if (window.XMLHttpRequest) {
        // for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            // make sure callback is a function before continue
            if (typeof callback === 'function') {
                if (jsonParsed) {
                    var jsonArray = JSON.parse(xmlhttp.responseText);
                    callback(jsonArray);
                } else {
                    callback(xmlhttp.responseText);
                }
            }
        } else if (xmlhttp.readyState !== 4) {
        	callback('Wird geladen...');
        } else {
            callback(false);
        }
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
};

/**
 * set a cookie
 * @param {String} cookie_name  The name of the cookie
 * @param {String} cookie_value The value of the cookie
 * @param {Integer} expire_days The number of days the cookie must be saved
 */
var setCookie = function(cookie_name, cookie_value, expire_days) {
	var d = new Date();
    d.setTime(d.getTime() + (expire_days * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cookie_name + "=" + cookie_value + "; " + expires;	
};

/**
 * get a cookie
 * @param {String} cookie_name The name of the cookie
 * @return
 * 		if exists: the value of the cookie<br>
 * 		otherwise: a <em>null</em> object
 */
var getCookie = function(cookie_name) {
    var name = cookie_name + "=";
    var ca = document.cookie.split(';');
    
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return null;
};

/**
 * delete a cookie
 * @param {String} cookie_name The name of the cookie
 */
var deleteCookie = function(cookie_name) {
    var expires = "expires=Thu, 01 Jan 1970 00:00:00 UTC"
    document.cookie = cookie_name + "=; " + expires;
};
