<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>
<script type="text/javascript">
	_debug = true;          //디버깅 모드 설정용, 각 페이지에서 true로 설정하면, 오류를 alert 창으로 표시한다.
	_notRedirection = true; //페이지 이동 금지 설정용, 각 페이지에서 true로 설정하면, 페이지 이동하지 않는다.
	// 개발 디버그 모드 끝
	NOW_MENU_TYPE = "as";
	
	PAGENO = 1;         // 페이지 번호
	PAGESIZE = 10;      // 한 화면당 리스트 갯수
	PAGEBOXSIZE = 10;   // 아래 페이징 갯수
	
	$(function(){
	    // 최초 실행

	    if ($("#page").val() == "") {
	        $("#page").val(PAGENO);
	    }
	    $("#pageSize").val(PAGESIZE);
	/* 
	    $("#btnSearch").click(function(){
	        fnGetList(1);
	    });
	     */
	    fnGetList($("#page").val());
	    
	    //등록
	    $("#btnWrite").click(function(){
	    	//fnWrite(); //ajax test
	    	location.href="/asAccept/write";
	    });
	    
	    // 검색 - 텍스트 박스 엔터
/* 	    $("#groupName").attr("onkeydown", "fnKeyDownEnter(event);");
	    $("#groupCode").attr("onkeydown", "fnKeyDownEnter(event);"); */
	});    
	
	function fnGetList(page){
		$("#page").val(page);
		
	    var url = "/asAccept/list.json";
	    var params = {
	        channelType: "HO"
	        , osType: BrowserAgent()
	        , page : page
	        , pageSize : $("#pageSize").val()
	    }
	    
	    // 리턴 받을 함수명 - String 아님.
	    var reCall = fnAppendList;
	    
	    // 로딩 표시 하기 -
	    var isLoding = false; // true : false

	    // /js/common.js 참조
	    JsonCall(url, params, reCall, isLoding);
	}
	
	function fnAsAcceptView(no){
		location.href="/asAccept/view?no="+no;
	}
	
	function fnAppendList(obj){
		try{
	        var result = obj.responseJSON;
	        if (result == undefined) return;
	        
	        var items = result.resultList;
	        var listCnt = items.length;
	        console.log("resultList : " , items);
	        console.log("listCnt : " , listCnt);
	        
	        var totalCount = result.totalCount;
	        var page = result.page;
	        var pageSize = result.pageSize;
	        
	        var scriptCallName = 'fnGetList'; // 페이징 처리시 호출 스크립트
	        pageDisplay(totalCount, page, pageSize, PAGEBOXSIZE, scriptCallName);
	        
	        // 번호
	        var nCnt = parseInt(totalCount, 10) - ((parseInt(page, 10) - 1) * parseInt(pageSize, 10));
	        
	        $("#tcnt").text("Total : " + totalCount);
	        $("#tbody").html(""); // 내용 초기화
	        
	        if (listCnt > 0) {
	            var htmlString = "";
	            var sb = new StringBuilder(); // 스트링 빌더 초기화
	            
	            $.each(items, function (key) {
	                // 리스트
	                var list = items[key];
	                
	                var rownum = ToString(list.rownum);
	                var no = ToString(list.no); //번
	                var title = ToString(list.title); //제목
	                //var content = ToString(list.content); //내용
	                var writer = ToString(list.writer); //작성자
	                var creDt = ToString(list.cre_dt); //작성일
	                
	                creDt = phpDate("Y-m-d", creDt.substring(0, 10)); //timestamp value parse, phpData는 agora.js
	                var hit = ToString(list.hit); //조회수
	            	//groupAvailable == "Y" ? groupAvailable = "활성" : groupAvailable = "비활성";
	                
	                
	     			//sb.AppendFormat('<tr style="cursor:pointer;" onclick="javascript:fnAsAcceptView(\'{0}\');return false;">', no);
	     			sb.AppendFormat('<tr style="cursor:pointer;" onclick="javascript:fnAsAcceptView(\'{0}\');return false;">', no);
	    			sb.AppendFormat('  <td class="text-center">{0}</td> ', rownum);
	    			sb.AppendFormat('  <td class="text-center" id="title">{0}</td> ', title);
	    			sb.AppendFormat('  <td class="text-center">{0}</td> ', writer);
	    			sb.AppendFormat('  <td class="text-center">{0}</td> ', creDt);
	    			sb.Append('</tr>');
	            });
	            htmlString = sb.ToString();                 //StringBuilder 내용 문자열로 전환
	            sb.RemoveAll();                                 //StringBuilder 초기화
	            
	            $("#tbody").append(htmlString);
	        }else {
	            $("#tbody").append('<tr><td colspan="5" class="text-center">검색 결과가 없습니다.</td></tr>');
	        }      
		}catch(e){
			checkException(e, "noticeList.json", NOW_MENU_TYPE);                    //오류 발생 처리
		}
	}
</script>

<div class="sb-site-container">

         <div class="container">   
         <div class="text-right"><strong id="tcnt">&nbsp;</strong></div>
	        <table class="table table-bord table-hover">
			<colgroup>
				<col width="5%"/>
				<col width="auto"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>	          
	          <thead>
	            <tr>
	              <th scope="col" class="text-center">번호</th>
	              <th scope="col" class="text-center">제목</th>
	              <th scope="col" class="text-center">글쓴이</th>
	              <th scope="col" class="text-center">등록일</th>
	            </tr>
	          </thead>
	          <tbody id="tbody"></tbody>
	        </table>
	        
	        <div class="text-center">
				<ul class="pagination"></ul>
			</div>
		<button type="button" class="btn btn-default pull-right" id="btnWrite">등록</button>
		</div>
	      <input type="hidden" name="totalCount" id="totalCount" />
	      <input type="hidden" name="page" id="page" />
	      <input type="hidden" name="pageSize" id="pageSize" />		
		<hr/>
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
