
_agoraUrl = "http://sbh.yoons.com/hssb/cust/requestData";

//-----------------------------------------------------------------------------
// agora 파라미터 값 설정
// @return : Object
//-----------------------------------------------------------------------------
function fnInitAgora(type, arrIn, arrOut) {
	
	//console.log("type==>>" + type);
	//console.log("arrIn");
	//console.log(arrIn);
	//console.log("arrOut");
	//console.log(arrOut);
	var objResult = {};
	
    var p_nm = "";
    switch (type){
		case 'list':
			p_nm = 'U0JNVVNFUi5TQk1fUEtHX1BBUkVOVF9MRVRURVIuU1BfTF9GQU1JTFlfTEVUVEVS';
			break;
		case 'view':
			p_nm = 'U0JNVVNFUi5TQk1fUEtHX1BBUkVOVF9MRVRURVIuU1BfTF9MRVRURVJfREVUQUlM';
			break;
		case 'insert':
			p_nm = 'U0JNVVNFUi5TQk1fUEtHX1BBUkVOVF9MRVRURVIuU1BfSV9GQU1JTFlfTEVUVEVS';
			break;
		case 'modify':
			p_nm = 'U0JNVVNFUi5TQk1fUEtHX1BBUkVOVF9MRVRURVIuU1BfVV9GQU1JTFlfTEVUVEVS';
			break;
		case 'delete':
			p_nm = 'U0JNVVNFUi5TQk1fUEtHX1BBUkVOVF9MRVRURVIuU1BfRF9MRVRURVJfREVUQUlM';
			break;
    }

    objResult['p_nm'] = p_nm;
    
    if (arrIn != null || arrIn != undefined) {
    	// 배열 확인
    	if (Array.isArray(arrIn)) {
    		for (var i = 0; i < arrIn.length; i++) {
    		    //console.log(arrIn[i]);
    		    objResult['in' + (i+1)] = arrIn[i];
    		}
    	}
    }
    
    if (arrOut != null || arrOut != undefined) {
    	// 배열 확인
    	if (Array.isArray(arrOut)) {
    		for (var i = 0; i < arrOut.length; i++) {
    		    //console.log(arrOut[i]);
    		    objResult['out' + (i+1)] = arrOut[i];
    		}
    	}
    } else {
	    objResult['out1'] = 'int';
    }
    return objResult;
    
}

//ajax json call - 비동기 방식(기본:로딩 화면 있음)
JsonCallAgora = function (params, reCall, showLoading) {
    //params = "paramList=" + JSON.stringify(params);
    if (showLoading == undefined) {
        showLoading = true;
    }    
    try {
        if (showLoading)
            global.showLoading(true);
        $.ajax({
            type: "POST",
            url: _agoraUrl,
            crossDomain: true,
            //contentType: "application/json; charset=utf-8",
            data: params,
            error : function(jqXHR, textStatus, errorThrown) {
                if (showLoading) {
                    global.showLoading(false);
                }
            },
            success: function (data) {
                if (showLoading) {
                    global.showLoading(false);
                }
                reCall(data);
            }
        });
    }
    catch (e) {
        alert("JsonCallAgora Error: " + e.message);
    }
};

// 캐리지 리턴 제거 - json 넘어온 데이터가 캐리지 리턴 등 사용된 데이터 일떄 
function rplLine(value){
    if (value != null && value != "") { 
        return value.replace(/\n/g, "\\n");
    }else{
        return value;
    }
}
// rplLine

