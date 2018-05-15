<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
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
<%-- <%@ include file="/WEB-INF/views/layout/header/header.jsp" %> --%>
<!-- <header id="header-full-top" class="hidden-xs header-full"> -->
	<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>
<!-- </header> --> <!-- header-full -->

<!-- <nav class="navbar navbar-default navbar-header-full navbar-dark yamm navbar-static-top" role="navigation" id="header">
    <div class="container">
        Brand and toggle get grouped for better mobile display
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
            </button>
            <a id="ar-brand" class="navbar-brand hidden-lg hidden-md hidden-sm navbar-dark" href="index.html">Artificial <span>Reason</span></a>
        </div> navbar-header

        Collect the nav links, forms, and other content for toggling
        <div class="pull-right">
            <a href="javascript:void(0);" class="sb-icon-navbar sb-toggle-right"><i class="fa fa-bars"></i></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            	<li class="dropdown">
            		 <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">회사소개</a>
                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                        <li><a href="index_old.html">인사말</a></li>
                        <li><a href="../index.html">회사소개</a></li>
                        <li><a href="home_profile.html">찾아오시는길</a></li>                        
                    </ul>
            	</li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">주방가구</a>
                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                        <li><a href="index.html">New Default Home <span class="label label-success pull-right">New</span></a></li>
                        <li><a href="index_old.html">Option 1: Old Home</a></li>
                        <li><a href="home_services.html">Option 2: Services</a></li>
                        <li><a href="home_full.html">Option 3: Full Intro</a></li>
                        <li><a href="home_only_full.html">Option 4: Only Full Intro</a></li>
                        <li><a href="home_news.html">Option 5: News</a></li>
                        <li><a href="home_profile.html">Option 6: Professional Profile</a></li>
                        <li><a href="home_plan.html">Option 7: Subscribe</a></li>
                        <li role="presentation" class="dropdown-header">New Home Pages 1.4</li>
                        <li><a href="home_polygon.html">Option 8: Product <span class="label label-success pull-right">New</span></a></li>
                    </ul>
                </li>
                <li class="dropdown yamm-fw">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">붙박이장</a>
                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                        <li>
                            <div class="yamm-content">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-css3"></i> CSS</h4>
                                            <ul>
                                                <li><a href="css_typography.html"><i class="fa fa-font"></i> Typography</a></li>
                                                <li><a href="css_headers.html"><i class="fa fa-header"></i> Headers</a></li>
                                                <li><a href="css_dividers.html"><i class="fa fa-arrows-h"></i> Dividers</a></li>
                                                <li><a href="css_blockquotes.html"><i class="fa fa-quote-right"></i> Blockquotes</a></li>
                                                <li><a href="css_forms.html"><i class="fa fa-check-square-o"></i> Forms</a></li>
                                                <li><a href="css_tables.html"><i class="fa fa-table"></i> Tables</a></li>
                                            </ul>
                                        </div>
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-hand-o-up"></i> Buttons</h4>
                                            <ul>
                                                <li><a href="btn_basic_buttons.html"><i class="fa fa-arrow-circle-right"></i> Basic Buttons</a></li>
                                                <li><a href="btn_library_buttons.html"><i class="fa fa-arrow-circle-right"></i> Buttons Library <span class="label label-info pull-right">Update</span></a></li>
                                                <li><a href="btn_social_buttons.html"><i class="fa fa-arrow-circle-right"></i> Social Buttons</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-hand-o-up"></i> Icons</h4>
                                            <ul>
                                                <li><a href="icons_artificial_reason.html"><i class="fa fa-font"></i> Artificial Reason Icons</a></li>
                                                <li><a href="icons_glyph.html"><i class="fa fa-arrow-circle-right"></i> Glyphicons Icons</a></li>
                                                <li><a href="icons_awesome.html"><i class="fa fa-flag"></i> Font Awesome</a></li>
                                                <li><a href="icons_social.html"><i class="fa fa-twitter"></i> Social Icons</a></li>
                                            </ul>
                                        </div>
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-star"></i> New in 1.4</h4>
                                            <ul>
                                                <li><a href="components_cards.html"><i class="fa fa-user"></i> Profile Cards <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_counters.html"><i class="fa fa-sort-numeric-asc"></i> Counters <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_navtabs.html"><i class="fa fa-columns"></i> Navbar Tabs <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_masonry.html"><i class="fa fa-th"></i> Masonry Layer <span class="label label-success pull-right">New</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-list-alt"></i> Components</h4>
                                            <ul>
                                                <li><a href="components_dropdowns.html"><i class="fa fa-arrow-circle-right"></i> Components Dropdowns</a></li>
                                                <li><a href="components_panels.html"><i class="fa fa-columns"></i> Panels</a></li>
                                                <li><a href="components_lists.html"><i class="fa fa-list-ul"></i> Lists</a></li>
                                                <li><a href="components_paginations.html"><i class="fa fa-sort-numeric-asc"></i> Paginations</a></li>
                                                <li><a href="components_labels_badges.html"><i class="fa fa-flag-o"></i> Labels and Badges</a></li>
                                                <li><a href="components_alerts_wells.html"><i class="fa fa-info-circle"></i> Alerts and Wells</a></li>
                                                <li><a href="components_thumbnails.html"><i class="fa fa-picture-o"></i> Thumbnails</a></li>
                                                <li><a href="components_modals.html"><i class="fa fa-square"></i> Modals</a></li>
                                                <li><a href="components_progress_bars.html"><i class="fa fa-bars"></i> Progress Bars</a></li>
                                                <li><a href="components_tooltip_popover.html"><i class="fa fa-bullhorn"></i> Tooltip &amp; Popover</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-flag"></i> Extra Elements</h4>
                                            <ul>
                                                <li><a href="collapses_tabs.html"><i class="fa fa-tasks"></i> Collapses &amp; Tabs</a></li>
                                                <li><a href="components_vertical_tabs.html"><i class="fa fa-tasks"></i> Vertical Tabs <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_switch.html"><i class="fa fa-toggle-on"></i> Switch Controls <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="content_box.html"><i class="fa fa-list-alt"></i> Contents Box</a></li>
                                                <li><a href="carousels.html"><i class="fa fa-play-circle"></i> Carousels</a></li>
                                                <li><a href="charts.html"><i class="fa fa-tachometer"></i> Charts &amp; CountDowns</a></li>
                                                <li><a href="components_masonry.html"><i class="fa fa-th"></i> Masonry Layer <span class="label label-success pull-right">New</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">시공갤러리</a>
                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">주방</a>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">맞춤장</a>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">디자인</a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="page_profile.html">User Profile Option 1</a></li>
                                <li><a href="page_profile2.html">User Profile Option 2</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">디자인</a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="page_404.html">Error 404 Full Page</a></li>
                                <li><a href="page_404_2.html">Error 404 Integrated</a></li>
                                <li><a href="page_500.html">Error 500 Full Page</a></li>
                                <li><a href="page_500_2.html">Error 500 Integrated</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">Bussiness &amp; Products</a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="page_testimonial.html">Testimonials</a></li>
                                <li><a href="page_clients.html">Our Clients</a></li>
                                <li><a href="page_product.html">Products</a></li>
                                <li><a href="page_services.html">Services</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">Pricing</a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="page_pricing.html">Pricing Box</a></li>
                                <li><a href="page_pricing-mega.html">Pricing Mega Table</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">FAQ &amp; Support</a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="page_support.html">Support Center</a></li>
                                <li><a href="page_faq.html">FAQ Option 1</a></li>
                                <li><a href="page_faq2.html">FAQ Option 2</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">Coming Soon</a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="page_coming.html">Coming Soon Option 1</a></li>
                                <li><a href="page_coming2.html">Coming Soon Option 2</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                                <a href="javascript:void(0);" class="has_children">Timeline</a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="page_timeline_left.html">Timeline Left</a></li>
                                <li><a href="page_timeline.html">Timeline Center</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">견적쇼룸</a>
                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                        <li><a href="blog.html">Blog Right Sidebar</a></li>
                        <li><a href="blog_left.html">Blog Left Sidebar</a></li>
                        <li><a href="blog_full.html">Blog Full</a></li>
                        <li><a href="blog_masonry.html">Blog Masonry <span class="label label-success pull-right">New</span></a></li>
                        <li><a href="blog2.html">Other Option</a></li>
                        <li class="divider"></li>
                        <li><a href="single.html">Blog Item</a></li>
                        <li><a href="single_full.html">Blog Item Full</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">빌트인가전</a>
                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                        <li><a href="e-commerce_home.html">E-commerce Home</a></li>
                        <li><a href="e-commerce.html">E-commerce Filters</a></li>
                        <li><a href="e-commerce_product.html">Product</a></li>
                        <li><a href="e-commerce_cart.html">Cart</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">공지사항</a>
                     <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                        <li><a href="portfolio_sidebar.html">공지사항</a></li>
                        <li><a href="portfolio_topbar.html">이벤트</a></li>
                        <li><a href="portfolio_caption_hover.html">A/S접수</a></li>
                    </ul>
                </li>
             </ul>
        </div>navbar-collapse
    </div>container
