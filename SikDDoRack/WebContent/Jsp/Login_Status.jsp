<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import =  "Database.*"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 정보</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String login_id  = "2"; //request.getParameter("_login_id");
	String check = "sto"; //request.getParameter("_check");
	if(check.equals("sto")){
		Store store = DB.instance.GetStoUser(login_id);
		
		out.print(store.getSto_name() + "님 환영합니다!");
	}
	else if(check.equals("cus")){
		Customer customer = DB.instance.GetCusUser(login_id);
		
		out.print(customer.getCus_name() + "님 환영합니다!");
	}
%>
</body>
</html>