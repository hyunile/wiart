<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title><spring:message code="label.title" /></title>
	
	<link rel="shortcut icon" href="styles/assets/img/favicon.png" />
	<!-- CSS -->
	<link href="<c:url value="/styles/assets/css/preload.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/bootstrap.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/bootstrap-switch.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/font-awesome.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/animate.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/slidebars.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/lightbox.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/jquery.bxslider.css"/>" rel="stylesheet" />
	<link href="<c:url value="/styles/assets/css/buttons.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/vendors.css"/>" rel="stylesheet">
	<link href="<c:url value="/styles/assets/css/syntaxhighlighter/shCore.css"/>" rel="stylesheet" >
	<link href="<c:url value="/styles/assets/css/style-orange.css" rel="stylesheet"/>" title="default">
	<link href="<c:url value="/styles/assets/css/width-full.css" rel="stylesheet"/>" title="default"> 
	
 	<link href="styles/assets/css/preload.css" rel="stylesheet">
	<link href="styles/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="styles/assets/css/bootstrap-switch.min.css" rel="stylesheet">
	<link href="styles/assets/css/font-awesome.min.css" rel="stylesheet">
	<link href="styles/assets/css/animate.min.css" rel="stylesheet">
	<link href="styles/assets/css/slidebars.min.css" rel="stylesheet">
	<link href="styles/assets/css/lightbox.css" rel="stylesheet">
	<link href="styles/assets/css/jquery.bxslider.css" rel="stylesheet" />
	<link href="styles/assets/css/buttons.css" rel="stylesheet">
	<link href="styles/assets/css/vendors.css" rel="stylesheet">
	<link href="styles/assets/css/syntaxhighlighter/shCore.css" rel="stylesheet" >
	<link href="styles/assets/css/style-orange.css" rel="stylesheet" title="default">
	<link href="styles/assets/css/width-full.css" rel="stylesheet" title="default">

	<script src="<c:url value="styles/assets/js/vendors.js"/>"></script>
	<!-- <script type="text/javascript" src="assets/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
	<script type="text/javascript" src="assets/js/jquery.themepunch.revolution.min.js?rev=5.0"></script> -->
	
	<script src="<c:url value="styles/assets/js/syntaxhighlighter/shCore.js"/>"></script>
	<script src="<c:url value="styles/assets/js/syntaxhighlighter/shBrushXml.js"/>"></script>
	<script src="<c:url value="styles/assets/js/syntaxhighlighter/shBrushJScript.js"/>"></script>
	
	<script src="styles/assets/js/DropdownHover.js"></script>
	<script src="styles/assets/js/app.js"></script>
	<script src="styles/assets/js/holder.js"></script>
	<script src="styles/assets/js/home_info.js"></script>
	
	
	<tiles:insertAttribute name="js" ignore="true" />
</head>

<body>
<form name="frmMenuHandle">
</form>
<div>
	<div id="header">
		<tiles:insertAttribute name="header" />			
	</div>
	<div id="body">	
		<tiles:insertAttribute name="body" />
	</div>	
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>
