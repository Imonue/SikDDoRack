<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
body{
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #34495e;
}
p{
	margin: 10px;
}
.box{
	width: 450px;
	height: 400px;
	padding: 40px;
	position: absolute;
	top: 45%;
	left: 50%;
	transform: translate(-50%,-50%);
	text-align: center;
	background-image: url("img/img_loginbox.png");
	background-repeat: no-repeat;
    background-position: center bottom;
    background-size: 100% 350px;
}
.title{
	margin: 40px 40px 20px 40px;
}
.title2{
	color: white;
	font-weight: 500;
	margin: 5px;
}
.box input[type="text"],.box input[type="password"]{
	border: 0;
	background: none;
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
.loginbtn{
	border:0;
	background: none;
	display: block;
	text-align: center;
	border: 2px solid #2ecc71;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 10px 40px;
	margin: 5px auto;
}	
.loginbtn:hover{
	background: #2ecc71; 
}
.sign_cus{
	position: absolute;
	top: 80%;
	left: 7%;
}
.sign_sto{
	position: absolute;
	top: 80%;
	left: 80%;
}
.sign_btn{
	border:0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #34495e;
	padding: 5px 5px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
}
.sign_btn:hover{
	background: #34495e; 
}
a{
	border: 0;
	background: none;
	text-align: center;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	text-decoration:none
}
.radio_font{
	color: white;
}
</style>
<script type="text/javascript">
	function checkCus(){
		var tag = "손님 로그인";
		document.getElementById("test").innerHTML = tag;
	}
	function checkSto(){
		var tag = "가게 로그인";
		document.getElementById("test").innerHTML = tag;
	}
</script>
</head>
<body>
<div class="box">
<form action="../Scriptlet/Login_Check.jsp" method = "post" target = "_parents">
	<h1 class="title">식또락<i class="fa fa-utensils"></i></h1>
	<h1 class="title2" id="test">손님 로그인</h1>
	<Input type = "text" name = "_id" placeholder="Username"/><p>
	<Input type = "password" name = "_pw" placeholder="Password"/><p>
	<input class="loginbtn" type = "submit" value = "로그인"/><p>
	<div class="radio_font"> 사용자 :  <Input type = "radio" name = "_user_type" value = "_cus" id="logcus" checked="checked" onclick="checkCus()">손님
	<Input type = "radio" name = "_user_type" value = "_sto" id="logsto" onclick="checkSto()"/>가게
	</div>
</form>
<div class="sign_cus">
<form action="../Frame/Sign_Up_Cus_Frame.jsp" method = "post">
	<input class="sign_btn" type = "submit" value = "손님회원가입"/><p>
</form>
</div>
<div class="sign_sto">
<form action="../Frame/Sign_Up_Sto_Frame.jsp" method = "post">
	<input class="sign_btn" type = "submit" value = "가게회원가입"/><p>
</form>
</div>
</div>
</body>
</html>