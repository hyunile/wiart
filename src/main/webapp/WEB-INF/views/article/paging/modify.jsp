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
<script type="text/javascript" src="/js/article.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
    /* iframe 스타일 설정 */
    iframe {
        width: 600px;
        height: 100px;
        border: 1px;
        border-style: solid;
    }
</style>
<script type="text/javascript">
	function addFilePath(msg){
		console.log(msg); //파일명 콘솔 출력
		document.getElementById("frmMain").reset(); //iframe에 업로드결과를 출력 후 form에 저장된 데이터 초기화
	}
</script>
<div class="sb-site-container">
<div class="container">   
<section class="content container-fluid">
	<form role="form" id="writeForm" method="post" action="/article/modify">
	    <div class="box box-primary">
	        <div class="box-body">
	        	<input type="hidden" name="articleNo" value="${article.articleNo}"/>
	            <div class="form-group">
	                <label for="title">제목</label>
	                <input class="form-control" id="title" name="title" value="${article.title}">
	            </div>
	            <div class="form-group">
	                <label for="writer">작성자</label>
	                <input class="form-control" id="writer" name="writer" value="${article.writer}" readonly>
	            </div>	            
	            <div class="form-group">
	                <label for="content">내용</label>
	                <textarea class="form-control" id="content" name="content" rows="20"
	                          placeholder="내용을 입력해주세요" style="resize: none;" >${article.content}</textarea>
	            </div>
                <div class="form-group">
                    <div class="fileDrop">
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
                    </div>
                </div>	            
	        </div>
	        <div class="box-footer">
	            <div>
	                <hr>
	            </div>
	            <ul class="mailbox-attachments clearfix uploadedList"></ul>
		       <button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
	            <div class="pull-right">
	                <button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
	                <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
	            </div>
	        </div>
	    </div>
        <input type="hidden" name="articleNo" value="${article.articleNo}">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">	    
	</form>
</section>	
</div>
</div>

<script type="text/javascript">
$(document).ready(function () {

    var formObj = $("form[role='form']");
    console.log(formObj);
    $(".modBtn").on("click", function () {
        formObj.submit();
    });

    $(".cancelBtn").on("click", function () {
        history.go(-1);
    });

    $(".listBtn").on("click", function () {
        self.location = "/article/listPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}";

        //self.location = "/article/list"
    });

});
</script>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
