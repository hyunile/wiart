<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>

<script type="text/javascript" src="/SEeditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
/****************************************
* 전역변수 선언
****************************************/
// 개발 디버그 모드 시작 - /js/common/common.js 참조

_debug = true;          //디버깅 모드 설정용, 각 페이지에서 true로 설정하면, 오류를 alert 창으로 표시한다.
_notRedirection = true; //페이지 이동 금지 설정용, 각 페이지에서 true로 설정하면, 페이지 이동하지 않는다.
// 개발 디버그 모드 끝
NOW_MENU_TYPE = "update";

var oEditors = [];

$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "contents",
	    sSkinURI: "/SEeditor/SmartEditor2Skin.html",    
	    htParams : {
	    	bUseToolbar : true,
	        fOnBeforeUnload : function(){
	            //alert("아싸!"); 
	        },
	        bUseVerticalResizer : true,
	        bUseModeChanger : true,
	    }, //boolean
	    fOnAppLoad : function(){
	        //예제 코드
	        //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	    },
	    fCreator: "createSEditor2"
	});
	
	//등록
	$("#btnUpdate").click(function(){
		
		goUpdate();
	})
});    

function pasteHTML() {
    var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
    oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
    var sHTML = oEditors.getById["contents"].getIR();
    return sHTML;
}
function goUpdate(elClickedObj) {
    oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
    sHTML = showHTML();
    
   	var subject = LTrim($("#subject").val());
	var contents = LTrim($("#contents").val());
	var title_type = LTrim($("#title_type").val());
	
	if(subject == ""){
		alert("제목을 입력해주세요.");
		$("#subject").focus();
		return;
	}
	if(contents == ""){
		alert("내용을 입력해주세요.");
		$("#contents").focus();
		return;
	}
	
	console.log("subject : " , subject);
	console.log("contents : " , contents);
	console.log("title_type : " , title_type);
    
    try {

        if( ! sHTML || sHTML =="<br>"  || sHTML =='<p>&nbsp;</p>')
        {
            alert("내용을 입력해 주세요");
            return false;
        }    
      /*   
    	var param = {
    			subject : subject,
    			contents : contents,
    			title_type : title_type
    	}
      */
      var param = jQuery('#frmMain').serialize();
      var no = $("#no").val();
      //var param = new FormData(document.getElementById("frmMain"));
      //var param = document.forms['frmMain'];
      //console.log('param ;' + JSON.stringify(param)); return;
     console.log("no : " + no);
     console.log("param : " + param);
      
    	$.ajax({   
    		type: "POST",  
    		url: "/notice/noticeUpdate",   
    		data : param,
    		async : true,
    		//dataType : 'json',
    		//processData: false,
    	    //contentType: false,
    		success:function(result) {
    			console.log("result ? : " + JSON.stringify(result.cnt));
    			if(result.cnt == 1){
    				location.href="/notice/view?no="+no;
    			}else{
    				alert("수정에 실패하였습니다. 관리자에 문의 바랍니다.");
    			}
    		}, 
    		error: function(x, o, e){
    			//alert(x.status + " : "+ o +" : "+e + "111");
    			alert("수에 실패하였습니다. 관리자에 문의 바랍니다.");
    		}
    	});
/*         
        var frm = document.forms['frmMain'];

        frm.action = "/notice/noticeWrite";
        frm.method = "post";
        frm.submit();
  */
 
    } catch(e) {
    	alert(e);
    }
}

function setDefaultFont() {
    var sDefaultFont = '궁서';
    var nFontSize = 24;
    oEditors.getById["contents"].setDefaultFont(sDefaultFont, nFontSize);
}

var redo_text = new Array("", "", "", "", "", "", "", "", "", "");

function checkTextarea(ths,num,size) {

    var f = document.forms['frmMain'];
    var val = ths.value;
    var len = val.length;

    if (len > size) {
        alert("한글"+size+"이하로 입력하시기 바랍니다.");
        ths.value = redo_text[num];
    }
    redo_text[num] = ths.value;
}
    
</script>

<div class="sb-site-container">
    <div class="container">   
              <!-- form -->
        <form name="frmMain" id="frmMain" accept-charset="utf-8" enctype="multipart/form-data">
	        <input type="hidden" id="no" name="no" value="${result.no}">
            <div class="form-group">
            <label for="select">type</label>
			<select class="col-sm-5 form-control" name="title_type" id="title_type">
	            <option value="0">말머리없음</option>
	            <option value="1">[알림]</option>
	            <option value="2">[공지사항]</option>
            </select>
            </div>
            <div class="form-group">
              <label for="inputEmail3">제목</label>
              <input type="text" class="form-control" name="subject" id="subject" value="${result.title}" onchange="checkTextarea(this,0,14)" onkeyup="checkTextarea(this,0,14)">
            </div>
			<div class="form-group">
			<label for="inputEmail3">내용</label>
	          <textarea name="contents" id="contents" rows="10" cols="100" style="width:100%; height:400px; display:none;">${result.content}</textarea>
			</div>
			<div class="form-group">
			  <input type="file" id="noticFile" name="noticFile">
			  <a href="#" id="btn_fileReset" class="btn-white btn-small">삭제</a>
			</div>
			
          <div class="table-button">
          	<button type="button" class="btn btn-default pull-right" id="btnUpdate"><i class="fa fa-floppy-o" aria-hidden="true"></i> 저장</button>
            <button type="button" class="btn btn-default pull-right" id="btnCancel" onclick="javascript:history.back(-1);"><i class="fa fa-times" aria-hidden="true"></i> 취소</button>
          </div>
        </form>
        
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
