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
	String id = "";
	
	id = (String)session.getAttribute("id");
	
	if(id == null || id.equals(""))
	{
%>		
		<Form action = "../Frame/Login_Frame.jsp" method = "post" target = "_parent">
			<input type = "submit" value = "로그인">
		</Form>
<%
	}
	else
	{
		out.println(id + "님 환영합니다!!");
%>
		<Form action = "../Frame/Modify_User_Frame.jsp" method = "post" target = "_parent">
			<input type = "submit" value = "회원 정보 수정">
		</Form>
		<Form action = "../Scriptlet/Logout.jsp" method = "post">
			<input type = "submit" value = "로그 아웃">
		</Form>
<%
	}
%>
</body>
</html>