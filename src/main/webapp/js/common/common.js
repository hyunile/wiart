/****************************************
* 공통 상수 선언
****************************************/

$.fn.Global = function () {
    this.isLoading = false;
    this.loadingNum = 0;
    this.Init();
};
$.fn.Global.prototype = {
    Init: function () {
        var G = this;
    },
    showLoading: function (showYN, validateReservation) {
        var G = this;
        G.validateReservation = (validateReservation != undefined) ? validateReservation : false;

        if (showYN) {
            ++G.loadingNum;
            if (!G.isLoading) {
                G.isLoading = true;
                //if(!G.validateReservation){
                //$('body').append('<div class="d_loading" style="position:fixed; top:50%; left:50%; z-index:9999;"><img src="/images/viewLoading.gif" alt="데이터 로딩중입니다. 잠시만 기다려 주세요."/></div>');  // 1603313
                //화면의 높이와 너비를 구한다.
                var maskHeight = $(document).height(); 
//              var maskWidth = $(document).width();
                var maskWidth = window.document.body.clientWidth;

                var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
                var loadingImg = '';
                loadingImg += "<div id='loadingImg' style='position:absolute; left:50%; top:40%; display:none; z-index:10000;'>";
                loadingImg += " <img src='/images/ajax_loader_blue_64.gif'/>";
                loadingImg += "</div>";  
                //화면에 레이어 추가
                $('body')
                    .append(mask)
                    .append(loadingImg)

                //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		        $('#mask').css({
		                'width' : maskWidth
		                , 'height': maskHeight
		                , 'opacity' : '0.3'
		        }); 
              //마스크 표시
                $('#mask').show();   
             
                //로딩중 이미지 표시
                $('#loadingImg').show();

                //}
                //else {
                //    $('body').append('<div class="d_loading" style="position:fixed; top:50%; left:50%; z-index:100; margin-left: -90px; margin-top: -40px;"><img src="/LCHS/Image/preloader_icon.GIF" alt="결제 진행 중에 브라우져를 닫으시면 결제가 취소 됩니다. 결제가 진행중입니다. 잠시만 기다려주세요. 결제진행 시간은 시스템 환경에 다라 최대 10분가량 소요될 수 있습니다."/></div>');
                //}
            }
        } else {
            --G.loadingNum;
            if (G.isLoading == true && G.loadingNum == 0) {
                //if ($('body').find('.d_loading')[0] != undefined) $('.d_loading').remove();
                if ($('body').find('#mask')[0] != undefined) {
                	$('#mask').remove();
                	$('#loadingImg').remove();
                }
                G.isLoading = false;
            }
        }

    }
};
var global = new $.fn.Global();

// ajax json call - 비동기 방식(기본:로딩 화면 있음)
JsonCall = function (url, params, reCall, showLoading) {
    //params = "paramList=" + JSON.stringify(params);
    if (showLoading == undefined) {
        showLoading = true;
    }    
    try {
        if (showLoading)
            global.showLoading(true);
        $.ajax({
            type: "post",
            //async:false,
            url: url + "?nocashe=" + String(Math.random()),
            //dataType: "json",
            data: params,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",             
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-Encoding", "gzip");
            },
            fail: function (data) {
                if (showLoading)
                    global.showLoading(false);
            },
            complete: function (data) {
                if (showLoading)
                    global.showLoading(false);
                reCall(data);
            }
        });
    }
    catch (e) {
        alert("JSON Error: " + e.message);
    }
};

//ajax json call - 동기 방식(로딩 화면 없음)
JsonCallSync = function (url, params, reCall) {
    //params = "paramList=" + JSON.stringify(params);

    try {
        $.ajax({
            type: "post",
            async: false,
            url: url + "?nocashe=" + String(Math.random()),
            //dataType: "json",
            data: params,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-Encoding", "gzip");
            },
            fail: function (data) {
            },
            complete: function (data) {
                reCall(data);
            }
        });
    }
    catch (e) {
        alert("JSON Error: " + e.message);
    }
};

