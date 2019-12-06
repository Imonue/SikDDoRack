<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page import = "Database.*" import = "Infomation.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("_id");
	String pw = request.getParameter("_pw");
	String user_type = request.getParameter("_user_type");
	
	if(id == null || pw == null || user_type == null) response.sendRedirect("../Frame/Login_Frame.jsp");
	
	if(user_type.equals("_cus")){
		if(DB.instance.LoginCusUser(id, pw))
		{
			session.setAttribute("id", id);
			session.setAttribute("sto_id", "3");//테스트코드
			session.setAttribute("user_type", "cus_user");
			response.sendRedirect("../Frame/Main_Frame.jsp");
		}
		else{
			System.out.println("로그인 실패");
			response.sendRedirect("../Jsp/Login.jsp");
		}
		
	}
	else if(user_type.equals("_sto")){
		if(DB.instance.LoginStoUser(id, pw))
		{
			session.setAttribute("id", id);
			session.setAttribute("user_type", "sto_user");
			response.sendRedirect("../Frame/Main_Frame.jsp");
		}
		else{
			response.sendRedirect("../Jsp/Login.jsp");
		}
	}
%>
</body>
</html>