</nav> -->

<section class="wrap-hero margin-bottom"> <!-- 전체 배경 -->
    <div id="carousel-example-ny" class="carousel carousel-hero slide" data-ride="carousel" data-interval="8000">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-ny" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-ny" data-slide-to="1"></li>
            <li data-target="#carousel-example-ny" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-push-6">
                            <div class="">
                            	<img src="styles/assets/img/colors/orange/wiart_logo.gif" alt="" ><!-- class="img-responsive animated zoomInUp animation-delay-30" -->
                                <!-- <img src="styles/assets/img/demo/mockup2.png" alt="" class="img-responsive animated zoomInUp animation-delay-30"> -->
                            </div>
                        </div>
                        <div class="col-md-6 col-md-pull-6">
                            <div class="carousel-caption">
                               <h1 class="animated fadeInDownBig animation-delay-7 carousel-title">Wiart <span>위아트 인테리어</span></h1>
<!--                                <ul class="list-unstyled carousel-list">
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-11"></i><span class="animated fadeInRightBig animation-delay-13">위아트 <strong>100 wiart</strong>, 가나다라마바사.</span></li>
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-15"></i><span class="animated fadeInRightBig animation-delay-16">Support and free <strong>updates forever</strong>.</span></li>
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-19"></i><span class="animated fadeInRightBig animation-delay-19">Everything is <strong>customizable</strong>. Colors, fonts, headers...</span></li>
                               </ul> -->
                               <p class="animated zoomIn animation-delay-20">Lorem ipsum dolor sit amet consectetur adipisicing elit. In rerum maxime quis tenetur dolor <span>recusandae a nulla</span> qui enim dolorem.</p>
