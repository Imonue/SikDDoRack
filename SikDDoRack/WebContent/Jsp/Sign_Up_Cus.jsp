<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}
.text{
	color: black;
	font-weight: 300;
	font-size: 13px;
}
.center{
	text-align: center;
}
.box{
	width: 300px;
	padding: 0 0 20px 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	border: 2px solid orange;
}
.box h1{
	padding: 20px;
	margin: 0px;
	background-color: orange;
	color: white;
	font-weight: 500;
	text-align: center;
	font-size: 32px;
}
.box input[type="text"]{
	border:0;
	background: none;
	display: block;
	text-align: center;
	border: 1.5px solid black;
	width: 200px;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	padding: 10px 10px;
	margin: 5px auto;
}
.box input[type="text"]:focus,.box input[type="password"]:focus{
	width: 260px;
	border-color: orange;
}
.box input[type="submit"],.box input[type="reset"]{
	border:0;
	background: none;
	display: inline;
	text-align: center;
	border: 2px solid orange;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 10px 20px;
	margin: 5px auto;
}

.box input[type="submit"]:hover,.box input[type="reset"]:hover{
	background: orange; 
	color: white;
}
</style>
</head>
<body>
<div class="text">
<form class="box" action=<%=WhiteList.instance.getWhitelistScript(1) %> method = "post">
	<div class="center"><h1>손님 회원 가입</h1></div><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	 이름 <br><Input type = "text" name = "_cus_name" placeholder="name"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	ID<br><Input type = "text" name = "_cus_id" placeholder="Username"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	
	PW<br><Input type = "text" name = "_cus_pw" placeholder="Password"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	휴대폰 번호<br><Input type = "text" name = "_cus_phone" placeholder="PhoneNumber"/><p>
	<input type = "hidden" name = "_check" value = "cus">
	<div class="center">
	<input type = "submit" value = "가입하기"/> &nbsp; <input type = "reset" value = "리셋하기"/>
	</div>
</form>
</div>
</body>
</html>