// http://locutus.io/php/datetime/date/
function phpDate (format, timestamp) {
	  //  discuss at: http://locutus.io/php/date/
	  // original by: Carlos R. L. Rodrigues (http://www.jsfromhell.com)
	  // original by: gettimeofday
	  //    parts by: Peter-Paul Koch (http://www.quirksmode.org/js/beat.html)
	  // improved by: Kevin van Zonneveld (http://kvz.io)
	  // improved by: MeEtc (http://yass.meetcweb.com)
	  // improved by: Brad Touesnard
	  // improved by: Tim Wiel
	  // improved by: Bryan Elliott
	  // improved by: David Randall
	  // improved by: Theriault (https://github.com/Theriault)
	  // improved by: Theriault (https://github.com/Theriault)
	  // improved by: Brett Zamir (http://brett-zamir.me)
	  // improved by: Theriault (https://github.com/Theriault)
	  // improved by: Thomas Beaucourt (http://www.webapp.fr)
	  // improved by: JT
	  // improved by: Theriault (https://github.com/Theriault)
	  // improved by: Rafał Kukawski (http://blog.kukawski.pl)
	  // improved by: Theriault (https://github.com/Theriault)
	  //    input by: Brett Zamir (http://brett-zamir.me)
	  //    input by: majak
	  //    input by: Alex
	  //    input by: Martin
	  //    input by: Alex Wilson
	  //    input by: Haravikk
	  // bugfixed by: Kevin van Zonneveld (http://kvz.io)
	  // bugfixed by: majak
	  // bugfixed by: Kevin van Zonneveld (http://kvz.io)
	  // bugfixed by: Brett Zamir (http://brett-zamir.me)
	  // bugfixed by: omid (http://locutus.io/php/380:380#comment_137122)
	  // bugfixed by: Chris (http://www.devotis.nl/)
	  //      note 1: Uses global: locutus to store the default timezone
	  //      note 1: Although the function potentially allows timezone info
	  //      note 1: (see notes), it currently does not set
	  //      note 1: per a timezone specified by date_default_timezone_set(). Implementers might use
	  //      note 1: $locutus.currentTimezoneOffset and
	  //      note 1: $locutus.currentTimezoneDST set by that function
	  //      note 1: in order to adjust the dates in this function
	  //      note 1: (or our other date functions!) accordingly
	  //   example 1: date('H:m:s \\m \\i\\s \\m\\o\\n\\t\\h', 1062402400)
	  //   returns 1: '07:09:40 m is month'
	  //   example 2: date('F j, Y, g:i a', 1062462400)
	  //   returns 2: 'September 2, 2003, 12:26 am'
	  //   example 3: date('Y W o', 1062462400)
	  //   returns 3: '2003 36 2003'
	  //   example 4: var $x = date('Y m d', (new Date()).getTime() / 1000)
	  //   example 4: $x = $x + ''
	  //   example 4: var $result = $x.length // 2009 01 09
	  //   returns 4: 10
	  //   example 5: date('W', 1104534000)
	  //   returns 5: '52'
	  //   example 6: date('B t', 1104534000)
	  //   returns 6: '999 31'
	  //   example 7: date('W U', 1293750000.82); // 2010-12-31
	  //   returns 7: '52 1293750000'
	  //   example 8: date('W', 1293836400); // 2011-01-01
	  //   returns 8: '52'
	  //   example 9: date('W Y-m-d', 1293974054); // 2011-01-02
	  //   returns 9: '52 2011-01-02'
	  //        test: skip-1 skip-2 skip-5
	  var jsdate, f
	  // Keep this here (works, but for code commented-out below for file size reasons)
	  // var tal= [];
	  var txtWords = [
	    'Sun', 'Mon', 'Tues', 'Wednes', 'Thurs', 'Fri', 'Satur',
	    'January', 'February', 'March', 'April', 'May', 'June',
	    'July', 'August', 'September', 'October', 'November', 'December'
	  ]
	  // trailing backslash -> (dropped)
	  // a backslash followed by any character (including backslash) -> the character
	  // empty string -> empty string
	  var formatChr = /\\?(.?)/gi
	  var formatChrCb = function (t, s) {
	    return f[t] ? f[t]() : s
	  }
	  var _pad = function (n, c) {
	    n = String(n)
	    while (n.length < c) {
	      n = '0' + n
	    }
	    return n
	  }
	  f = {
	    // Day
	    d: function () {
	      // Day of month w/leading 0; 01..31
	      return _pad(f.j(), 2)
	    },
	    D: function () {
	      // Shorthand day name; Mon...Sun
	      return f.l()
	        .slice(0, 3)
	    },
	    j: function () {
	      // Day of month; 1..31
	      return jsdate.getDate()
	    },
	    l: function () {
	      // Full day name; Monday...Sunday
	      return txtWords[f.w()] + 'day'
	    },
	    N: function () {
	      // ISO-8601 day of week; 1[Mon]..7[Sun]
	      return f.w() || 7
	    },
	    S: function () {
	      // Ordinal suffix for day of month; st, nd, rd, th
	      var j = f.j()
	      var i = j % 10
	      if (i <= 3 && parseInt((j % 100) / 10, 10) === 1) {
	        i = 0
	      }
	      return ['st', 'nd', 'rd'][i - 1] || 'th'
	    },
	    w: function () {
	      // Day of week; 0[Sun]..6[Sat]
	      return jsdate.getDay()
	    },
	    z: function () {
	      // Day of year; 0..365
	      var a = new Date(f.Y(), f.n() - 1, f.j())
	      var b = new Date(f.Y(), 0, 1)
	      return Math.round((a - b) / 864e5)
	    },
	    // Week
	    W: function () {
	      // ISO-8601 week number
	      var a = new Date(f.Y(), f.n() - 1, f.j() - f.N() + 3)
	      var b = new Date(a.getFullYear(), 0, 4)
	      return _pad(1 + Math.round((a - b) / 864e5 / 7), 2)
	    },
	    // Month
	    F: function () {
	      // Full month name; January...December
	      return txtWords[6 + f.n()]
	    },
	    m: function () {
	      // Month w/leading 0; 01...12
	      return _pad(f.n(), 2)
	    },
	    M: function () {
	      // Shorthand month name; Jan...Dec
	      return f.F()
	        .slice(0, 3)
	    },
	    n: function () {
	      // Month; 1...12
	      return jsdate.getMonth() + 1
	    },
	    t: function () {
	      // Days in month; 28...31
	      return (new Date(f.Y(), f.n(), 0))
	        .getDate()
	    },
	    // Year
	    L: function () {
	      // Is leap year?; 0 or 1
	      var j = f.Y()
	      return j % 4 === 0 & j % 100 !== 0 | j % 400 === 0
	    },
	    o: function () {
	      // ISO-8601 year
	      var n = f.n()
	      var W = f.W()
	      var Y = f.Y()
	      return Y + (n === 12 && W < 9 ? 1 : n === 1 && W > 9 ? -1 : 0)
	    },
	    Y: function () {
	      // Full year; e.g. 1980...2010
	      return jsdate.getFullYear()
	    },
	    y: function () {
	      // Last two digits of year; 00...99
	      return f.Y()
	        .toString()
	        .slice(-2)
	    },
	    // Time
	    a: function () {
	      // am or pm
	      return jsdate.getHours() > 11 ? 'pm' : 'am'
	    },
	    A: function () {
	      // AM or PM
	      return f.a()
	        .toUpperCase()
	    },
	    B: function () {
	      // Swatch Internet time; 000..999
	      var H = jsdate.getUTCHours() * 36e2
	      // Hours
	      var i = jsdate.getUTCMinutes() * 60
	      // Minutes
	      // Seconds
	      var s = jsdate.getUTCSeconds()
	      return _pad(Math.floor((H + i + s + 36e2) / 86.4) % 1e3, 3)
	    },
	    g: function () {
	      // 12-Hours; 1..12
	      return f.G() % 12 || 12
	    },
	    G: function () {
	      // 24-Hours; 0..23
	      return jsdate.getHours()
	    },
	    h: function () {
	      // 12-Hours w/leading 0; 01..12
	      return _pad(f.g(), 2)
	    },
	    H: function () {
	      // 24-Hours w/leading 0; 00..23
	      return _pad(f.G(), 2)
	    },
	    i: function () {
	      // Minutes w/leading 0; 00..59
	      return _pad(jsdate.getMinutes(), 2)
	    },
	    s: function () {
	      // Seconds w/leading 0; 00..59
	      return _pad(jsdate.getSeconds(), 2)
	    },
	    u: function () {
	      // Microseconds; 000000-999000
	      return _pad(jsdate.getMilliseconds() * 1000, 6)
	    },
	    // Timezone
	    e: function () {
	      // Timezone identifier; e.g. Atlantic/Azores, ...
	      // The following works, but requires inclusion of the very large
	      // timezone_abbreviations_list() function.
	      /*              return that.date_default_timezone_get();
	       */
	      var msg = 'Not supported (see source code of date() for timezone on how to add support)'
	      throw new Error(msg)
	    },
	    I: function () {
	      // DST observed?; 0 or 1
	      // Compares Jan 1 minus Jan 1 UTC to Jul 1 minus Jul 1 UTC.
	      // If they are not equal, then DST is observed.
	      var a = new Date(f.Y(), 0)
	      // Jan 1
	      var c = Date.UTC(f.Y(), 0)
	      // Jan 1 UTC
	      var b = new Date(f.Y(), 6)
	      // Jul 1
	      // Jul 1 UTC
	      var d = Date.UTC(f.Y(), 6)
	      return ((a - c) !== (b - d)) ? 1 : 0
	    },
	    O: function () {
	      // Difference to GMT in hour format; e.g. +0200
	      var tzo = jsdate.getTimezoneOffset()
	      var a = Math.abs(tzo)
	      return (tzo > 0 ? '-' : '+') + _pad(Math.floor(a / 60) * 100 + a % 60, 4)
	    },
	    P: function () {
	      // Difference to GMT w/colon; e.g. +02:00
	      var O = f.O()
	      return (O.substr(0, 3) + ':' + O.substr(3, 2))
	    },
	    T: function () {
	      // The following works, but requires inclusion of the very
	      // large timezone_abbreviations_list() function.
	      /*              var abbr, i, os, _default;
	      if (!tal.length) {
	        tal = that.timezone_abbreviations_list();
	      }
	      if ($locutus && $locutus.default_timezone) {
	        _default = $locutus.default_timezone;
	        for (abbr in tal) {
	          for (i = 0; i < tal[abbr].length; i++) {
	            if (tal[abbr][i].timezone_id === _default) {
	              return abbr.toUpperCase();
	            }
	          }
	        }
	      }
	      for (abbr in tal) {
	        for (i = 0; i < tal[abbr].length; i++) {
	          os = -jsdate.getTimezoneOffset() * 60;
	          if (tal[abbr][i].offset === os) {
	            return abbr.toUpperCase();
	          }
	        }
	      }
	      */
	      return 'UTC'
	    },
	    Z: function () {
	      // Timezone offset in seconds (-43200...50400)
	      return -jsdate.getTimezoneOffset() * 60
	    },
	    // Full Date/Time
	    c: function () {
	      // ISO-8601 date.
	      return 'Y-m-d\\TH:i:sP'.replace(formatChr, formatChrCb)
	    },
	    r: function () {
	      // RFC 2822
	      return 'D, d M Y H:i:s O'.replace(formatChr, formatChrCb)
	    },
	    U: function () {
	      // Seconds since UNIX epoch
	      return jsdate / 1000 | 0
	    }
	  }
	  var _date = function (format, timestamp) {
	    jsdate = (timestamp === undefined ? new Date() // Not provided
	      : (timestamp instanceof Date) ? new Date(timestamp) // JS Date()
	      : new Date(timestamp * 1000) // UNIX timestamp (auto-convert to int)
	    )
	    return format.replace(formatChr, formatChrCb)
	  }
	  return _date(format, timestamp)
	}