//ajax json call - 동기 방식(데이터 바로 받음)
JsonReturnDataSync = function (url, params) {
    //params = "paramList=" + JSON.stringify(params);
    var jsonVal = "";
    try {
        $.ajax({
            type: "post",
            async: false,
            url: url + "?nocashe=" + String(Math.random()),
            //dataType: "json",
            data: params,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-Encoding", "gzip");
            },
            fail: function (data) {
            },
            complete: function (data) {
                jsonVal = data;
            }
        });
        return jsonVal;
    }
    catch (e) {
        alert("JSON Error: " + e.message);
    }
};
/****************************************
* 타입에 따라 링크 이동 방법이 바뀐다.
* url : 링크 주소
* type : 3 :return url, 2:window.open(), 그외:windows.location
****************************************/
goUrl = function (url, type) {
    // type 기본값 설정
    type = (type == undefined) ? '1' : type;
    if (type == "") {
        type = "1"; //1:링크
    }
    if (type == "3") {
        return url;
    } else if (type == "2") {
        if (url == "") {
            alert(' 개발 중');
        } else {
            window.open(url, '_blank');//새창링크
        }
    } else {
        if (url == "") {
            alert(' 개발 중');
        } else {
            location.href = url;//링크
        }
    }
}

/**************************************
* 예외 처리 
**************************************/
var _debug;					//디버깅 모드 설정용, 각 페이지에서 true로 설정하면, 오류를 alert 창으로 표시한다.
var _notRedirection;		//페이지 이동 금지 설정용, 각 페이지에서 true로 설정하면, 페이지 이동하지 않는다.
//오류발생시 처리
//params>
//		e: Exception 객체
//		headerText: 오류 구분용 Header Text
//		menu: 메뉴 구분자, 페이지 이동 등의 메뉴별 오류 처리용 구분자, null || "" 일 때 이동하지 않는다.
//return>
checkException = function (e, headerText, menu) {
    //디버깅 모드 이면 메시지 창으로 오류 표시
    if (_debug) {
        var sb = new StringBuilder();
        sb.AppendFormat("* Error [ {0} ]\n\n* Message:  {1}\n\n* Stack:\n{2}", headerText, e.message, e.stack);
        alert(sb.ToString());
    } else {
        //디버딩 모드가 아닐 때 오류 공통 처리
    }

    //화면 이동 금지 상태 이면 return
    if (_notRedirection) {
        return;
    } else {
        //메뉴별 화면 이동 처리
        switch (menu) {
            case "main":
                break;
        }
    }

}

// 파라미터 받아오기
// 사용법 : var param = getParameters();
function getParameters() {
    var searchString = window.location.search.substring(1),
      params = searchString.split("&"),
      hash = {};

    if (searchString == "") return {};
    for (var i = 0; i < params.length; i++) {
        var val = params[i].split("=");
        hash[unescape(val[0])] = unescape(val[1]);
    }

    return hash;
}

//휴대폰 번호 Array 형식으로 변환
getMemberInfoHandPhoneArray = function (phoneNum) {
    var hpArray = [];

    if (phoneNum == undefined || phoneNum == '')
        return hpArray;

    var hpLen = phoneNum.length;
    var hp1 = '';
    var hp2 = '';
    var hp3 = '';

    if (hpLen == 13) {// 13자리 번호 일때 : 010-2222-3333
        hp1 = phoneNum.substring(0, 3);
        hp2 = phoneNum.substring(4, 8);
        hp3 = phoneNum.substring(9);
    } else if (hpLen == 12) {// 12자리 번호 일때 : 010-222-3333
        hp1 = phoneNum.substring(0, 3);
        hp2 = phoneNum.substring(4, 7);
        hp3 = phoneNum.substring(8);
    } else if (hpLen == 11) {// 11자리 번호 일때 : 01022223333
        hp1 = phoneNum.substring(0, 3);
        hp2 = phoneNum.substring(3, 7);
        hp3 = phoneNum.substring(7);
    } else if (hpLen == 10) {// 10자리 번호 일때 : 0102223333
        hp1 = phoneNum.substring(0, 3);
        hp2 = phoneNum.substring(3, 6);
        hp3 = phoneNum.substring(6);
    } else {
        hp1 = phoneNum.substring(0, 3);
        hp2 = phoneNum.substring(3, 7);
        hp3 = phoneNum.substring(7);
    }

    hpArray.push(hp1);
    hpArray.push(hp2);
    hpArray.push(hp3);

    return hpArray;
}