<!-- 							   <div class="action-zone">
								   <a href="https://wrapbootstrap.com/theme/artificial-reason-responsive-full-pack-WB0307B17" class="btn btn-ar btn-transparent-opaque btn-xl animated fadeInUp animation-delay-22"><i class="fa fa-opencart"></i> Purchase Now</a>
								   <a href="#" class="btn btn-ar btn-transparent-opaque btn-xl animated fadeInUp animation-delay-25"><i class="fa fa-search"></i> Know More</a>
							   </div> --> <!-- 구입 버튼 purchase now , know more -->
                            </div>
                        </div>
                    </div> <!--row -->
                </div> <!-- container -->
            </div> <!-- item -->

            <div class="item">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-push-6">
                            <div class="carousel-object">
<!-- 
                                <img src="styles/assets/img/demo/wire1.png" class="img-responsive base animated animated-slow reveal animation-delay-25" alt="Image">
                                <img src="styles/assets/img/demo/wire1.png" class="img-responsive relative animated animated-slow reveal animation-delay-25" alt="Image">
                                <img src="styles/assets/img/demo/wire1shadow.png" class="img-responsive relative animated fadeIn animation-delay-40" alt="Image">
                                <img src="styles/assets/img/demo/wire1capture.png" class="img-responsive relative animated fadeIn animation-delay-45" alt="Image"> -->
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-md-pull-6">
                            <div class="carousel-caption">
                               <h1 class="animated fadeInDownBig animation-delay-7 carousel-title">We listen to <span>our customers</span></h1>
								<!--                               
							   <ul class="list-unstyled carousel-list">
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-11"></i><span class="animated fadeInRightBig animation-delay-13">You need a <strong>particular color</strong>? I ask us!</span></li>
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-15"></i><span class="animated fadeInRightBig animation-delay-16">Open to suggestions of <strong>new components</strong>.</span></li>
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-19"></i><span class="animated fadeInRightBig animation-delay-19">You can suggest <strong>new templates</strong>!</span></li>
                               </ul> -->
                               <p class="animated zoomIn animation-delay-20">Lorem ipsum dolor sit amet consectetur adipisicing elit. In rerum maxime quis tenetur dolor <span>recusandae a nulla</span> qui enim dolorem.</p>
<!--                                <div class="action-zone">
                                   <a href="https://wrapbootstrap.com/theme/artificial-reason-responsive-full-pack-WB0307B17" class="btn btn-ar btn-transparent-opaque btn-xl animated fadeInUp animation-delay-22"><i class="fa fa-opencart"></i> Purchase Now</a>
                                   <a href="#" class="btn btn-ar btn-transparent-opaque btn-xl animated fadeInUp animation-delay-25"><i class="fa fa-search"></i> Know More</a>
                               </div> -->
                            </div>
                        </div>
                    </div> <!--row -->
                </div> <!-- container -->
            </div> <!-- item -->

            <div class="item">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-push-6">
                            <div class="">
                                <!-- <img src="styles/assets/img/demo/mockup3.png" alt="" class="img-responsive animated zoomInRight animation-delay-30"> -->
                            </div>
                        </div>
                        <div class="col-md-6 col-md-pull-6">
                            <div class="carousel-caption">
                               <h1 class="animated fadeInDownBig animation-delay-7 carousel-title">We are preparing for <span>Bootstrap 4</span></h1>
 <!--                               <ul class="list-unstyled carousel-list">
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-11"></i><span class="animated fadeInRightBig animation-delay-13">We are creating a version for Bootstrap 4</strong>.</span></li>
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-15"></i><span class="animated fadeInRightBig animation-delay-16">It will be <strong>free</strong> for all customers.</span></li>
                                   <li class=""><i class="fa fa-angle-right animated fadeIn animation-delay-19"></i><span class="animated fadeInRightBig animation-delay-19"><strong>Quiet</strong>, we continue to develop the version for Bootstrap 3</span></li>
                               </ul> -->
                               <p class="animated zoomIn animation-delay-20">Lorem ipsum dolor sit amet consectetur adipisicing elit. In rerum maxime quis tenetur dolor <span>recusandae a nulla</span> qui enim dolorem.</p>
                               <!-- <div class="action-zone">
                                   <a href="https://wrapbootstrap.com/theme/artificial-reason-responsive-full-pack-WB0307B17" class="btn btn-ar btn-transparent-opaque btn-xl animated fadeInUp animation-delay-22"><i class="fa fa-opencart"></i> Purchase Now</a>
                                   <a href="#" class="btn btn-ar btn-transparent-opaque btn-xl animated fadeInUp animation-delay-25"><i class="fa fa-search"></i> Know More</a>
                               </div> -->
                            </div>
                        </div>
                    </div> <!--row -->
                </div> <!-- container -->
            </div> <!-- item -->
        </div> <!-- carousel-inner -->

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-ny" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="right carousel-control" href="#carousel-example-ny" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
    </div>
