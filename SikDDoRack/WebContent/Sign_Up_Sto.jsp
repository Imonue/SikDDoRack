<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>가게용 회원 가입</h1>
<form action="Sign_Up_Check.jsp" method = "post">
	가게 이름  <Input type = "text" name = "_sto_name"/><p>
	ID  <Input type = "text" name = "_sto_id"/><p>
	PW  <Input type = "text" name = "_sto_pw"/><p>
	점주 휴대폰 번호  <Input type = "text" name = "_sto_tel"/><p>
	가게 번호  <Input type = "text" name = "_sto_phone"/><p>
	가게 종류 <select name = "_sto_type">
			<option value = "음식점" selected> 음식점 </option>
			<option value = "노래방">노래방</option>
			<option value = "PC방">PC방</option>
			<option value = "카페">카페</option>	
	</select><p>
	가게 주소 <Input type = "text" name = "_sto_addr"/><p>
	가게 위도 <Input type = "text" name = "_sto_lati"/>
	가게 경도 <Input type = "text" name = "_sto_longi"/><p>
	가게 최대 테이블 <Input type = "text" name = "_sto_max_table"/><p>
	<input type = "hidden" name = "_check" value = "sto">
	<input type = "submit" value = "확인"/>
	<input type = "reset" value = "취소"/>
</form>
</body>
</html>