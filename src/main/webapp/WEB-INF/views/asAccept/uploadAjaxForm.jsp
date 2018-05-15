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
<style>
    .fileDrop {
        width:600px;
        height: 300px;
        border: 1px dotted blue;
    }

    small {
        margin-left: 3px;
        font-weight: bold;
        color: gray;
    }
</style>
<script type="text/javascript">
	/**
		파일업로드 영역에 텍스트 파일 또는 이미지파일을 드래그했을 때 내용이 바로 보여지는 기본효과를 막기 위해서 jQuery에
		event.preventDefault(); 코드를 작성한다.
		ajax로 전달할 폼객체를 생성하고 file을 전달할 때는 ajax옵션 속성을 type:post, processData: false, contentType:false로 설정한다. 
	*/
	<%-- var path = <%= request.getContextPath()%>; --%>
	
	$(function(){
 		$(".fileDrop").on("dragenter dragover",function(event){
			event.preventDefault(); // 기본효과를 막음
		});
		//드래그앤드롭으로 첨부
		$(".fileDrop").on("drop", function(event){
			event.preventDefault(); // 기본효과를 막음
			//드래그된 파일의 정보
			var files = event.originalEvent.dataTransfer.files;
			//첫번째 파일
			var file = files[0];
			//콘솔에서 파일정보 확인
			console.log("file : ",file);
			
			//ajax로 전달할 폼 객체
			var formData = new FormData();
			//폼 객체에 파일추가, append("변수명", 값)
			formData.append("file",file);
			
			/**
			ajax 파일 업로드 요청(/uploadAjax)이 성공적으로 처리가 되면 checkImageType()함수를 호출하여 이미지 파일 여부를 판별한다. 
			업로드된 파일이 이미지이면 ajax 이미지 출력요청(/displayFile)을 처리한다. 
			썸네일 이미지는 업로드 파일 목록 영역$(".uploadedList").append(str))에 출력하고, 
		     이미지를 링크한 <a href>태그로 감싸서 썸네일 이미지를 클릭하면 원본사이즈의 이미지를 볼 수 있게 구현했다.
			업로드된 파일이 일반 파일일 경우에는 원본파일의 이름만 목록에 출력해주고, 
			클릭시 다운로드가 되도록 원본 파일을 링크한 <a href>태그로 감쌌다.
			*/
			$.ajax({
				type: "post",
				url: "/asAccept/uploadAjax",
				data: formData,
				//processData: true => get방식, false => post방식
				dataType: "text",
				//contentType: true => application/x-www-form-urlencoded,
				//			   false => multipart/form-data
				processData: false,
				contentType: false,
				success: function(data){
					alert("Data : " + data);
					var str = "";
					// 이미지 파일이면 썸네일 이미지 출력
		            if(checkImageType(data)){ 
		                str = "<div><a href='/upload/displayFile?fileName="+getImageLink(data)+"'>";
		                str += "<img src='/upload/displayFile?fileName="+data+"'></a>";
		            // 일반파일이면 다운로드링크
		            } else { 
		                str = "<div><a href='/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
		            }
		            // 삭제 버튼
		            str += "<span data-src="+data+">[삭제]</span></div>";
		            $(".uploadList").append(str);
				}
			});
		});
	
	/* 
		업로드한 파일을 목록에서 삭제하기 위해 <span>태그를 클릭 이벤트로 설정하고,
		<span>태그를 클릭을 했는지 인지할 수 있도록 alert창이 뜨게 처리도 하였다. 
		ajax 삭제요청이 처리되고 나면 클릭한 span의 부모태그인 div를 삭제하게된다.
		$(this)를 사용하면 보다 간편하게 코드를 작성할 수가 있다. 
		$(this)를 알기 전까지는 목록의 레코드마다 id속성을 배열 만들어서로 처리했지만
		$(this)를 사용하면 배열로 처리하지 않고 클릭 이벤트만으로 구분을 할 수가 있기 때문에 보다 간결한 코드를 작성할 수 있었다.
	 */
		$(".uploadList").on("click", "span", function(event){
		    alert("이미지 삭제")
		    var that = $(this); // 여기서 this는 클릭한 span태그
		    $.ajax({
		        url: "/upload/deleteFile",
		        type: "post",
		        // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
		        // 태그.attr("속성")
		        data: {fileName:$(this).attr("data-src")}, // json방식
		        dataType: "text",
		        success: function(result){
		            if( result == "deleted" ){
		                // 클릭한 span태그가 속한 div를 제거
		                that.parent("div").remove();
		            }
		        }
		    });
		});	
	});
	// 원본파일이름을 목록에 출력하기 위해
	function getOriginalName(fileName) {
	    // 이미지 파일이면
	    if(checkImageType(fileName)) {
	        return; // 함수종료
	    }
	    // uuid를 제외한 원래 파일 이름을 리턴
	    var idx = fileName.indexOf("_")+1;
	    return fileName.substr(idx);
	}	

	// 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
	function getImageLink(fileName) {
	    // 이미지파일이 아니면
	    if(!checkImageType(fileName)) { 
	        return; // 함수 종료 
	    }
	    // 이미지 파일이면(썸네일이 아닌 원본이미지를 가져오기 위해)
	    // 썸네일 이미지 파일명 - 파일경로+파일명 /2017/03/09/s_43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    var front = fileName.substr(0, 12); // 년원일 경로 추출
	    var end = fileName.substr(14); // 년원일 경로와 s_를 제거한 원본 파일명을 추출
	    console.log(front); // /2017/03/09/
	    console.log(end); // 43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    // 원본 파일명 - /2017/03/09/43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    return front+end; // 디렉토리를 포함한 원본파일명을 리턴
	}
	
	// 이미지파일 형식을 체크하기 위해
	function checkImageType(fileName) {
	    // i : ignore case(대소문자 무관)
	    var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
	    return fileName.match(pattern); // 규칙이 맞으면 true
	}
	
	function addFilePath(msg){
		console.log(msg); //파일명 콘솔 출력
		document.getElementById("frmMain").reset(); //iframe에 업로드결과를 출력 후 form에 저장된 데이터 초기화
	}
</script>
<div class="sb-site-container">
    <div class="container">   
    	<h2>AJAX File Upload</h2>
    	<!-- 파일을 업로드할 영역 -->
    	<div class="fileDrop">ddd</div>
    	<!-- 업로드된 파일 목록 -->
    	<div class="uploadList"></div>
	</div>
	
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
