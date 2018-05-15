<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>

<link rel="shortcut icon" href="/styles/assets/img/favicon.png" />
<!-- CSS -->
<link href="/styles/assets/css/preload.css" rel="stylesheet">
<link href="/styles/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="/styles/assets/css/bootstrap-switch.min.css" rel="stylesheet">
<link href="/styles/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="/styles/assets/css/animate.min.css" rel="stylesheet">
<link href="/styles/assets/css/slidebars.min.css" rel="stylesheet">
<link href="/styles/assets/css/lightbox.css" rel="stylesheet">
<link href="/styles/assets/css/jquery.bxslider.css" rel="stylesheet" />
<link href="/styles/assets/css/buttons.css" rel="stylesheet">
<link href="/styles/assets/css/vendors.css" rel="stylesheet">
<link href="/styles/assets/css/syntaxhighlighter/shCore.css" rel="stylesheet" >

<link href="/styles/assets/css/style-orange.css" rel="stylesheet">
<link href="/styles/assets/css/width-full.css" rel="stylesheet">

<script type="text/javascript" src="/styles/assets/js/vendors.js"></script>

<!-- <script type="text/javascript" src="assets/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
<script type="text/javascript" src="assets/js/jquery.themepunch.revolution.min.js?rev=5.0"></script> -->

<script src="/styles/assets/js/slidebars.js"></script>

<script src="/styles/assets/js/styleswitcher.js"></script>
<script src="/styles/assets/js/syntaxhighlighter/shCore.js"></script>
<script src="/styles/assets/js/syntaxhighlighter/shBrushXml.js"></script>
<script src="/styles/assets/js/syntaxhighlighter/shBrushJScript.js"></script>

<script src="/styles/assets/js/DropdownHover.js"></script>
<script src="/styles/assets/js/app.js"></script>
<script src="/styles/assets/js/holder.js"></script>
<script src="/styles/assets/js/home_info.js"></script>
<!-- <script src="/styles/assets/js/mixitup.js"></script> -->

<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/js/jquery-migrate-3.0.0.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript" src="/js/common/agora.js"></script>
<script type="text/javascript" src="/js/common/util.js"></script>
<script type="text/javascript" src="/js/common/stringBuilder.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>

<script type="text/javascript" src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/dist/js/adminlte.min.js"></script>

<script type="text/javascript">
$(function(){

	var result = "${msg}";
	if (result == "regSuccess") {
	    alert("게시글 등록이 완료되었습니다.");
	} else if (result == "modSuccess") {
	    alert("게시글 수정이 완료되었습니다.");
	} else if (result == "delSuccess") {
	    alert("게시글 삭제가 완료되었습니다.");
	}	
	
})

//menu 이동
/* 
function makeform(actionUrl){
	var f = document.frmMenuHandle;
	f.action=actionUrl;
	f.method="post";
	f.target="";
	return f;
}

function goMenuPage(url) {
	if(url==null || url=='')return;

	var f = makeform(url);

	f.submit();
}
 */
</script>

<body>
<form name="frmMenuHandle"></form>
</body>