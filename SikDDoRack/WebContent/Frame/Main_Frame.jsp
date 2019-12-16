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
<frameset rows = "56px,*">
	<frame frameborder="0" src = <%=WhiteList.instance.getWhitelistJsp(0) %> name = "top">
	<frameset cols = "300px, *">
		<frame frameborder="0" style="border:5px; border-color:orange; border-style:solid;" src = <%=WhiteList.instance.getWhitelistJsp(2) %>>
		<frame frameborder="0" src = <%=WhiteList.instance.getWhitelistJsp(1) %> name = "map">
	</frameset>
</frameset>
<body>


</body>
</html>