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
	String user_type = (String)session.getAttribute("user_type");
	if(user_type.equals("sto_user")) {
%>
	<frameset rows = "56px,*">
		<frame frameborder="0" src = <%=WhiteList.instance.getWhitelistJsp(0) %> name = "top">
		<frameset cols = "300px, *">	
			<frame frameborder="0" style="border:5px; border-color:orange; border-style:solid;" src = <%=WhiteList.instance.getWhitelistJsp(6) %> name = "target1">
			<frame frameborder="0" style="border:5px; border-color:orange; border-style:solid;" src = <%=WhiteList.instance.getWhitelistJsp(7) %> name = "target2">
		</frameset>
	</frameset>
<%
	}
	else {
		out.println("가게 계정만 이용가능한 페이지 입니다.");
	}
%>
<body>
<h1>가게 서비스 화면</h1>
</body>
</html>