<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>

<!-- <script type="text/javascript" src="/SEeditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/editor/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"> </script>
<script type="text/javascript" src="/js/jquery.form.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/article.js" charset="utf-8"></script>

<script type="text/javascript">
	$(function (){
		$("#btnWrite").click(function(){
			location.href="/article/write";
		});		
	})
	
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
				<col width="5%"/>
			</colgroup>	          
	          <thead>
	            <tr>
				  <th scope="col" class="text-center">#</th>
	              <th scope="col" class="text-center">제목</th>
	              <th scope="col" class="text-center">작성자</th>
	              <th scope="col" class="text-center">작성일</th>
	              <th scope="col" class="text-center">조회</th>            
	            </tr>
	          </thead>
	          <tbody id="tbody">
                <c:forEach items="${articles}" var="article">
                <tr>
                    <td class="text-center">${article.articleNo}</td>
                    <td class="text-center"><a href="${path}/article/read?articleNo=${article.articleNo}">${article.title}</a></td>
                    <td class="text-center">${article.writer}</td>
                    <td class="text-center"><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a HH:mm"/></td>
                    <td class="text-center"><span class="badge bg-red">${article.viewCnt}</span></td>
                </tr>
                </c:forEach>
	          </tbody>
	        </table>
	        
	        <div class="text-center">
				<ul class="pagination"></ul>
			</div>
		<button type="button" class="btn btn-default pull-right" id="btnWrite">등록</button>		
		</div>
<div class="box-footer">
    <div class="text-center">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li><a href="${path}/article/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                    <a href="${path}/article/listPaging?page=${idx}">${idx}</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li><a href="${path}/article/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
            </c:if>
        </ul>
    </div>
</div>
	      <input type="hidden" name="totalCount" id="totalCount" />
	      <input type="hidden" name="page" id="page" />
	      <input type="hidden" name="pageSize" id="pageSize" />		
		<hr/>
</div>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
