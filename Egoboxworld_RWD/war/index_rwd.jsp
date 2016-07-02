<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.EmbeddedEntity" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.EntityNotFoundException" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.KeyRange" %>

<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery.TooManyResultsException" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Query.CompositeFilter" %>
<%@ page import="com.google.appengine.api.datastore.Query.CompositeFilterOperator" %>
<%@ page import="com.google.appengine.api.datastore.Query.Filter" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterPredicate" %>
<%@ page import="com.google.appengine.api.datastore.Query.SortDirection" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>加購樂－Egobox</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    <%
						DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();    
					    Filter propertyFilter = new FilterPredicate("promote", FilterOperator.GREATER_THAN_OR_EQUAL, true);
					    Query q = new Query("Product").setFilter(propertyFilter);
					    List<Entity> results =
					        datastore.prepare(q.setKeysOnly()).asList(FetchOptions.Builder.withDefaults());
					        
					        Filter propertyFilterActive = new FilterPredicate("active", FilterOperator.GREATER_THAN_OR_EQUAL, true);
					    Query q_acitve = new Query("Product").setFilter(propertyFilterActive);
					    List<Entity> results_active =
					        datastore.prepare(q_acitve.setKeysOnly()).asList(FetchOptions.Builder.withDefaults());
					       
					      %>
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
							<li><a href="index_rwd.jsp"><img src="images/egobox_logo_s.jpg" width="128" height="49" alt="egobox logo" /></a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
							<li><a href="#"><i class="fa fa-envelope"></i>egoboxbuy@gmail.com</a></li>
								<!--<li><a href="#"><i class="fa fa-facebook"> Facebook</i></a></li>
								 <li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								 -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index_rwd.jsp" class="active">銘頂食品行</a></li>
								<li class="dropdown"><a href="#">買東西<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">商品</a></li>
                                    </ul>
                                </li> 
								<li><a href="form.pdf" target="_blank">團購單</a></li>
								<li><a href="#">聯絡我們</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>團購單</span></h1>
									<h2>FREE</h2>
									<button type="button" class="btn btn-default get"><a href="https://mall.shopee.tw/item/?sid=2965735&iid=7986532" target="_blank">我要購買</a></button>
								</div>
								<div class="col-sm-6">
									<img src="http://cf.shopee.tw/file/f5b567b8eccad5bb0fa36d02fcd37fdf" class="girl img-responsive" alt="" />
								</div>
							</div>
							
							<% 
					        for(int i=0;i<results.size();i++){
							    Entity got = datastore.get(results.get(i).getKey());
							 %>
							<div class="item">
									<div class="col-sm-6">
										<h1><span><%=got.getProperty("productName")%></span></h1>
										<h2><%=got.getProperty("productWeight")%>NT$<%=got.getProperty("productPrice")%>元</h2>
										<button type="button" class="btn btn-default get"><a href="https://mall.shopee.tw/item/?sid=2965735&iid=7986532" target="_blank">我要購買</a></button>
									</div>
									<div class="col-sm-6">
										<img src="<%=got.getProperty("imgURL")%>" class="girl img-responsive" alt="" />
									</div>
								</div>
							<%
							}
							 %>
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>商品類別</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											美食、伴手禮
										</a>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">零食 </a></li>
											<li><a href="#">其他 </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											居家生活
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">鍋碗瓢盆</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div><!--/category-products-->
					
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">購物商品</h2>
						
						<% 
					        for(int i=0;i<results_active.size();i++){
							    Entity got = datastore.get(results_active.get(i).getKey());
							 %>
								 <div class="col-sm-4">
									<div class="product-image-wrapper">
									<div class="single-products">
											<div class="productinfo text-center">
												<img src='<%=got.getProperty("imgURL")%>' alt="" />
												<h2>NT$<%=got.getProperty("productPrice")%>元</h2>
												<p><%=got.getProperty("productName")%>約<%=got.getProperty("productWeight")%></p>
												<a href="https://mall.shopee.tw/item/?sid=2965735&iid=8690009" class="btn btn-default add-to-cart" target="_blank"><i class="fa fa-shopping-cart"></i>我要購買</a>
											</div>
									</div>
									</div>
								</div>		
							<%
							}
							 %>
						
						
						
						
						
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
	
	<footer id="footer"><!--Footer-->
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>主要經營</h2>
							<ul class="nav nav-pills nav-stacked">
                     <li> 生活用品 </li>
                     <li>網路代購 </li>
                      <li>年貨商品 </li>
                      <li>批發團購 </li>
                      <li>二手商品  </li>
                      <li>代銷商品 </li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>銘頂食品行</h2>
							<form action="#" class="searchform">
								
								<p>
					 有問題可傳E-mail給我<br />
					egoboxbuy@gmail.com,我會儘快回復<br /><br />
					 目前付款方式只有蝦皮所提供的付款方式或面交,保障你我的權益。 <br /><br />
					 郵資計算方式是依客戶選擇方式計費。<br /><br />
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2016 Egobox-world Inc. All rights reserved.</p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>