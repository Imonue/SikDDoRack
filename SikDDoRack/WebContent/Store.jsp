<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<frameset rows = "10%,*">
		<frame src = "Top.jsp" name = "top">
		<frameset cols = "20%, *">	
			<frame src = "Store_Status.jsp" name = "target1">
			<frame src = "Store_Status2.jsp" name = "target2">
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