<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body{
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #34495e;
}
.text{
	color: white;
	font-weight: 300;
	font-size: 13px;
}
.center{
	text-align: center;
}
.box{
	width: 300px;
	padding: 20px 40px 40px 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	background: #191919;
}
.box h1{
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
	border: 2px solid #3498db;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	padding: 10px 10px;
	margin: 5px auto;
	
}
.box input[type="text"]:focus,.box input[type="password"]:focus{
	width: 280px;
	border-color: #2ecc71;
}
.box input[type="submit"],.box input[type="reset"]{
	border:0;
	background: none;
	display: inline;
	text-align: center;
	border: 2px solid #2ecc71;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 10px 20px;
	margin: 5px auto;
}

.box input[type="submit"]:hover,.box input[type="reset"]:hover{
	background: #2ecc71; 
}
</style>
</head>
<body>
<div class="text">
<form class="box" action="../Scriptlet/Sign_Up_Check.jsp" method = "post">
	<div class="center"><h1>�մ� ȸ�� ����</h1></div>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	 �̸� <br><Input type = "text" name = "_cus_name" placeholder="name"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	ID<br><Input type = "text" name = "_cus_id" placeholder="Username"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	
	PW<br><Input type = "text" name = "_cus_pw" placeholder="Password"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	�޴��� ��ȣ<br><Input type = "text" name = "_cus_phone" placeholder="PhoneNumber"/><p>
	<input type = "hidden" name = "_check" value = "cus">
	<div class="center">
	<input type = "submit" value = "�����ϱ�"/> &nbsp; <input type = "reset" value = "�����ϱ�"/>
	</div>
</form>
</div>
</body>
</html>