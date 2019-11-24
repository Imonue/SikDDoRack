<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 페이지</h1>
<form action="Login_Check.jsp" method = "post">
	ID  <Input type = "text" name = "_id"/><p>
	PW  <Input type = "text" name = "_pw"/><p>
	유형  <Input type = "radio" name = "_user_type" value = "_cus"/>손님
	<Input type = "radio" name = "_user_type" value = "_sto"/>가게<p>
	<input type = "submit" value = "로그인"/>
</form>
<Form action = "Sign_Up_Cus.jsp" method = "post">
	<input type = "submit" value = "고객 회원 가입">
</Form>
<Form action = "Sign_Up_Sto.jsp" method = "post">
	<input type = "submit" value = "가게 회원 가입">
</Form>
</body>
</html>