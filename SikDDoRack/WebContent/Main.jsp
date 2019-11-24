<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>메인 화면</h1>
지도 나오는 화면이 오른쪽에 있고
왼쪽에는 로그인 버튼, 밑에는 상태 표시

<Form action = "Login.jsp" method = "post">
	<input type = "submit" value = "로그인">
</Form>
<Form action = "User_Info.jsp" method = "post">
	<input type = "submit" value = "유저 정보 확인">
</Form>
<%
	request.setCharacterEncoding("utf-8");
	String id = "";
	
	id = (String)session.getAttribute("id");
	
	if(id == null || id.equals(""))
	{
		out.println("로그인 안되 있음");
	}
	else
	{
		out.println("<h1>" + id + "님 환영합니다!!" + "</h1>");
	}
%>
</body>
</html>