//메인 화면으로 이동 한다.
//params>
//return>
goToMain = function () {
    $(location).attr("href", "/com/main.do");
}

//팝업창을 띠운다
//sUrl - 띠울 URL
//sFrame - 띠울이름
//sFeature - 창 속성
openDialog = function (sUrl, sFrame, sFeature) {
    var op = window.open(sUrl, sFrame, sFeature);
    return op;
}

var ctrlDown = false;
//숫자만 입력 Input Key Event
//params>
//return>
//$("#userName").attr("onkeydown", "onlyNumberInputEvent(event);");
onlyNumberInputEvent = function (event) {
    try {
        var ctrlKey = 17, vKey = 86, cKey = 67;
        var key = event.which || event.keyCode;
        // backspace:8
        // tab:9
        // delete:46
        if (key == 8 || key == 9 || key == 46) {
            // 키 통과
        } else {
            if (ctrlDown && (key == 86 || key == 67)) {

            }
            else if (key >= 48 && key <= 57) {
                // 숫자 확인
            }
            else if (key >= 96 && key <= 105) {
                // 숫자 확인
            } else {
                //이벤트 해제
                if (event.preventDefault) {
                    event.preventDefault();
                } else {
                    event.returnValue = false;
                }
            }
        }
    } catch (e) {
    }
}

