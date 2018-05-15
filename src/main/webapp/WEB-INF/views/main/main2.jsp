<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="ko">

<script type="text/javascript">

</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="description" content="">
    
    <title>Wiart</title>

 	<%-- <%@ include file="/WEB-INF/views/main/wiartCommon.jsp" %> --%>

</head>


<!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>

<body>

<div class="sb-site-container">
<div class="boxed">
	<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>

   
<!-- container -->
<!-- <div class="container margin-top">
   <div class="panel-body">
       <div class="input-group">
               <input type="text" class="form-control input-lg" placeholder="wiart 고객번호를 입력해주세요1">
               <span class="input-group-btn">
                   <button class="btn btn-ar btn-lg btn-primary" type="button"><i class="fa fa-stack-overflow"></i>welcome tho the family</button>
               </span>
           </div>/input-group
   </div>
   
      <section class="margin-bottom">
        <div class="row">
            <div class="col-md-12">
                <h2 class="right-line">Our Services</h2>
            </div>
            <div class="col-md-4 col-sm-5">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-fax"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">온라인견적 & 전화견적</h3>
                        <p>전화 상담을 통해 가 견적 <br>예산 등을 확인하실수 있습니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-briefcase"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">무료견적 & 방문</h3>
                        <p>방문을 통해 현장 구조와 고객님의<br>원하시는 다지인을 확인합니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-desktop"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">설계 & 3D도면작업</h3>
                        <p>고객님의 원하는 스타일을 여러가지<br>구조로 설계를 하여 선택의 폭을 <br> 넓히고 3D로 확인하실수 있습니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-home"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">2차방문 & 매장상담</h3>
                        <p>방문이나 매장을 통해 색상과 <br> 샘플을 확인합니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-pencil-square-o"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">일정확인 & 계약</h3>
                        <p>방문이나 매장을 통해 색상과 <br> 샘플을 확인합니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-truck"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">철거 & 시공</h3>
                        <p>철거 1시간, 시공4~5시간 <br> 하루에 모든 작업을 맞추어 드립니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>  
    
 
</div>
 -->
<div class="container">
    <h2 class="right-line">Your own kitchen that you want will change your life style.</h2>
    <div class="row">
        <div class="col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-2">
                <div class="panel-heading">
                    <img src="styles/assets/img/demo/card1.jpg" alt="" >
                </div>
                <div class="panel-figure">
                    <!-- <img class="img-responsive img-circle fal fa-home"  /> -->
                    <span class="icon-ar icon-ar-xl-lg icon-ar-circle"><i class="fa fa-home"></i></span>
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">WIART-싱크대</a></h4>
                    <small>A short description goes here.</small>
                </div>
