<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id"); 
%>
	<h5><%=id %>님 환영합니다!</h5> 
</body>
</html>