$(function () {
    $.fn.ClientInfo = function () {
        this.channelType = "HO";
        this.browserAgent = "";
        this.browserVersion = "";
        this.Init();
    };
    $.fn.ClientInfo.prototype = {
        Init: function () {
            this.browserAgent = this.BrowserAgent();
            this.browserVersion = navigator.userAgent;
        },
        BrowserAgent: function () {
            var _ua = navigator.userAgent;
            var result = "";

            //IE 11,10,9,8
            var trident = _ua.match(/Trident\/(\d.\d)/i);
            if (trident != null) {
                if (trident[1] == "7.0") return result = "IE" + 11;
                if (trident[1] == "6.0") return result = "IE" + 10;
                if (trident[1] == "5.0") return result = "IE" + 9;
                if (trident[1] == "4.0") return result = "IE" + 8;
            }

            //IE 7...
            if (navigator.appName == 'Microsoft Internet Explorer') return result = "IE" + 7;

            /*
            var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
            if(re.exec(_ua) != null) result = parseFloat(RegExp.$1);
            if( result == 7 ) return result = "IE" + 7; 
            */

            //other
            var agt = _ua.toLowerCase();
            if (agt.indexOf("chrome") != -1) return result = 'Chrome';
            if (agt.indexOf("opera") != -1) return result = 'Opera';
            if (agt.indexOf("staroffice") != -1) return result = 'Star Office';
            if (agt.indexOf("webtv") != -1) return result = 'WebTV';
            if (agt.indexOf("beonex") != -1) return result = 'Beonex';
            if (agt.indexOf("chimera") != -1) return result = 'Chimera';
            if (agt.indexOf("netpositive") != -1) return result = 'NetPositive';
            if (agt.indexOf("phoenix") != -1) return result = 'Phoenix';
            if (agt.indexOf("firefox") != -1) return result = 'Firefox';
            if (agt.indexOf("safari") != -1) return result = 'Safari';
            if (agt.indexOf("skipstone") != -1) return result = 'SkipStone';
            if (agt.indexOf("netscape") != -1) return result = 'Netscape';
            if (agt.indexOf("mozilla/5.0") != -1) return result = 'Mozilla';

            return result;
        },
        Android: function () {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function () {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function () {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        isiPad: function () {
            return navigator.userAgent.match(/iPad/i);
        },
        isiPhone: function () {
            return navigator.userAgent.match(/iPhone|iPod/i);
        },
        Opera: function () {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function () {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function () {
            return (this.Android() || this.BlackBerry() || this.iOS() || this.Opera() || this.Windows());
        },
        Chrome: function () {
            return navigator.userAgent.match(/Chrome/i);
        },
    };
});

/*********************************************************************************************** 
*  @Description : 페이지 공통 시작
*  @param : totalcount - 전체 게시물 갯수
*  @param : pageno - 현재 페이지 번호
*  @param : blocksize - 화면 당 리스트 갯수
*  @param : pageBoxSize - 하단 링크 갯수
*  @param : scriptCallName - 링크 호출 javascript 함수명
*  
************************************************************************************************/
function pageDisplay(totalcount, pageno, blocksize, pageBoxSize, scriptCallName) {
	var sbPaging = new StringBuilder();
	
	totalcount = (totalcount == undefined) ? '0' : parseInt(totalcount, 10);
	pageno = (pageno == undefined) ? '0' : parseInt(pageno, 10);
	blocksize = (blocksize == undefined) ? '0' : parseInt(blocksize, 10);
	pageBoxSize = (pageBoxSize == undefined) ? '0' : parseInt(pageBoxSize, 10);

	var currentBoxSize = Math.ceil(pageno / pageBoxSize);// 현재 page block 번호
	var startPageNo = Math.ceil((currentBoxSize - 1) * pageBoxSize) + 1;// 시작할 페이지 번호
	var endPageNo = currentBoxSize * pageBoxSize;// block당 마지막 페이지 번호
	var totalPageNo = Math.ceil((totalcount) / blocksize);// 총 페이지 번호
	//console.log(totalPageNo);
	//var scriptCallName = '';
	//scriptCallName = 'viewListNumberSearch';

	// 시작 div
	//sbPaging.Append('\n<ul class="pagination">');
	
	if (pageno > 1) {
		// 맨 처음
		sbPaging.AppendFormat('\n<li><a href="javascript:void(0);" onclick="javascript:{0}(1); return false;" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>', scriptCallName);
		// 이전 pageBoxSize 만큼 이동
		//if (startPageNo > 1) {
		sbPaging.AppendFormat('\n<li><a href="javascript:void(0);" onclick="javascript:{1}({0}); return false;" aria-label="Previous"><span aria-hidden="true">&lt;</span></a></li>', pageno - 1, scriptCallName);
	}
	// 번호
	for (i = startPageNo; i <= endPageNo; i++) {
		if (i <= totalPageNo) {
			var classname = '';
			if (i == pageno) {
				classname = ' class="active"';
			} else {
				classname = '';
			}
			sbPaging.AppendFormat('\n<li{2}><a href="javascript:void(0);" onclick="javascript:{1}({0}); return false;">{0}</a>', i, scriptCallName, classname);
		}
	}
	if (totalPageNo > 1 && pageno < totalPageNo) {
		// 다음 pageBoxSize 만큼 이동
		sbPaging.AppendFormat('\n<li><a href="javascript:void(0);" onclick="javascript:{1}({0}); return false;" aria-label="Next"><span aria-hidden="true">&gt;</span></a></li>', pageno + 1, scriptCallName);
		// 마지막
		sbPaging.AppendFormat('\n<li><a href="javascript:void(0);" onclick="javascript:{1}({0}); return false;" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>', totalPageNo, scriptCallName);
	}
	$('.pagination').html(sbPaging.ToString());
};

//===================================
/**
 * @Content 다운로드
 * @param
 *		fileFullPath : 파일 패스
 *		fileName : 파일명
 * @return
 **/
goFileDownload = function (fileFullPath, fileName) {
    try {
        var param = "?fileFullPath=" + fileFullPath + "&fileName=" + fileName;
        var url = CinemaServerDomain + "/LCHS/Contents/Common/download.aspx" + param;
        goUrl(url, '1');
    } catch (e) {
        checkException(e, "goFileDownload", NOW_MENU_TYPE);					//오류 발생 처리
    }
}

//===================================
/**
 * @Content 이전 페이지로 이동
 * @param
 * @return
 **/
locationBack = function () {
	history.back(-1);
	return;
}