<!--                 <div class="panel-thumbnails">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" alt="" >
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                            	<img src="styles/assets/img/img60.jpg" alt="" >
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                            	<img src="styles/assets/img/img60.jpg" alt="" >
                            </div>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-4">
                <div class="panel-heading">
                	<img src="styles/assets/img/demo/card2.jpg" alt="" >
                    <!-- <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button> -->
                </div>
                <div class="panel-figure">
                    <!-- <img class="img-responsive img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/josue/73.jpg" /> -->
                    <span class="icon-ar icon-ar-xl-lg icon-ar-circle"><i class="fa fa-inbox"></i></span>
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">wiart-붙박이</a></h4>
                    <small>A short description goes here.</small>
                </div>
                <div class="panel-thumbnails">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="thumbnail">
                            	<img src="styles/assets/img/img60.jpg" alt="" >
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                            	<img src="styles/assets/img/img60.jpg" alt="" >
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                            	<img src="styles/assets/img/img60.jpg" alt="" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-6">
                
                <div class="panel-heading">
                	<img src="styles/assets/img/demo/card3.jpg" alt="" >
                    <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button>
                </div>
                <div class="panel-figure">
                    <span class="icon-ar icon-ar-xl-lg icon-ar-circle"><i class="fa fa-desktop"></i></span>
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">Wiart-빌트인</a></h4>
                    <small>A short description goes here.</small>
                </div>
                <div class="panel-thumbnails">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-8">
                <div class="panel-heading">
                    <img src="styles/assets/img/demo/card4.jpg" />
                    <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button>
                </div>
                <div class="panel-figure">
                    <img class="img-responsive img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/nisaanjani/73.jpg" />
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">@Patrick</a></h4>
                    <small>A short description goes here.</small>
                </div>
                <div class="panel-thumbnails">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-8">
                <div class="panel-heading">
                    <img src="styles/assets/img/demo/card4.jpg" />
                    <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button>
                </div>
                <div class="panel-figure">
                    <img class="img-responsive img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/nisaanjani/73.jpg" />
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">@Patrick</a></h4>
                    <small>A short description goes here.</small>
                </div>
                <div class="panel-thumbnails">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-8">
                <div class="panel-heading">
                    <img src="styles/assets/img/demo/card4.jpg" />
                    <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button>
                </div>
                <div class="panel-figure">
                    <img class="img-responsive img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/nisaanjani/73.jpg" />
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">@Patrick</a></h4>
                    <small>A short description goes here.</small>
                </div>
                <div class="panel-thumbnails">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="styles/assets/img/img60.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
    </div>
    <br/><br/>
	<div class="row masonry-container">
	        <div class="col-md-4 col-sm-6 masonry-item blog-item wow fadeInUp" >
	            <div class="thumbnail" style="background-color: orange">
	                <img src="styles/assets/img/wiart/color2.jpg" class="img-responsive" alt="Image">
	                <div class="caption">
	                    <h3 style="color: white;">Color Design</h3>
	                    <p>Color -</p>
	                    <p>신비로운 색의 조화</p>
	                    <p>나만의 특별</p>
	                    <p>컬러디자인을 만들다</p>
	                    <hr class="dotted">
	                    <a href="#" class="btn btn-ar btn-primary pull-left" role="button">Button &raquo;</a>
	                    &nbsp;&nbsp;&nbsp;
	                    <a href="#" class="btn btn-ar btn-primary pull-left" role="button">Read more &raquo;</a>
	                    <div class="clearfix"></div>
	                </div>
	            </div>
	        </div> <!-- masonry-item  -->
  
        <div class="col-md-4 col-sm-6 masonry-item blog-item wow fadeInUp">
            <div class="thumbnail" style="background-color: orange">
                <img src="styles/assets/img/wiart/wood3.jpg" class="img-responsive" alt="Image">
                <div class="caption">
                    <h3 style="color: white;">Hard Wood</h3>
                    <p>생활속에 자연을 넣다</p>
                    <p>함께 할수록</p>
                    <p>그 이상의 것이 되는 멋</p>
                    <hr class="dotted">
	                    <a href="#" class="btn btn-ar btn-primary pull-left" role="button">Button &raquo;</a>
	                    &nbsp;&nbsp;&nbsp;
	                    <a href="#" class="btn btn-ar btn-primary pull-left" role="button">Read more &raquo;</a>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div> <!-- masonry-item  --> 
        
        <div class="col-md-4 col-sm-6 masonry-item blog-item wow fadeInUp">
            <div class="thumbnail" style="background-color: orange">
                <img src="styles/assets/img/wiart/paint1.jpg" class="img-responsive" alt="Image">
                <div class="caption">
                    <h3 style="color: white;">Painting</h3>
                    <p>Paint -</p>
                    <p>표현 되는 순간</p>
                    <p>더욱 돋보이게</p>
                    <p>만드는 나만의 공간</p>
                    <hr class="dotted">
	                    <a href="#" class="btn btn-ar btn-primary pull-left" role="button">Button &raquo;</a>
	                    &nbsp;&nbsp;&nbsp;
	                    <a href="#" class="btn btn-ar btn-primary pull-left" role="button">Read more &raquo;</a>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div> <!-- masonry-item  --> 
        	         
	</div>
	  
</div> <!-- container -->
        
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
</div> <!-- boxed -->
</div> <!-- sb-site -->

</body>

</html>
