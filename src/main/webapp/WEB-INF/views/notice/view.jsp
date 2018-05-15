<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>
<script type="text/javascript">
	_debug = true;          //디버깅 모드 설정용, 각 페이지에서 true로 설정하면, 오류를 alert 창으로 표시한다.
	_notRedirection = true; //페이지 이동 금지 설정용, 각 페이지에서 true로 설정하면, 페이지 이동하지 않는다.
	// 개발 디버그 모드 끝
	NOW_MENU_TYPE = "list";
	
	$(function(){
	    // 최초 실행
/* 
	    if ($("#page").val() == "") {
	        $("#page").val(PAGENO);
	    }
	    $("#pageSize").val(PAGESIZE);
	     */
	/* 
	    $("#btnSearch").click(function(){
	        fnGetList(1);
	    });
	     */
	    //fnGetList($("#page").val());
	    
	    //등록
	    $("#btnWrite").click(function(){
	    	//fnWrite(); //ajax test
	    	location.href="/notice/write";
	    });
	    
	    //수정
	    $("#btnUpdate").click(function(){
	    	//fnWrite(); //ajax test
	    	var no = '${result.no}';
	    	location.href="/notice/update?no="+no;
	    });
	    
	    //목록
	    $("#btnList").click(function(){
	    	location.href="/notice/list";
	    })
	    
	    //삭제
	    $("#btnDelete").click(function(){
	    	if(confirm("삭제 하시겠습니까?"))
    		{
    			fnDelete();
    		}
	    })
	    // 검색 - 텍스트 박스 엔터
/* 	    $("#groupName").attr("onkeydown", "fnKeyDownEnter(event);");
	    $("#groupCode").attr("onkeydown", "fnKeyDownEnter(event);"); */
	});   
	
	function fnDelete(){
		var no = $("#no").val();
		
	    var frm = document.forms['frmMain'];

	    console.log('frm : ' +frm);
	    
	    frm.action = "/notice/delete";
	    frm.method = "post";
	    frm.submit();
	}
</script>

<div class="sb-site-container">
        <div class="container">   
	     <div class="panel panel-default">
              <div class="panel-heading">
                  <div class="row">
                  	<div class="col-md-9">
                  		제 목 : ${result.title}
	                   	<div class="row">
	                    	<div class="col-md-3">작 성 자 : ${result.writer}</div>
	                    	<div class="col-md-4">작성시간 : ${result.cre_dt}</div>
	                    	<div class="col-md-3">조회수 : ${result.hit}</div>
	                   	</div>
                  		
                  	</div>
                  </div>
              </div>
              <div class="panel-body">
                  ${result.content}
              </div>
              <form name="frmMain" id="frmMain">
              	<input type="hidden" value="${result.no}" id="no" name="no" />
              </form>
          </div>
		<div class="table-button">
          	<button type="button" class="btn btn-default pull-right" id="btnUpdate"><i class="fa fa-floppy-o" aria-hidden="true"></i> 수정</button>
            <button type="button" class="btn btn-default pull-right" id="btnList" onclick="javascript:history.back(-1);"><i class="fa fa-times" aria-hidden="true"></i> 목록</button>
            <button type="button" class="btn btn-default pull-right" id="btnDelete"><i class="fa fa-floppy-o" aria-hidden="true"></i> 삭제</button>
          </div>
		
		</div>
		<hr/>
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
