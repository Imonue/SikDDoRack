<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String user_type = (String)session.getAttribute("user_type");
	if(user_type.equals("cus_user")) {
%>
	<frameset rows = "10%,*">
		<frame src = "Top.jsp" name = "top">
		<frameset cols = "20%, *">
			<frame src = "Menu.jsp" name = "menu">
			<frameset rows = "50%,50%">
				<frame src = "Cus_Status.jsp" name = "target1">
				<frame src = "Cus_Status2.jsp" name = "target2">
			</frameset>
		</frameset>
	</frameset>
<%
	}
	else {
		out.println("손님 계정만 이용가능한 페이지 입니다.");
	}
%>
<body>

</body>
</html>