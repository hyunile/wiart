<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%@ include file="/WEB-INF/views/main/wiartCommon.jsp" %>

	
<script type="text/javascript">
	function makeform(ActionURL) {
		alert(ActionURL);
		var f = document.menuHandle;
		f.action=ActionURL;
		//f.method="post";
		f.method="get";
		f.target="";
		return f;
	}
	
	function goMenuPage(url) {
		if(url==null || url=='')return;
		var f = makeform(url);
		f.submit();
	}
	
	function intro(){
/* 		
 		 $.ajax({   
		 	  type: "POST",  
			  url: "intro",
			  dataType : "html",
			  success: function(data){
				alert("success" + data);  
			  },
			  error:function(data){
				alert("error" + data)
			  }
		 });
 		  */
	}

</script>
<form name="menuHandle"></form>
<header id="header-full-top" class="hidden-xs header-full">
   
    <div class="container">
        <div class="header-full-title" onclick="goMenuPage('/main');" style="cursor:pointer;">
<!--             <h1 class="animated fadeInRight"><a href="home.jsp">Wiart <span>Test</span></a></h1>
            <p class="animated fadeInRight">Your Life Wiart</p> -->
        </div>
        <nav class="top-nav">
        	<!-- 상단 social bar 시작 -->
<!--             <ul class="top-nav-social hidden-sm">
                <li><a href="#" class="animated fadeIn animation-delay-6 rss"><i class="fa fa-rss"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-7 twitter"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-8 facebook"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-9 google-plus"><i class="fa fa-google-plus"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-9 instagram"><i class="fa fa-instagram"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-8 vine"><i class="fa fa-vine"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-7 linkedin"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-6 flickr"><i class="fa fa-flickr"></i></a></li>
            </ul> -->
			<!-- 상단 social bar 끝 -->
            <div class="dropdown animated fadeInDown animation-delay-11">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Login</a>
                <div class="dropdown-menu dropdown-menu-right dropdown-login-box animated flipCenter">
                    <form role="form">
                        <h4>Login Form</h4>

                        <div class="form-group">
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" placeholder="Username">
                            </div>
                            <br>
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" class="form-control" placeholder="Password">
                            </div>
                            <div class="checkbox pull-left">
                                  <input type="checkbox" id="checkbox_remember1">
                                  <label for="checkbox_remember1">
                                     Remember me
                                  </label>
                            </div>
                            <button type="submit" class="btn btn-ar btn-primary pull-right">Login</button>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </div> <!-- dropdown -->

            <div class="dropdown animated fadeInDown animation-delay-13">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-search"></i></a>
                <div class="dropdown-menu dropdown-menu-right dropdown-search-box animated fadeInUp">
                    <form role="form">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-ar btn-primary" type="button">Go!</button>
                            </span>
                        </div><!-- /input-group -->
                    </form>
                </div>
            </div> <!-- dropdown -->
        </nav>
    </div> <!-- container -->
    </header>
    
    <nav class="navbar navbar-default navbar-header-full navbar-dark yamm navbar-static-top" role="navigation" id="header">
	    <div class="container">
	        <!-- Brand and toggle get grouped for better mobile display -->
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                <span class="sr-only">Toggle navigation</span>
	                <i class="fa fa-bars"></i>
	            </button>
	            <a id="ar-brand" class="navbar-brand hidden-lg hidden-md hidden-sm navbar-dark" href="index.html">Artificial <span>Reason</span></a>
	        </div> <!-- navbar-header -->
	
	        <!-- Collect the nav links, forms, and other content for toggling -->
	        <div class="pull-right">
	            <a href="javascript:void(0);" class="sb-icon-navbar sb-toggle-right"><i class="fa fa-bars"></i></a>
	        </div>
	        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	            <ul class="nav navbar-nav">
	            	<li class="dropdown">
	            		 <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">회사소개</a>
	                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
	                        <li><a href="#" onclick="goMenuPage('/greet');">인사말</a></li>
	                        <li><a href="#" onclick="goMenuPage('/road');">찾아오시는길</a></li>                        
	                    </ul>
	            	</li>
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">제품소개</a>
	                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
	                        <li><a href="#" onclick="goMenuPage('/introItem/sink')">싱크대<span class="label label-success pull-right">New</span></a></li>
	                        <li><a href="#" onclick="goMenuPage('/introItem/list?type=2')">붙박이장</a></li>
	                        <li><a href="#" onclick="goMenuPage('/introItem/list?type=3')">상판</a></li>
	                        <li><a href="#" onclick="goMenuPage('/introItem/list2?type=4')">빌트인</a></li>
	                    </ul>
	                </li>
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">견적현황</a>
		                    <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
		                        <li class="dropdown-submenu"><a href="javascript:goMenuPage('jubang');">견젹현황</a></li>
		                        <li class="dropdown-submenu"><a href="javascript:void(0);">온라인견적문의</a></li>
		                        <li class="dropdown-submenu"><a href="#" onclick="goMenuPage('/asAccept/list')">우리집(고객정보/AS등록)</a></li>
		                    </ul>
	                <li>
	                    <a href="javascript:void(0);">포트폴리오</a>
	                </li>
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">공지사항</a>
	                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
	                        <li><a href="#" onclick="goMenuPage('/notice/list');">공지사항</a></li>
	                        <li><a href="#" onclick="goMenuPage('/article/listPaging');">이벤트test</a></li>
	                        <li><a href="#" onclick="goMenuPage('/asAccept/list');">A/S접수</a></li>
	                    </ul>
	                </li>
	             </ul>
	        </div><!-- navbar-collapse -->
	    </div><!-- container -->
	</nav>
	
	<section class="wrap-hero margin-bottom"> <!-- 전체 배경 -->
    <div id="carousel-example-ny" class="carousel carousel-hero" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-push-6">
                            <div class="" style="height:100px;">
                            	<!-- <img src="styles/assets/img/colors/orange/wiart_logo.gif" alt="" > --><!-- class="img-responsive animated zoomInUp animation-delay-30" -->
                            </div>
                        </div>
                    </div> <!--row -->
                </div> <!-- container -->
            </div> <!-- item -->
        </div> <!-- carousel-inner -->
    </div>
</section> <!-- carousel -->
<div class="container margin-bottom">
   <div class="panel-body">
       <div class="input-group">
               <input type="text" class="form-control input-lg" placeholder="wiart 고객번호를 입력해주세요1">
               <span class="input-group-btn">
                   <button class="btn btn-ar btn-lg btn-primary" type="button"><i class="fa fa-stack-overflow"></i>welcome tho the family</button>
               </span>
           </div>
	</div>
</div>
<%-- <div id="gnb">
   <c:import url="/sau/com/main/incMenuTop.do" />
</div> --%>