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
<div class="sb-site-container">
        <div class="container">   
	     <div class="panel panel-default">
              <div class="panel-heading">
                  <div class="row">
                  	<div class="col-md-9">
                  		제 목 : ${article.title}
	                   	<div class="row">
	                    	<div class="col-md-3">작 성 자 : ${article.writer}</div>
	                    	<div class="col-md-4">작성시간 : <fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a HH:mm"/></div>
	                    	<div class="col-md-3">조회수 : ${article.viewCnt}</div>
	                   	</div>
                  		
                  	</div>
                  </div>
              </div>
              <div class="panel-body">
                  ${article.content}
              </div>
          </div>
	      <div class="box-footer">
	          <form role="form" method="post">
	              <input type="hidden" name="articleNo" value="${article.articleNo}">
	          </form>
	          <button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
	          <div class="pull-right">
	              <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
	              <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
	          </div>
	      </div>        
		</div>
		<hr/>
</div>

<script type="text/javascript">
$(document).ready(function () {

    var formObj = $("form[role='form']");
    console.log(formObj);

    $(".modBtn").on("click", function () {
        formObj.attr("action", "/article/modify");
        formObj.attr("method", "get");
        formObj.submit();
    });

    $(".delBtn").on("click", function () {
       formObj.attr("action", "/article/remove");
       formObj.submit();
    });

    $(".listBtn").on("click", function () {
       self.location = "/article/list"
    });

});
</script>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
