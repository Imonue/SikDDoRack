<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Database.*" 
	import = "Infomation.*"
	import = "Security.*"  %>
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
.box input[type="text"], .box input[type="password"]{
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

.box input[type="submit"]:hover{
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
			store.setSto_id(request.getParameter("_sto_id"));
			
			String pw = Security.Sha256(request.getParameter("_sto_pw"));
			
			store.setSto_tel(request.getParameter("_sto_tel"));
			store.setSto_phone(request.getParameter("_sto_phone"));
			store.setSto_max_table(Integer.parseInt(request.getParameter("_sto_max_table")));
			
			DB.instance.UpdateStoUser(store, (String)session.getAttribute("id"));
		}
%>
<div class="text">
<Form class="box" action = "Modify_User.jsp" method = "post">
	<div class="center"><h1>회원 정보 수정</h1></div><p>
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
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	 <input type = "submit" value = "회원 정보 수정"/>
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
			String pw = Security.Sha256(request.getParameter("_cus_pw"));
			customer.setCus_pw(pw);
			customer.setCus_phone(request.getParameter("_cus_phone"));
			
			DB.instance.UpdateCusUser(customer, (String)session.getAttribute("id"));
		}
%>
<div class="text">
<Form class="box" action = <%=WhiteList.instance.getWhitelistJsp(11) %> method = "post">
<div class="center"><h1>회원 정보 수정</h1></div><p>
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