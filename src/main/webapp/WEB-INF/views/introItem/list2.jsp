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
        <h1 class="page-title">빌트인</h1>

        <ol class="breadcrumb pull-right">
            <li><a href="#">제품소개</a></li>
            <li class="active">싱크대</li>
        </ol>
    </div>
</header>
<div class="container">
    <div class="portfolio-topbar hidden-sm hidden-xs">
        <div class="row">
            <div class="col-md-8">
                <h4>Categories</h4>
                <ul class="portfolio-topbar-cats">
                    <li><span class="filter" data-filter="all">All</span></li>
                    <li><span class="filter" data-filter=".category-1">Web Desing</span></li>
                    <li><span class="filter" data-filter=".category-2">Game Engines</span></li>
                    <li><span class="filter" data-filter=".category-3">Users interfaces</span></li>
                    <li><span class="filter" data-filter=".category-4">Wordpress</span></li>
                    <li><span class="filter" data-filter=".category-5">Themes</span></li>
                    <li><span class="filter" data-filter=".category-6">Others</span></li>
                </ul>
                <span class="topbar-border">&nbsp;</span>
            </div>
            <div class="col-md-2 port-fix">
                <h4>Columns</h4>
                <ul class="portfolio-topbar-cols">
                    <li><a href="javascript:void(0);" id="Cols1">1</a></li>
                    <li><a href="javascript:void(0);" id="Cols2">2</a></li>
                    <li><a href="javascript:void(0);" id="Cols3" class="active">3</a></li>
                    <li><a href="javascript:void(0);" id="Cols4">4</a></li>
                </ul>
            </div>
            <div class="col-md-2">
                <h4>Description</h4>
                <ul class="portfolio-topbar-desc">
                    <li><a href="javascript:void(0);" id="port-show">Show</a></li>
                    <li><a href="javascript:void(0);" id="port-hide" class="active">Hide</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row" id="Container">
                <div class="mix category-1 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img01.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, quod?</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img02.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, delectus!</p>
                    </div>
                </div>
                <div class="mix category-1 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img03.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas, tenetur.</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img04.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum, doloremque?</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img05.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, nobis.</p>
                    </div>
                </div>
                <div class="mix category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img06.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi, voluptas.</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img07.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum, quo.</p>
                    </div>
                </div>
                <div class="mix category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img08.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, itaque?</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img09.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img10.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-6 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img11.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-6 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img12.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img13.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img14.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img15.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 category-3 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img16.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-1 category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img17.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-4 category-1 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img18.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-6 category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img19.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-1 category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img20.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-5 category-1  col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img21.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 category-5 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img22.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-3 category-1 category-4 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img23.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
                <div class="mix category-2 col-md-4 col-sm-6 col-xs-12">
                    <a href="#" class="thumbnail">
                        <img src="/styles/assets/img/demo/img24.jpg" alt="" class="img-responsive">
                    </a>
                    <div class="portfolio-item-caption hide">
                        <h4>Lorem ipsum dolor</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, velit!</p>
                    </div>
                </div>
            </div>
        </div> <!-- col-md-9 -->
    </div>
</div> <!-- container -->
<!-- <script type="text/javascript" src="/styles/assets/js/portfolio.js"></script> -->
<script  src="/styles/assets/js/vendors.js"></script>
<script  src="/styles/assets/js/portfolio.js"></script>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