</section> <!-- carousel -->

<div class="container">
<!--     
    <section class="margin-bottom">
        <div class="row">
            <div class="col-md-12">
                <h2 class="right-line">Wiart </h2>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-cloud"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">Cloud Computing</h3>
                        <p>Praesentium cumque voluptate harum quae doloribus, atque error debitis, amet velit in similique, necessitatibus odit vero sunt.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-desktop"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">Web Design and SEO</h3>
                        <p>Praesentium cumque voluptate harum quae doloribus, atque error debitis, amet velit in similique, necessitatibus odit vero sunt.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-tablet"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">Mobile and Tablet Apps</h3>
                        <p>Praesentium cumque voluptate harum quae doloribus, atque error debitis, amet velit in similique, necessitatibus odit vero sunt.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-wordpress"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">Wordpress Themes</h3>
                        <p>Praesentium cumque voluptate harum quae doloribus, atque error debitis, amet velit in similique, necessitatibus odit vero sunt.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-graduation-cap"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">Training and development</h3>
                        <p>Praesentium cumque voluptate harum quae doloribus, atque error debitis, amet velit in similique, necessitatibus odit vero sunt.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="text-icon wow fadeInUp">
                    <span class="icon-ar icon-ar-lg"><i class="fa fa-paper-plane-o"></i></span>
                    <div class="text-icon-content">
                        <h3 class="no-margin">Customer service</h3>
                        <p>Praesentium cumque voluptate harum quae doloribus, atque error debitis, amet velit in similique, necessitatibus odit vero sunt.</p>
                    </div>
                </div>
            </div>
        </div> row
    </section>
 -->
<!-- 
    <p class="lead lead-lg text-center primary-color wow fadeIn animation-delay-3">Knows the <strong>Artificial Reason</strong> and surprise yourself</p>
    <p class="lead lead-sm text-center margin-bottom wow fadeIn animation-delay-5">Put here a short description or brief highlights in your app.</p>
 -->    
<!-- 
    <section class="margin-bottom margin-top">
        <ul class="nav nav-pills nav-justified ar-nav-pills max-width-500 center-block margin-bottom">
            <li><a href="#windows" data-toggle="tab"><i class="fa fa-windows"></i> Windows</a></li>
            <li class="active"><a href="#mac" data-toggle="tab"><i class="fa fa-apple"></i> MacOS X</a></li>
            <li><a href="#linux" data-toggle="tab"><i class="fa fa-linux"></i> Linux</a></li>
        </ul>

        <div class="tab-content margin-top">
            <div class="tab-pane" id="windows">
                <div class="row">
                    <div class="col-md-6 col-lg-5 col-md-push-6 col-lg-push-7">
                        <ul class="list-unstyled hand-list">
                            <li class="animated fadeInRight animation-delay-2">
                                <h2 class="handwriting no-margin">Ideas for your product</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                            <li class="animated fadeInRight animation-delay-4">
                                <h2 class="handwriting no-margin">Type here annotations</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                            <li class="animated fadeInRight animation-delay-6">
                                <h2 class="handwriting no-margin">An informal approach to design</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-lg-7 col-md-pull-6 col-lg-pull-5">
                        <img class="img-responsive animated zoomInDown animation-delay-3" src="styles/assets/img/demo/surface.jpg">
                    </div>
                </div>
            </div>
            <div class="tab-pane active" id="mac">
                <div class="row">
                    <div class="col-md-6 col-lg-5">
                        <ul class="list-unstyled hand-list">
                            <li class="wow fadeInLeft animation-delay-2">
                                <h2 class="handwriting no-margin">Ideas for your product</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                            <li class="wow fadeInLeft animation-delay-4">
                                <h2 class="handwriting no-margin">Type here annotations</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                            <li class="wow fadeInLeft animation-delay-6">
                                <h2 class="handwriting no-margin">An informal approach to design</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-lg-7">
                        <img class="img-responsive animated zoomInDown animation-delay-3" src="styles/assets/img/demo/new_mac.jpg">
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="linux">
                <div class="row">
                    <div class="col-md-6 col-lg-5 col-md-push-6 col-lg-push-7">
                        <ul class="list-unstyled hand-list">
                            <li class="animated fadeInRight animation-delay-2">
                                <h2 class="handwriting no-margin">Ideas for your product</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                            <li class="animated fadeInRight animation-delay-4">
                                <h2 class="handwriting no-margin">Type here annotations</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                            <li class="animated fadeInRight animation-delay-6">
                                <h2 class="handwriting no-margin">An informal approach to design</h2>
                                <p class="lead-hand">Lorem ipsum dolor sit amet, consectetur adipisicing elit provident tempore porro deserunt nostrum sapiente.</p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-lg-7 col-md-pull-6 col-lg-pull-5">
                        <img class="img-responsive animated zoomInDown animation-delay-3" src="styles/assets/img/demo/ubuntu_tablet.png">
                    </div>
                </div>
            </div>
        </div>
    </section> -->
