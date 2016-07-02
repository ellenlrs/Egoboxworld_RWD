<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%-- //[START imports]--%>

<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.EmbeddedEntity" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.EntityNotFoundException" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.KeyRange" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%-- //[END imports]--%>

<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>

<form action="/insertProduct" method="post">
    <div>新增/修改商品：</div>
	<div>Product ID：<input type="text" name="Product" value="" size="100"/>ex:00001<P></div>
	<div>productName：<input type="text" name="productName" value="" size="100"/>ex:活力什錦果仁<P></div>
	<div>category：<input type="text" name="category" value="" size="100"/>ex:A01<P></div>
	<div>categoryName：<input type="text" name="categoryName" value="" size="100"/>ex:堅果類<P></div>
	<div>productWeight：<input type="text" name="productWeight" value="" size="100"/>ex:200克<P></div>
	<div>productPrice：<input type="text" name="productPrice" value="" size="100"/>ex:100<P></div>
	<div>active：<input type="text" name="active" value="" size="100"/>ex:true<P></div>
	<div>imgURL：<input type="text" name="imgURL" value="" size="100"/>ex:http://cf.shopee.tw/file/df496e0f867a64a997c8ccfae52a8e57<P></div>
	<div>promote：<input type="text" name="promote" value="" size="100"/>ex:false<P></div>
	
    <div><input type="submit" value="Submit"/></div>
</form>
<%-- //[END datastore]--%>

</body>
</html>
<%-- //[END all]--%>