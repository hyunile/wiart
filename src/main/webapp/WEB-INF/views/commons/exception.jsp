<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
    
<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>
    
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                예외 발생
            </h1>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">

            <div class="col-lg-12">
                <h3><i class="fa fa-warning text-red"></i> ${exception.getMessage()}</h3>
                <ul>
                    <c:forEach items="${exception.getStackTrace()}" var="stack">
                        <li>${stack.toString()}</li>
                    </c:forEach>
                </ul>
            </div>

        </section>
    </div>

</div>
</body>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>