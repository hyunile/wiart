<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>
<script type="text/javascript">
	_debug = true;          //디버깅 모드 설정용, 각 페이지에서 true로 설정하면, 오류를 alert 창으로 표시한다.
	_notRedirection = true; //페이지 이동 금지 설정용, 각 페이지에서 true로 설정하면, 페이지 이동하지 않는다.
	// 개발 디버그 모드 끝
	NOW_MENU_TYPE = "view";
	
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
	    	location.href="/asAccept/write";
	    });
	    
	    //수정
	    $("#btnUpdate").click(function(){
	    	//fnWrite(); //ajax test
	    	var no = '${result.no}';
	    	location.href="/asAccept/update?no="+no;
	    });
	    
	    //목록
	    $("#btnList").click(function(){
	    	location.href="/asAccept/list";
	    })
	    
	    //삭제
	    $("#btnDelete").click(function(){
	    	if(confirm("삭제 하시겠습니까?"))
    		{
    			fnDelete();
    		}
	    })
	    
	    $("#btnWrite").click(function(){
	    	submitContents();
	    })
	    
	    // 검색 - 텍스트 박스 엔터
/* 	    $("#groupName").attr("onkeydown", "fnKeyDownEnter(event);");
	    $("#groupCode").attr("onkeydown", "fnKeyDownEnter(event);"); */
	});   
	
	function submitContents(){
		
	}
	
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
        <%-- 
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
           --%>
        <!--   
		<div class="table-button">
          	<button type="button" class="btn btn-default pull-right" id="btnUpdate"><i class="fa fa-floppy-o" aria-hidden="true"></i> 수정</button>
            <button type="button" class="btn btn-default pull-right" id="btnList" onclick="javascript:history.back(-1);"><i class="fa fa-times" aria-hidden="true"></i> 목록</button>
            <button type="button" class="btn btn-default pull-right" id="btnDelete"><i class="fa fa-floppy-o" aria-hidden="true"></i> 삭제</button>
        </div>
         -->  
		<hr/>
                    <div class="panel-body">
                        <form role="form">
                          <div class="form-group">
                            <label for="customerno">고객등록번호</label>
                            <input type="text" class="form-control" id="customerno" value="${result.customerno}" readonly placeholder="고객등록번호">
                          </div>
                          <div class="form-group">
                            <label for="writer">성함</label>
                            <input type="text" class="form-control" id="writer" value="${result.writer}" readonly placeholder="성함">
                          </div>
                          <div class="form-group">
                            <label for="address">주소</label>
                            <input type="text" class="form-control" id="address" value="${result.address}" readonly placeholder="성함">
                          </div>
                          <div class="form-group">
                            <label for="phone">전화번호</label>
                            <input type="text" class="form-control" id="phone" value="${result.phone}" readonly placeholder="성함">
                          </div>
                          <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" id="title" value="${result.title}" readonly placeholder="성함">
                          </div>  
                          <div class="form-group">
                            <label for="exampleInputPassword1">내용</label>
                            <p><img src="/styles/assets/img/wiart/footLogo2.jpg" alt="" class="img-responsive"></p>
                          </div>
            <!--               <div class="modal-body">
                            <p><img src="/styles/assets/img/wiart/footLogo2.jpg" alt="" class="img-responsive"></p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, quasi voluptas nostrum culpa sunt laboriosam corporis perspiciatis animi rem unde. Nihil, doloribus soluta possimus non asperiores eius natus quaerat porro.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor, ad, adipisci, vel recusandae qui pariatur id nobis officiis dolorum non tempora quae libero cumque consequuntur sint alias odit possimus quo.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, quisquam, tempore, ipsam, blanditiis praesentium cumque commodi vitae minus perferendis officia quidem aliquid natus explicabo! Blanditiis a magni facere temporibus odit.</p>
                          </div> -->


                          <button type="submit" class="btn btn-ar btn-primary" id="btnUpdate">수정</button>
                          <button type="cancel" class="btn btn-ar btn-default" id="cancel">취소</button>
                        </form>
                    </div>
		
		</div>
		<hr/>	
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
