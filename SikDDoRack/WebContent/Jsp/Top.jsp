<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
body{
	margin: 0 0 10 0;
	padding: 0;
	font-family: sans-serif;
}
.box{
	margin: 0px;
	padding: 0px;
	display: block;
	font-size: 30px;
	text-align: center;
}
.loginbtn{
	text-align: right;
	float: right;
	border: 0;
	background: none;
	display: block;
	text-align: center;
	border: 2px solid orange;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 8px 20px;
	margin: 0px;
}
.loginbtn:hover{
	background: orange; 
	color: white;
}
.useridbtn1{
	font-weight: 1000;
	text-align: right;
	float: left;
	border: 0;
	background: none;
	display: block;
	text-align: center;
	border: 2px solid orange;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 10px 10px;
	margin: 0px;
}
.useridbtn2{
	font-weight: 1000;
	text-align: right;
	float: right;
	border: 0;
	background: none;
	display: block;
	text-align: center;
	border: 2px solid orange;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 10px 10px;
	margin: 0px;
}
.useridbtn1:hover,.useridbtn2:hover{
	font-weight: bord;
	color: white;
	background: orange; 
}
.cover{
	border-bottom: 2px solid orange;
	float: right;
	outline: none;
	display: inline;
	color: black;
	border-radius: 24px;
	padding: 0px 0px;
	margin: 0px;
}
.a{
	font-size: 15px;
	color: black;
	text-align: right;
}
.b{
	text-decoration: none;
	color: black;
}
</style>
<script 
src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">
</script>
<script>
$(function (){
	$("#hide1").hide();
	$("#hide_main1").hide();
	
	$('.useridbtn2').click(function(){
		$("#hide2").hide();
		$("#hide_main2").hide();
		$("#hide1").show();
		$("#hide_main1").show();
    });
	$('.useridbtn1').click(function(){
		$("#hide1").hide();
		$("#hide_main1").hide();
		$("#hide2").show();
		$("#hide_main2").show();
    });
});
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = "";
	String user_type = "";
	
	id = (String)session.getAttribute("id");
	user_type = (String)session.getAttribute("user_type");
	
	if(id == null || id.equals(""))
	{
%>		
		<Form action = <%=WhiteList.instance.getWhitelistFrame(3) %> method = "post" target = "_parent">
			<div class="box"> &nbsp; &nbsp; &nbsp; &nbsp;
			식또락<i class="fa fa-utensils"></i>	
			<input class="loginbtn" type = "submit" value = "로그인"></div>
		</Form>
<%
	}
	else
	{
%>
		<div class="box"><span id = hide_main2> &nbsp; &nbsp;
			<a class = "b" href = <%=WhiteList.instance.getWhitelistFrame(0) %> target = "_parent">식또락<i class="fa fa-utensils"></i></a></span>
			<span id = hide_main1> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			식또락<i class="fa fa-utensils"></i></span>
		<div id = "hide1" class="cover">
		<button id = "btn1" class = "useridbtn1"><%=id %></button>&nbsp;
		<%	
		if (user_type.equals("sto_user"))
		{
			%>
				<a class="a" href = <%=WhiteList.instance.getWhitelistFrame(2) %> target = "_parent">
					내 가게 정보
				</a> &nbsp; 
			<%
		}
%>
		 <a class="a" href = <%=WhiteList.instance.getWhitelistFrame(6) %> target = "_parent">
			회원정보 수정
		</a> &nbsp; 
		<a class="a" href = <%=WhiteList.instance.getWhitelistScript(2) %> target = "_parent">
			로그아웃
		</a> &nbsp; &nbsp;
		
		</div>
		<button id = "hide2" class = "useridbtn2"><%=id %></button>
		</div>
<%} %>
</body>
</html>