</div> <!-- container -->
<!-- 
<section class="wrap-primary-color margin-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-3">
                <div class="text-center">
                    <div class="circle" id="circles-1"></div>
                    <h4 class="text-center">HTML 5</h4>
                    <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="text-center">
                    <div class="circle" id="circles-2"></div>
                    <h4 class="text-center">CSS 3</h4>
                    <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="text-center">
                    <div class="circle" id="circles-3"></div>
                    <h4 class="text-center">Jquery</h4>
                    <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="text-center">
                    <div class="circle" id="circles-4"></div>
                    <h4 class="text-center">Bootstrap 3</h4>
                    <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                </div>
            </div>
        </div>  
    </div>
</section>
 -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2 class="right-line">Wiart</h2>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="img-caption-ar wow fadeInUp">
                <img src="styles/assets/img/demo/w1.jpg" class="img-responsive" alt="Image">
                <div class="caption-ar">
                    <div class="caption-content">
                        <a href="#" class="animated fadeInDown"><i class="fa fa-search"></i>More info</a>
                        <h4 class="caption-title">Image title</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="img-caption-ar wow fadeInUp">
                <img src="styles/assets/img/demo/w2.jpg" class="img-responsive" alt="Image">
                <div class="caption-ar">
                    <div class="caption-content">
                        <a href="#" class="animated fadeInDown"><i class="fa fa-search"></i>More info</a>
                        <h4 class="caption-title">Image title</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="img-caption-ar wow fadeInUp">
                <img src="styles/assets/img/demo/w3.jpg" class="img-responsive" alt="Image">
                <div class="caption-ar">
                    <div class="caption-content">
                        <a href="#" class="animated fadeInDown"><i class="fa fa-search"></i>More info</a>
                        <h4 class="caption-title">Image title</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="img-caption-ar wow fadeInUp">
                <img src="styles/assets/img/demo/w4.jpg" class="img-responsive" alt="Image">
                <div class="caption-ar">
                    <div class="caption-content">
                        <a href="#" class="animated fadeInDown"><i class="fa fa-search"></i>More info</a>
                        <h4 class="caption-title">Image title</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="img-caption-ar wow fadeInUp">
                <img src="styles/assets/img/demo/w5.jpg" class="img-responsive" alt="Image">
                <div class="caption-ar">
                    <div class="caption-content">
                        <a href="#" class="animated fadeInDown"><i class="fa fa-search"></i>More info</a>
                        <h4 class="caption-title">Image title</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="img-caption-ar wow fadeInUp">
                <img src="styles/assets/img/demo/w6.jpg" class="img-responsive" alt="Image">
                <div class="caption-ar">
                    <div class="caption-content">
                        <a href="#" class="animated fadeInDown"><i class="fa fa-search"></i>More info</a>
                        <h4 class="caption-title">Image title</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="section-lines">
    <div class="container">
        <div class="row">
            <div class="col-md-12 padding-40">
                <p class="slogan text-center no-margin">Discover our projects and the rigorous process of <span>creation</span>. Our principles are <span>creativity</span>, <span>design</span>, <span>experience</span> and <span>knowledge</span>. We are backed by 20 years of <span>research</span>.</p>
            </div>
        </div>
    </div>
</section>

<div class="container margin-bottom">
    <div class="row">
        <div class="col-md-12">
            <h2 class="right-line no-margin-bottom">About us</h2>
        </div>
        <div class="col-md-6 animated fadeInLeft animation-delay-8">
            <h3>Description</h3>
            <p class="animated">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat cum laudantium quos tempora magnam voluptas sint perspiciatis nulla ipsa itaque atque quod incidunt maiores iusto, laborum, magni aliquam. Aut eligendi nesciunt nobis eum dolorum maxime corporis dicta, repudiandae eveniet ab laboriosam minima voluptate quaerat sequi modi suscipit cumque unde. Rerum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis porro, magni obcaecati cupiditate nulla rem quae, eveniet corrupti reprehenderit maiores nobis doloribus expedita non quasi itaque. Incidunt, delectus quidem vitae laudantium, natus quibusdam odio eius eligendi tenetur! Ea, repudiandae eveniet ab minima laboriosam minima voluptate quaerat sequi harum. Aspernatur harum labore voluptates modi aperiam sunt, sit quaerat, soluta perspiciatis.</p>
        </div>
        <div class="col-md-6">
            <h3>Knowledge</h3>
            <div class="progress progress-lg animated fadeInUp animation-delay-6">
              <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                HTML 5 &amp; CSS 3
              </div>
            </div>
            <div class="progress progress-lg animated fadeInUp animation-delay-8">
              <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                Javascript &amp; Jquery
              </div>
            </div>
            <div class="progress progress-lg animated fadeInUp animation-delay-10">
              <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                PHP 5 &amp; MYSQL 5
              </div>
            </div>
            <div class="progress progress-lg animated fadeInUp animation-delay-12">
              <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                C/C++
              </div>
            </div>
            <div class="progress progress-lg animated fadeInUp animation-delay-14">
              <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                Python
              </div>
            </div>
            <div class="progress progress-lg animated fadeInUp animation-delay-16">
              <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                Node.js
              </div>
            </div>
        </div>
    </div>
