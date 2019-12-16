<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Infomation.*"%>
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
}
.box{
	width: 400px;
	padding: 0 0 20px 0;
	position: absolute;
	top: 45%;
	left: 50%;
	transform: translate(-50%,-50%);
}
.box2{
	width: 400px;
	padding: 0 0 20px 0;

	border: 2px solid orange;
}
.title{
	padding: 20px;
	margin: 0px;
	color: black;
	font-weight: 500;
	text-align: center;
	font-size: 32px;	
}
.title2{
	padding: 20px;
	margin: 0px;
	background-color: orange;
	color: white;
	font-weight: 500;
	text-align: center;
	font-size: 32px;	
}
.box input[type="text"],.box input[type="password"]{
	border:0;
	background: none;
	display: block;
	text-align: center;
	border: 1.5px solid black;
	width: 300px;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	padding: 10px 10px;
	margin: 5px auto;
}
.box input[type="text"]:focus,.box input[type="password"]:focus{
	width: 360px;
	border-color: orange;
}
.radio_font{
	text-align: center;
}
.box input[type="submit"]{
	border:0;
	background: none;
	display: block;
	text-align: center;
	border: 2px solid orange;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 10px 60px;
	margin: 5px auto;
}
.box input[type="submit"]:hover{
	background: orange; 
	color: white;
}
.btn_cus{
  margin-right: 20px;
}
.btn_cus,.btn_sto{
	color: gray;
	text-decoration:none
}
.sign{
	text-align: center;
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
<h1 class="title">식또락<i class="fa fa-utensils"></i></h1>
<div class="box2">
<form action=<%=WhiteList.instance.getWhitelistScript(0) %> method = "post" target = "_parents">
	<h1 class="title2" id="test">손님 로그인</h1>
	<br>
	<Input type = "text" name = "_id" placeholder="Username"/><p>
	<Input type = "password" name = "_pw" placeholder="Password"/><p>
	<input class="loginbtn" type = "submit" value = "로그인"/><p>
	<div class="radio_font"><Input type = "radio" name = "_user_type" value = "_cus" id="logcus" checked="checked" onclick="checkCus()">손님
	<Input type = "radio" name = "_user_type" value = "_sto" id="logsto" onclick="checkSto()"/>가게
	</div>
</form>

</div>
<div class = "sign">

<a class="btn_cus" href=<%=WhiteList.instance.getWhitelistFrame(4) %>>
	손님 회원가입
</a>
<a class="btn_sto" href=<%=WhiteList.instance.getWhitelistFrame(5) %>>
	가게 회원가입
</a>
</div>
</div>
</body>
</html>