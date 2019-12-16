<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
::-webkit-scrollbar {
  width: 0px;
}
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
	height: 450px;
	padding: 0 0 20px 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	border: 2px solid orange;
	overflow: auto;
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
	width: 280px;
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
.box select{
	border:0;
	display: block;
	text-align: right;
	border: 1.5px solid black;
	width: 224px;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	padding: 10px 10px 10px 87px;
	margin: 5px auto;
}
.a{
	text-align: center;
}
</style>
</head>
<body>
<div class="text" >
<form class="box" action=<%=WhiteList.instance.getWhitelistScript(1) %> method = "post">
	<div class="center"><h1>가게 회원 가입</h1></div><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 이름<br><Input type = "text" name = "_sto_name" placeholder="name"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	ID<br><Input type = "text" name = "_sto_id" placeholder="Username"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	PW<br><Input type = "text" name = "_sto_pw" placeholder="Password"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 번호<br><Input type = "text" name = "_sto_tel" placeholder="PhoneNumber"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	점주 휴대폰 번호<br><Input type = "text" name = "_sto_phone" placeholder="StorePhoneNumber"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 종류<br><select name = "_sto_type">
			<option value = "음식점" selected>음식점</option>
			<option value = "노래방">노래방</option>
			<option value = "PC방"> &nbsp;PC방</option>
			<option value = "카페"> &nbsp; 카페</option>	
	</select><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 주소<br><Input type = "text" name = "_sto_addr" placeholder="StoreAdress"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 위도<br><Input type = "text" name = "_sto_lati" placeholder="Latitude"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 경도<br><Input type = "text" name = "_sto_longi" placeholder="Hardness"/><p>
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 최대 테이블<br><Input type = "text" name = "_sto_max_table" placeholder="Number of Table"/><p>
	<input type = "hidden" name = "_check" value = "sto">
	<div class="center">
	<input type = "submit" value = "가입하기"/> &nbsp; <input type = "reset" value = "리셋하기"/>
	</div>
</form>
</div>
</body>
</html>