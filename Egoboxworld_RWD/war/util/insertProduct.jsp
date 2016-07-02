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

<%-- //[END imports]--%>

<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
    
    <style>
		table, th, td {
		    border: 1px solid black;
		    border-collapse: collapse;
		}
		th, td {
		    padding: 5px;
		    text-align: left;
		}
		table#t01 {
		    width: 100%;
		    
		}
		th, td#t01  {
		    padding: 5px;
		    text-align: left;
		    background-color: #f1f1c1;
		}
		</style>
</head>
<body>
					<%
						DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();  
						String key=request.getParameter("key")==null?"":request.getParameter("key");
						String productid="";
					    String productName="";
					    String category="";
					    String categoryName="";
					    String productWeight="";
					    String productPrice="";
					    String active="";
					    String imgURL="";
					    String promote="";
					    String shippingURL="";
						if(!key.equals("")){
							    Entity a = new Entity("Product", key);
								Entity a_product = datastore.get(a.getKey());
							    productid=a_product.getKey().getName()==null?"":a_product.getKey().getName();
							    productName=a_product.getProperty("productName")==null?"":a_product.getProperty("productName").toString();
							    category=a_product.getProperty("category")==null?"":a_product.getProperty("category").toString();
							    categoryName=a_product.getProperty("categoryName")==null?"":a_product.getProperty("categoryName").toString();
							    productWeight=a_product.getProperty("productWeight")==null?"":a_product.getProperty("productWeight").toString();
							    productPrice=a_product.getProperty("productPrice")==null?"":a_product.getProperty("productPrice").toString();
							    active=a_product.getProperty("active")==null?"":a_product.getProperty("active").toString();
							    imgURL=a_product.getProperty("imgURL")==null?"":a_product.getProperty("imgURL").toString();
							    promote=a_product.getProperty("promote")==null?"":a_product.getProperty("promote").toString();
							    shippingURL=a_product.getProperty("shippingURL")==null?"":a_product.getProperty("shippingURL").toString();
						}
					    %> 

<form action="/insertProduct" method="post">
    <div>新增/修改商品：</div>
	<div>Product ID：<input type="text" name="Product" value="<%=productid%>" size="100"/>ex:00001<P></div>
	<div>productName：<input type="text" name="productName" value="<%=productName%>" size="100"/>ex:活力什錦果仁<P></div>
	<div>category：<input type="text" name="category" value="<%=category%>" size="100"/>ex:A01<P></div>
	<div>categoryName：<input type="text" name="categoryName" value="<%=categoryName%>" size="100"/>ex:堅果類<P></div>
	<div>productWeight：<input type="text" name="productWeight" value="<%=productWeight%>" size="100"/>ex:200克<P></div>
	<div>productPrice：<input type="text" name="productPrice" value="<%=productPrice%>" size="100"/>ex:100<P></div>
	<div>active：<input type="text" name="active" value="<%=active%>" size="100"/>ex:true<P></div>
	<div>imgURL：<input type="text" name="imgURL" value="<%=imgURL%>" size="100"/>ex:http://cf.shopee.tw/file/df496e0f867a64a997c8ccfae52a8e57<P></div>
	<div>promote：<input type="text" name="promote" value="<%=promote%>" size="100"/>ex:false<P></div>
	<div>shippingURL：<input type="text" name="shippingURL" value="<%=shippingURL%>" size="100"/>ex:https://mall.shopee.tw/item/?sid=2965735&iid=7813007<P></div>
    <div><input type="submit" value="新增／修改"/></div>
</form>

<%
					   // Filter propertyFilter = new FilterPredicate("promote", FilterOperator.GREATER_THAN_OR_EQUAL, true);
					    //Query q = new Query("Product").setFilter(propertyFilter);
					    Query q = new Query("Product");
					    List<Entity> results =
					        datastore.prepare(q.setKeysOnly()).asList(FetchOptions.Builder.withDefaults());
					    %> 
					      <table border="1" id="t01">
						 	<tr><th>Product ID</th><th>productName</th><th>category</th><th>categoryName</th><th>productWeight</th><th>productPrice</th><th>active</th><th>imgURL</th><th>promote</th><th>shippingURL</th></tr>
					    <%
				        for(int i=0;i<results.size();i++){
						    Entity got = datastore.get(results.get(i).getKey());
						 %>
						 	<tr><td><a href="/util/insertProduct.jsp?key=<%=got.getKey().getName()%>"><%=got.getKey().getName()%></a></td>
						 	<td><%=got.getProperty("productName")%></td><td><%=got.getProperty("category")%></td><td><%=got.getProperty("categoryName")%></td><td><%=got.getProperty("productWeight")%></td><td><%=got.getProperty("productPrice")%></td><td><%=got.getProperty("active")%></td><td><%=got.getProperty("imgURL")%></td><td><%=got.getProperty("promote")%></td><td><%=got.getProperty("shippingURL")%></td></tr>
						
						<%} %>
					     </table>

</body>
</html>
