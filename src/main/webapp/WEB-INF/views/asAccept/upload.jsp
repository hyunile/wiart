<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@page import="java.io.*"%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>

<!-- <script type="text/javascript" src="/SEeditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/editor/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"> </script>
<script type="text/javascript" src="/js/jquery.form.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
/****************************************
* 전역변수 선언
****************************************/
// 개발 디버그 모드 시작 - /js/common/common.js 참조

_debug = true;          //디버깅 모드 설정용, 각 페이지에서 true로 설정하면, 오류를 alert 창으로 표시한다.
_notRedirection = true; //페이지 이동 금지 설정용, 각 페이지에서 true로 설정하면, 페이지 이동하지 않는다.
// 개발 디버그 모드 끝
NOW_MENU_TYPE = "write";

var oEditors = [];

$(function(){
	
	var domElearray = [$("#noticFile").clone()];//원본 복사
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "contents",
	    sSkinURI: "/editor/SmartEditor2Skin.html",    
	    htParams : {
	    	//툴바 사용 여
	    	bUseToolbar : true,
	        //입력창 크기 조절바 사용 여
	        bUseVerticalResizer : true,
	        
	        //모드
	        bUseModeChanger : true,
	    }
	});
	
	//등록
	$("#btnWrite").click(function(){
		/* 
		var subject = LTrim($("#subject").val());
		var contents = LTrim($("#contents").val());
		var title_type = LTrim($("#title_type").val());
		console.log("subject : " , subject);
		console.log("contents : " , contents);
		console.log("title_type : " , title_type);
		return;
		 */
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
//oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
		goWriteAction();
	})
});    

//textArea 에 이미지 첨
function pasteHTML(filepath) {
    var sHTML = '<img src="/editor/SmartEditor2Skin.html'+ filepath +'">';
    oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
    var sHTML = oEditors.getById["contents"].getIR();
    return sHTML;
}
function goWriteAction() {
    //oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
    var param = new FormData(document.getElementById('frmMain'));
    
    console.log("param" + JSON.stringify(param));
    
    /* var subject = LTrim($("#subject").val());
	var contents = LTrim($("#contents").val());
	var title_type = LTrim($("#title_type").val());
	 */
	
	console.log("subject : " , subject);
	console.log("contents : " , contents);
	console.log("title_type : " , title_type);
    
    	$.ajax({   
    		type: "POST",  
    		url: "/asAccept/writeAction",   
    		data : param,
    		async : true,
			processData: false,
		    contentType: false,
    		success:function(data) {
    			console.log("data ? : " + data);
    			resultMsg = data.resultMsg;
    			console.log("result ? : " + JSON.stringify(resultMsg));
    			if(data.returnMsg == "true"){
    				result = true;
    				alert("성공");
    			}else{
    				result = false;
    				alert("실패");
    			}
    			
/*     			
    			console.log("result ? : " + JSON.stringify(result.cnt));
    			if(result.cnt == 1){
    				location.href="/notice/list";
    			}else{
    				alert("등록에 실패하였습니다. 관리자에 문의 바랍니다.");
    			}
    			 */
    		}, 
    		error: function(x, o, e){
    			//alert(x.status + " : "+ o +" : "+e + "111");
    			alert("등록에 실패하였습니다. 관리자에 문의 바랍니다.");
    		}
    	});

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
              <!-- <input type="text" class="form-control" name="subject" id="subject" value="" onchange="checkTextarea(this,0,14)" onkeyup="checkTextarea(this,0,14)"> -->
              <input type="text" class="form-control" name="subject" id="subject" value="">
            </div>
			<div class="form-group">
			<label for="inputEmail3">내용</label>
			  <input type="hidden" id="contentsChk">		
	          <textarea name="contents" id="contents" rows="10" cols="100" style="width:100%; height:400px;"></textarea>
			</div>
			
            <%--첨부파일 영역 추가--%>
            <div class="form-group">
                <div class="fileDrop">
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
                </div>
            </div>
            <%--첨부파일 영역 추가--%>			
			<div class="form-group">
			  <input type="file" id="noticFile" name="noticFile">
			  <a href="#" id="btn_fileReset" class="btn-white btn-small">삭제</a>
			</div>
			
          <div class="table-button">
          	<button type="button" class="btn btn-default pull-right" id="btnWrite"><i class="fa fa-floppy-o" aria-hidden="true"></i> 저장</button>
            <button type="button" class="btn btn-default pull-right" id="btnCancel" onclick="javascript:history.back(-1);"><i class="fa fa-times" aria-hidden="true"></i> 취소</button>
          </div>
        </form>
        
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