</div> <!-- container -->

<div class="container">
    <section class="css-section">
        <div class="row">
            <div class="col-md-12">
                <h2 class="right-line">Some numerical data</h2>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="content-box box-default wow zoomInUp animation-delay-2">
                    <h4 id="count-coffees" class="content-box-title counter">450</h4>
                    <i class="fa fa-4x fa-coffee primary-color"></i>
                    <p class="margin-top-20 no-margin-bottom lead small-caps">cups of coffee</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="content-box box-default wow zoomInUp animation-delay-4">
                    <h4 id="count-coffees" class="content-box-title counter">64</h4>
                    <i class="fa fa-4x fa-briefcase primary-color"></i>
                    <p class="margin-top-20 no-margin-bottom lead small-caps">projects done</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="content-box box-default wow zoomInUp animation-delay-6">
                    <h4 id="count-coffees" class="content-box-title counter">600</h4>
                    <i class="fa fa-4x fa-comments-o primary-color"></i>
                    <p class="margin-top-20 no-margin-bottom lead small-caps">comments</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="content-box box-default wow zoomInUp animation-delay-8">
                    <h4 id="count-coffees" class="content-box-title counter">3500</h4>
                    <i class="fa fa-4x fa-group primary-color"></i>
                    <p class="margin-top-20 no-margin-bottom lead small-caps">happy clients</p>
                </div>
            </div>
        </div>
    </section>
</div> <!-- container -->

<div class="container">
    <h2 class="right-line">Available Plans</h2>
    <section class="css-section">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="pricign-box wow fadeInUp animation-delay-7">
                    <div class="pricing-box-header">
                        <h2>Personal</h2>
                        <p>nisi anim mollit in labore ut esse</p>
                    </div>
                    <div class="pricing-box-price">
                        <h3>$ 10 <sub>/ month</sub> </h3>
                    </div>
                    <div class="pricing-box-content">
                        <ul>
                            <li><i class="fa fa-inbox"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-cloud-download"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-dashboard"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-sitemap"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-shopping-cart"></i> Exercitation in id in officia.</li>
                        </ul>
                    </div>
                    <div class="pricing-box-footer">
                        <a href="#" class="btn btn-ar btn-default">Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="pricign-box pricign-box-pro wow fadeInUp animation-delay-9">
                    <div class="pricing-box-header">
                        <h2>Professional</h2>
                        <p>nisi anim mollit in labore ut esse</p>
                    </div>
                    <div class="pricing-box-price">
                        <h3>$ 25 <sub>/ month</sub> </h3>
                    </div>
                    <div class="pricing-box-content">
                        <ul>
                            <li><i class="fa fa-inbox"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-cloud-download"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-dashboard"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-sitemap"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-shopping-cart"></i> Exercitation in id in officia.</li>
                        </ul>
                    </div>
                    <div class="pricing-box-footer">
                        <a href="#" class="btn btn-ar btn-primary">Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="pricign-box wow fadeInUp animation-delay-8">
                    <div class="pricing-box-header">
                        <h2>Ultimate</h2>
                        <p>nisi anim mollit in labore ut esse</p>
                    </div>
                    <div class="pricing-box-price">
                        <h3>$ 10 <sub>/ month</sub> </h3>
                    </div>
                    <div class="pricing-box-content">
                        <ul>
                            <li><i class="fa fa-inbox"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-cloud-download"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-dashboard"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-sitemap"></i> Exercitation in id in officia.</li>
                            <li><i class="fa fa-shopping-cart"></i> Exercitation in id in officia.</li>
                        </ul>
                    </div>
                    <div class="pricing-box-footer">
                        <a href="#" class="btn btn-ar btn-default">Order Now</a>
                    </div>
                </div>
            </div>
        </div> <!-- row -->
    </section>
</div>