function phpSprintf () {
	  //  discuss at: http://locutus.io/php/sprintf/
	  // original by: Ash Searle (http://hexmen.com/blog/)
	  // improved by: Michael White (http://getsprink.com)
	  // improved by: Jack
	  // improved by: Kevin van Zonneveld (http://kvz.io)
	  // improved by: Kevin van Zonneveld (http://kvz.io)
	  // improved by: Kevin van Zonneveld (http://kvz.io)
	  // improved by: Dj
	  // improved by: Allidylls
	  //    input by: Paulo Freitas
	  //    input by: Brett Zamir (http://brett-zamir.me)
	  //   example 1: sprintf("%01.2f", 123.1)
	  //   returns 1: '123.10'
	  //   example 2: sprintf("[%10s]", 'monkey')
	  //   returns 2: '[    monkey]'
	  //   example 3: sprintf("[%'#10s]", 'monkey')
	  //   returns 3: '[####monkey]'
	  //   example 4: sprintf("%d", 123456789012345)
	  //   returns 4: '123456789012345'
	  //   example 5: sprintf('%-03s', 'E')
	  //   returns 5: 'E00'
	  var regex = /%%|%(\d+\$)?([-+'#0 ]*)(\*\d+\$|\*|\d+)?(?:\.(\*\d+\$|\*|\d+))?([scboxXuideEfFgG])/g
	  var a = arguments
	  var i = 0
	  var format = a[i++]
	  var _pad = function (str, len, chr, leftJustify) {
	    if (!chr) {
	      chr = ' '
	    }
	    var padding = (str.length >= len) ? '' : new Array(1 + len - str.length >>> 0).join(chr)
	    return leftJustify ? str + padding : padding + str
	  }
	  var justify = function (value, prefix, leftJustify, minWidth, zeroPad, customPadChar) {
	    var diff = minWidth - value.length
	    if (diff > 0) {
	      if (leftJustify || !zeroPad) {
	        value = _pad(value, minWidth, customPadChar, leftJustify)
	      } else {
	        value = [
	          value.slice(0, prefix.length),
	          _pad('', diff, '0', true),
	          value.slice(prefix.length)
	        ].join('')
	      }
	    }
	    return value
	  }
	  var _formatBaseX = function (value, base, prefix, leftJustify, minWidth, precision, zeroPad) {
	    // Note: casts negative numbers to positive ones
	    var number = value >>> 0
	    prefix = (prefix && number && {
	      '2': '0b',
	      '8': '0',
	      '16': '0x'
	    }[base]) || ''
	    value = prefix + _pad(number.toString(base), precision || 0, '0', false)
	    return justify(value, prefix, leftJustify, minWidth, zeroPad)
	  }
	  // _formatString()
	  var _formatString = function (value, leftJustify, minWidth, precision, zeroPad, customPadChar) {
	    if (precision !== null && precision !== undefined) {
	      value = value.slice(0, precision)
	    }
	    return justify(value, '', leftJustify, minWidth, zeroPad, customPadChar)
	  }
	  // doFormat()
	  var doFormat = function (substring, valueIndex, flags, minWidth, precision, type) {
	    var number, prefix, method, textTransform, value
	    if (substring === '%%') {
	      return '%'
	    }
	    // parse flags
	    var leftJustify = false
	    var positivePrefix = ''
	    var zeroPad = false
	    var prefixBaseX = false
	    var customPadChar = ' '
	    var flagsl = flags.length
	    var j
	    for (j = 0; j < flagsl; j++) {
	      switch (flags.charAt(j)) {
	        case ' ':
	          positivePrefix = ' '
	          break
	        case '+':
	          positivePrefix = '+'
	          break
	        case '-':
	          leftJustify = true
	          break
	        case "'":
	          customPadChar = flags.charAt(j + 1)
	          break
	        case '0':
	          zeroPad = true
	          customPadChar = '0'
	          break
	        case '#':
	          prefixBaseX = true
	          break
	      }
	    }
	    // parameters may be null, undefined, empty-string or real valued
	    // we want to ignore null, undefined and empty-string values
	    if (!minWidth) {
	      minWidth = 0
	    } else if (minWidth === '*') {
	      minWidth = +a[i++]
	    } else if (minWidth.charAt(0) === '*') {
	      minWidth = +a[minWidth.slice(1, -1)]
	    } else {
	      minWidth = +minWidth
	    }
	    // Note: undocumented perl feature:
	    if (minWidth < 0) {
	      minWidth = -minWidth
	      leftJustify = true
	    }
	    if (!isFinite(minWidth)) {
	      throw new Error('sprintf: (minimum-)width must be finite')
	    }
	    if (!precision) {
	      precision = 'fFeE'.indexOf(type) > -1 ? 6 : (type === 'd') ? 0 : undefined
	    } else if (precision === '*') {
	      precision = +a[i++]
	    } else if (precision.charAt(0) === '*') {
	      precision = +a[precision.slice(1, -1)]
	    } else {
	      precision = +precision
	    }
	    // grab value using valueIndex if required?
	    value = valueIndex ? a[valueIndex.slice(0, -1)] : a[i++]
	    switch (type) {
	      case 's':
	        return _formatString(value + '', leftJustify, minWidth, precision, zeroPad, customPadChar)
	      case 'c':
	        return _formatString(String.fromCharCode(+value), leftJustify, minWidth, precision, zeroPad)
	      case 'b':
	        return _formatBaseX(value, 2, prefixBaseX, leftJustify, minWidth, precision, zeroPad)
	      case 'o':
	        return _formatBaseX(value, 8, prefixBaseX, leftJustify, minWidth, precision, zeroPad)
	      case 'x':
	        return _formatBaseX(value, 16, prefixBaseX, leftJustify, minWidth, precision, zeroPad)
	      case 'X':
	        return _formatBaseX(value, 16, prefixBaseX, leftJustify, minWidth, precision, zeroPad)
	        .toUpperCase()
	      case 'u':
	        return _formatBaseX(value, 10, prefixBaseX, leftJustify, minWidth, precision, zeroPad)
	      case 'i':
	      case 'd':
	        number = +value || 0
	        // Plain Math.round doesn't just truncate
	        number = Math.round(number - number % 1)
	        prefix = number < 0 ? '-' : positivePrefix
	        value = prefix + _pad(String(Math.abs(number)), precision, '0', false)
	        return justify(value, prefix, leftJustify, minWidth, zeroPad)
	      case 'e':
	      case 'E':
	      case 'f': // @todo: Should handle locales (as per setlocale)
	      case 'F':
	      case 'g':
	      case 'G':
	        number = +value
	        prefix = number < 0 ? '-' : positivePrefix
	        method = ['toExponential', 'toFixed', 'toPrecision']['efg'.indexOf(type.toLowerCase())]
	        textTransform = ['toString', 'toUpperCase']['eEfFgG'.indexOf(type) % 2]
	        value = prefix + Math.abs(number)[method](precision)
	        return justify(value, prefix, leftJustify, minWidth, zeroPad)[textTransform]()
	      default:
	        return substring
	    }
	  }
	  return format.replace(regex, doFormat)
	}