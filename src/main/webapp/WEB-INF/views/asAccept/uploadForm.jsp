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
              <!-- form -->
        <form name="frmMain" id="frmMain" target="iframePhoto" method="post" action="/asAccept/upload" enctype="multipart/form-data">
            <div class="form-group">
              <label for="inputEmail3">제목</label>
              <!-- <input type="text" class="form-control" name="subject" id="subject" value="" onchange="checkTextarea(this,0,14)" onkeyup="checkTextarea(this,0,14)"> -->
              <input type="text" class="form-control" name="subject" id="subject" value="">
            </div>
			<div class="form-group">
			<label for="inputEmail3">내용11</label>
			  <input type="hidden" id="contentsChk">		
	          <textarea name="contents" id="contents" rows="10" cols="100" style="width:100%; height:400px;"></textarea>
			</div>
			<div class="form-group">
			  <input type="file" id="file" name="file">
			  <a href="#" id="btn_fileReset" class="btn-white btn-small">삭제</a>
			</div>
			
          <div class="table-button">
          	<button type="submit" class="btn btn-default pull-right" id="btnWrite"><i class="fa fa-floppy-o" aria-hidden="true"></i> 저장</button>
            <button type="button" class="btn btn-default pull-right" id="btnCancel" onclick="javascript:history.back(-1);"><i class="fa fa-times" aria-hidden="true"></i> 취소</button>
          </div>
        </form>
        <iframe name="iframePhoto"></iframe>
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
