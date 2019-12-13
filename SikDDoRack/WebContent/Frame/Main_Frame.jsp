<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	
%>
<frameset rows = "10%,*">
	<frame src = <%=WhiteList.instance.getWhitelistJsp(0) %> name = "top">
	<frameset cols = "15%, *">
		<frame src = <%=WhiteList.instance.getWhitelistJsp(2) %>>
		<frame src = <%=WhiteList.instance.getWhitelistJsp(1) %> name = "map">
	</frameset>
</frameset>
<body>


</body>
</html>