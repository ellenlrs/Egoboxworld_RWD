<%@ page language="java" contentType="text/html;charset=utf-8"%>
<html>
<head>
	<title>Redirect</title>
</head>

<body>
	 <%
        
        //String site = new String("http://www.facebook.com/egoboxworld/");
	 String site = new String("https://mall.shopee.tw/shop/?sid=2965735&source=search#shopid=2965735");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 

    %>
</body>
</html>