<div class="container">
    <h2 class="right-line">Our Team</h2>
    <div class="row">
        <div class="col-sm-6 col-md-3">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-2">
                <div class="panel-heading">
                    <img src="styles/assets/img/demo/card1.jpg" />
                    <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button>
                </div>
                <div class="panel-figure">
                    <img class="img-responsive img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/adellecharles/73.jpg" />
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">@Paul</a></h4>
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
        <div class="col-sm-6 col-md-3">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-4">
                <div class="panel-heading">
                    <img src="styles/assets/img/demo/card2.jpg" />
                    <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button>
                </div>
                <div class="panel-figure">
                    <img class="img-responsive img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/josue/73.jpg" />
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">@Anna</a></h4>
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
        <div class="col-sm-6 col-md-3">
            <div class="panel panel-default panel-card wow fadeInRight animation-delay-6">
                <div class="panel-heading">
                    <img src="styles/assets/img/demo/card3.jpg" />
                    <button class="btn btn-primary btn-ar btn-sm" role="button">Follow</button>
                </div>
                <div class="panel-figure">
                    <img class="img-responsive img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/mutlu82/73.jpg" />
                </div>
                <div class="panel-body text-center">
                    <h4 class="panel-header"><a href="#">@Patrick</a></h4>
                    <small>A short description goes here.</small>
                </div>
                <div class="panel-thumbnails">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="assets/img/img60.jpg" />
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="thumbnail">
                                <img src="assets/img/img60.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
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

    <section class="margin-top">
        <p class="slogan text-center">Discover our projects and the rigorous process of <span>creation</span>. Our principles are <span>creativity</span>, <span>design</span>, <span>experience</span> and <span>knowledge</span>. We are backed by 20 years of <span>research</span>.</p>
        <h2 class="section-title">Our Clients</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="bxslider-controls">
                    <span id="bx-prev5"></span>
                    <span id="bx-next5"></span>
                </div>
                <ul class="bxslider" id="home-block">
                    <li>
                        <blockquote class="blockquote-color">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante ultricies nisi vel augue quam semper libero.</p>
                            <footer>Brian Krzanich, Intel CEO</footer>
                        </blockquote>
                    </li>
                    <li>
                        <blockquote class="blockquote-color">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante ultricies nisi vel augue quam semper libero.</p>
                            <footer>Brian Krzanich, Intel CEO</footer>
                        </blockquote>
                    </li>
                    <li>
                        <blockquote class="blockquote-color">
                            <p>Dolore totam at ea reiciendis suscipit a tempore cum nisi aspernatur nisi alias posuere erat a ante posuere erat a ante ultricies ultricies nisi vel augue quam semper conse erat quuntur.</p>
                            <footer>Sheldon Cooper, Physical Quantum</footer>
                        </blockquote>
                    </li>
                    <li>
                        <blockquote class="blockquote-color">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante ultricies nisi vel augue quam semper libero.</p>
                            <footer>Brian Krzanich, Intel CEO</footer>
                        </blockquote>
                    </li>
                </ul>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/intel.png" alt="" class="img-responsive"></div>
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/microsoft.png" alt="" class="img-responsive"></div>
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/nokia.png" alt="" class="img-responsive"></div>
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/samsung.png" alt="" class="img-responsive"></div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/anz.png" alt="" class="img-responsive"></div>
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/maxis.png" alt="" class="img-responsive"></div>
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/sony.png" alt="" class="img-responsive"></div>
                    <div class="col-md-3 col-sm-3 col-xs-6"><img src="styles/assets/img/demo/hp.png" alt="" class="img-responsive"></div>
                </div>
            </div>
        </div>
    </section>

</div> <!-- container -->

<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
<!-- 
<aside id="footer-widgets">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3 class="footer-widget-title">Sitemap</h3>
                <ul class="list-unstyled three_cols">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="portfolio_sidebar.html">Portafolio</a></li>
                    <li><a href="portfolio_topvar.html">Works</a></li>
                    <li><a href="page_timeline_left.html">Timeline</a></li>
                    <li><a href="page_pricing.html">Pricing</a></li>
                    <li><a href="page_about2.html">About Us</a></li>
                    <li><a href="page_team.html">Our Team</a></li>
                    <li><a href="page_services.html">Services</a></li>
                    <li><a href="page_support.html">FAQ</a></li>
                    <li><a href="page_login_full.html">Login</a></li>
                    <li><a href="page_contact.html">Contact</a></li>
                </ul>
                <h3 class="footer-widget-title">Subscribe</h3>
                <p>Lorem ipsum Amet fugiat elit nisi anim mollit minim labore ut esse Duis ullamco ad dolor veniam velit.</p>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Email Adress">
                    <span class="input-group-btn">
                        <button class="btn btn-ar btn-primary" type="button">Subscribe</button>
                    </span>
                </div>/input-group
            </div>
            <div class="col-md-4">
                <div class="footer-widget">
                    <h3 class="footer-widget-title">Recent Post</h3>
                    <div class="media">
                        <a class="pull-left" href="#"><img class="media-object" src="styles/assets/img/demo/m2.jpg" width="75" height="75" alt="image"></a>
                        <div class="media-body">
                            <h4 class="media-heading"><a href="#">Lorem ipsum Duis quis occaecat minim lorem ipsum tempor officia labor</a></h4>
                            <small>August 18, 2013</small>
                        </div>
                    </div>
                    <div class="media">
                        <a class="pull-left" href="#"><img class="media-object" src="styles/assets/img/demo/m11.jpg" width="75" height="75" alt="image"></a>
                        <div class="media-body">
                            <h4 class="media-heading"><a href="#">Lorem ipsum dolor excepteur sunt in lorem ipsum cillum tempor</a></h4>
                            <small>September 14, 2013</small>
                        </div>
                    </div>
                    <div class="media">
                        <a class="pull-left" href="#"><img class="media-object" src="styles/assets/img/demo/m4.jpg" width="75" height="75" alt="image"></a>
                        <div class="media-body">
                            <h4 class="media-heading"><a href="#">Lorem ipsum Dolor cupidatat minim adipisicing et fugiat</a></h4>
                            <small>October 9, 2013</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="footer-widget">
                    <h3 class="footer-widget-title">Recent Works</h3>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-3 col-xs-6">
                            <a href="#" class="thumbnail"><img src="styles/assets/img/demo/wf1.jpg" class="img-responsive" alt="Image"></a>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-3 col-xs-6">
                            <a href="#" class="thumbnail"><img src="styles/assets/img/demo/wf2.jpg" class="img-responsive" alt="Image"></a>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-3 col-xs-6">
                            <a href="#" class="thumbnail"><img src="styles/assets/img/demo/wf3.jpg" class="img-responsive" alt="Image"></a>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-3 col-xs-6">
                            <a href="#" class="thumbnail"><img src="styles/assets/img/demo/wf4.jpg" class="img-responsive" alt="Image"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div> row
    </div> container
