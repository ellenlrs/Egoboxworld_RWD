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
	<div>Product ID：<input type="text" name="Product" value="00001" size="100"/></div>
	<div>productName：<input type="text" name="productName" value="活力什錦果仁" size="100"/></div>
	<div>category：<input type="text" name="category" value="A01" size="100"/></div>
	<div>categoryName：<input type="text" name="categoryName" value="堅果類" size="100"/></div>
	<div>productWeight：<input type="text" name="productWeight" value="200克" size="100"/></div>
	<div>productPrice：<input type="text" name="productPrice" value="100" size="100"/></div>
	<div>active：<input type="text" name="active" value="true" size="100"/></div>
	<div>imgURL：<input type="text" name="imgURL" value="http://cf.shopee.tw/file/df496e0f867a64a997c8ccfae52a8e57" size="100"/></div>
	<div>promote：<input type="text" name="promote" value="false" size="100"/></div>
	
    <div><input type="submit" value="Submit"/></div>
</form>
<%-- //[END datastore]--%>

</body>
</html>
<%-- //[END all]--%>