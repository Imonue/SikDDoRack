<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>손님용 회원 가입</h1>
<form action="Sign_Up_Check.jsp" method = "post">
	이름  <Input type = "text" name = "_cus_name"/><p>
	ID  <Input type = "text" name = "_cus_id"/><p>
	PW  <Input type = "text" name = "_cus_pw"/><p>
	휴대폰 번호  <Input type = "text" name = "_cus_phone"/><p>
	<input type = "hidden" name = "_check" value = "cus">
	<input type = "submit" value = "확인"/>
	<input type = "reset" value = "취소"/>
</form>
</body>
</html>