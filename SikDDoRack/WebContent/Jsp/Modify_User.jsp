<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Database.*" 
	import = "Infomation.*" %>
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
	height: 450px;
	padding: 20px 40px 40px 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	background: #191919;
	 overflow: auto;
}
.box h1{
	color: white;
	font-weight: 500;
	text-align: center;
	font-size: 32px;
}
.box input[type="text"], .box input[type="password"]{
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

.box input[type="submit"]:hover{
	background: #2ecc71; 
}
.box select{
	border:0;
	background: #191919;
	display: block;
	text-align: right;
	border: 2px solid #3498db;
	width: 224px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	padding: 10px 10px 10px 87px;
	margin: 5px auto;
}
#complete{
	text-align: center;
	color: lightblue;
}
</style>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String test ="";
	if(session.getAttribute("user_type").equals("sto_user"))
	{ 
		Store store = DB.instance.GetStoUser((String)session.getAttribute("id"));
		
		if(request.getParameter("_sto_pw") == null){
			// Initialize
		}
		else{
			test = "수정이 완료되었습니다.";
			store.setSto_pw(request.getParameter("_sto_pw"));
			store.setSto_tel(request.getParameter("_sto_tel"));
			store.setSto_phone(request.getParameter("_sto_phone"));
			store.setSto_max_table(Integer.parseInt(request.getParameter("_sto_max_table")));
			
			DB.instance.UpdateStoUser(store, (String)session.getAttribute("id"));
		}
%>
<div class="text">
<Form class="box" action = "Modify_User.jsp" method = "post">
	<div class="center"><h1>회원 정보 수정</h1></div>
	<div id="complete"><%=test %></div>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	
	ID <input type = "text" name = "_sto_id" value = <%=store.getSto_id()%> disabled="disabled"><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	PW <input type = "password" name = "_sto_pw" value = <%=store.getSto_pw()%>><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 이름 <input type = "text" name = "_sto_name" value = <%=store.getSto_name()%> disabled="disabled"><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 전화 번호 <input type = "text" name = "_sto_tel" value = <%=store.getSto_tel() %>><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 대표 번호 <input type = "text" name = "_sto_phone" value = <%=store.getSto_phone() %>><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	가게 최대 테이블 <input type = "text" name = "_sto_max_table" value = <%=store.getSto_max_table()%>><p>
	<div class="cneter">
	<input type = "submit" value = "회원 정보 수정">
	</div>
</Form>
</div>
<%
	}
	else if(session.getAttribute("user_type").equals("cus_user"))
	{
		
		Customer customer = DB.instance.GetCusUser((String)session.getAttribute("id"));
		
		if(request.getParameter("_cus_pw") == null){
			// Initialize
		}
		else{
			test = "수정이 완료되었습니다.";
			customer.setCus_pw(request.getParameter("_cus_pw"));
			customer.setCus_phone(request.getParameter("_cus_phone"));
			
			DB.instance.UpdateCusUser(customer, (String)session.getAttribute("id"));
		}
%>
<div class="text">
<Form class="box" action = <%=WhiteList.instance.getWhitelistJsp(11) %> method = "post">
<div class="center"><h1>회원 정보 수정</h1></div>
	<div id="complete"><%=test %></div>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	ID <input type = "text" name = "_cus_id" value = <%=customer.getCus_id()%> disabled="disabled"><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	PW <input type = "password" name = "_cus_pw" value = <%=customer.getCus_pw()%>><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	이름 <input type = "text" name = "_cus_name" value = <%=customer.getCus_name()%> disabled="disabled"><p>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	전화 번호 <input type = "text" name = "_cus_phone" value = <%=customer.getCus_phone() %>><p>		
	<div class="center">
	<input type = "submit" value = "회원 정보 수정">
	</div>
</Form>
</div>
<%
	}
%>
</body>
</html>