</aside> footer-widgets

<footer id="footer">
    <p>&copy; 2017 <a href="#">Wiart</a>, inc. All rights reserved.</p>
</footer>
 -->
</div> <!-- boxed -->
</div> <!-- sb-site -->

<div class="sb-slidebar sb-right sb-style-overlay">
    <div class="input-group">
        <input type="text" class="form-control" placeholder="Search...">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
        </span>
    </div><!-- /input-group -->

    <h2 class="slidebar-header no-margin-bottom">Navigation</h2>
    <ul class="slidebar-menu">
        <li><a href="index.html">Home</a></li>
        <li><a href="portfolio_topbar.html">Portfolio</a></li>
        <li><a href="page_about3.html">About us</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="page_contact.html">Contact</a></li>
    </ul>

    <h2 class="slidebar-header">Social Media @</h2>
    <div class="slidebar-social-icons">
        <a href="#" class="social-icon-ar rss"><i class="fa fa-rss"></i></a>
        <a href="#" class="social-icon-ar facebook"><i class="fa fa-facebook"></i></a>
        <a href="#" class="social-icon-ar twitter"><i class="fa fa-twitter"></i></a>
        <a href="#" class="social-icon-ar pinterest"><i class="fa fa-pinterest"></i></a>
        <a href="#" class="social-icon-ar instagram"><i class="fa fa-instagram"></i></a>
        <a href="#" class="social-icon-ar wordpress"><i class="fa fa-wordpress"></i></a>
        <a href="#" class="social-icon-ar linkedin"><i class="fa fa-linkedin"></i></a>
        <a href="#" class="social-icon-ar flickr"><i class="fa fa-flickr"></i></a>
        <a href="#" class="social-icon-ar vine"><i class="fa fa-vine"></i></a>
        <a href="#" class="social-icon-ar dribbble"><i class="fa fa-dribbble"></i></a>
    </div>
</div> <!-- sb-slidebar sb-right -->
<div id="back-top">
    <a href="#header"><i class="fa fa-chevron-up"></i></a>
</div>

<!-- Scripts -->
<!-- Compiled in vendors.js -->
<!--
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.cookie.js"></script>
<script src="assets/js/imagesloaded.pkgd.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-switch.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/slidebars.min.js"></script>
<script src="assets/js/jquery.bxslider.min.js"></script>
<script src="assets/js/holder.js"></script>
<script src="assets/js/buttons.js"></script>
<script src="assets/js/jquery.mixitup.min.js"></script>
<script src="assets/js/circles.min.js"></script>
<script src="assets/js/masonry.pkgd.min.js"></script>
<script src="assets/js/jquery.matchHeight-min.js"></script>
-->

<!-- <script src="styles/assets/js/vendors.js"></script> -->

<!--<script type="text/javascript" src="assets/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
<script type="text/javascript" src="assets/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>-->


<!-- Syntaxhighlighter -->
<!-- 
<script src="styles/assets/js/syntaxhighlighter/shCore.js"></script>
<script src="styles/assets/js/syntaxhighlighter/shBrushXml.js"></script>
<script src="styles/assets/js/syntaxhighlighter/shBrushJScript.js"></script>

<script src="styles/assets/js/DropdownHover.js"></script>
<script src="styles/assets/js/app.js"></script>
<script src="styles/assets/js/holder.js"></script>
<script src="styles/assets/js/home_info.js"></script>
 -->
</body>

</html>
