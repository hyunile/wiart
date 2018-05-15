<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>



<script type="text/javascript">
/* $(function(){
	
	$("#cate0").click(function(){$(".page-title").text("전체");});
	$("#cate1").click(function(){$(".page-title").text("싱크대");});
	$("#cate2").click(function(){$(".page-title").text("붙박이장");});
	$("#cate3").click(function(){$(".page-title").text("상판");});
	$("#cate4").click(function(){$(".page-title").text("빌트인");});
	$("#cate5").click(function(){$(".page-title").text("Themes");});
	$("#cate6").click(function(){$(".page-title").text("Others");});
}) */
</script>	   
<header class="main-header"  style="padding :10px 0">
    <div class="container">
        <h1 class="page-title">싱크대</h1>

        <ol class="breadcrumb pull-right">
            <li><a href="#">제품소개</a></li>
            <li class="active">싱크대</li>
        </ol>
    </div>
</header>
<div class="container">
    <div class="row">
        <div class="col-md-3 hidden-sm hidden-xs">
            <div class="portfolio-menu">
                <h3><i class="fa fa-desktop"></i> 보기설정</h3>
                <h4><i class="fa fa-folder-open-o"></i> 카테고리</h4>
                <ul class="portfolio-cats">
                    <li><span class="filter" id="cate0" data-filter="all">전체</span></li>
                    <li><span class="filter" id="cate1" data-filter=".category-1">싱크대</span></li>
                    <li><span class="filter" id="cate2" data-filter=".category-2">붙박이장</span></li>
                    <li><span class="filter" id="cate3" data-filter=".category-3">상판</span></li>
                    <li><span class="filter" id="cate4" data-filter=".category-4">빌트인</span></li>
                    <li><span class="filter" id="cate5" data-filter=".category-5">Themes</span></li>
                    <li><span class="filter" id="cate6" data-filter=".category-6">Others</span></li>
                </ul>
                <h4><i class="fa fa-th"></i> Columns</h4>
                <ul class="portfolio-cols">
                    <li><a href="javascript:void(0);" id="Cols1">1</a></li>
                    <li><a href="javascript:void(0);" id="Cols2">2</a></li>
                    <li><a href="javascript:void(0);" id="Cols3" class="active">3</a></li>
                    <li><a href="javascript:void(0);" id="Cols4">4</a></li>
                </ul>
                <div class="clearfix"></div>
                <h4><i class="fa fa-align-justify"></i> 설명보기여부</h4>
                <ul class="portfolio-desc">
                    <li><a href="javascript:void(0);" id="port-show" class="active">Show</a></li>
                    <li><a href="javascript:void(0);" id="port-hide">Hide</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div> <!-- col-md-3 -->
        
        <div class="col-md-9">
            <div class="row" id="Container">
                <div class="mix category-1 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img01.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show"><!-- show 부분, 설명 on/off  -->
                        <h4>싱크대</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, quod?</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img02.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, delectus!</p>
                    </div>
                </div>
                <div class="mix category-1 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img03.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>싱크대</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas, tenetur.</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img04.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show"> 
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum, doloremque?</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img05.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, nobis.</p>
                    </div>
                </div>
                <div class="mix category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img06.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi, voluptas.</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img07.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum, quo.</p>
                    </div>
                </div>
                <div class="mix category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img08.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, itaque?</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img09.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img10.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-6 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img11.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-6 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img12.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img13.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img14.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img15.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img16.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-1 category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img17.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>싱크대</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-4 category-1 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img18.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-6 category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img19.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-1 category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img20.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>싱크대</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-5 category-1  col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img21.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img22.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-3 category-1 category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img23.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img24.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption show">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
            </div>
        </div> <!-- col-md-9 -->
    </div>
</div> <!-- container -->
<script type="text/javascript" src="/styles/assets/js/portfolio.js"></script>

<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
