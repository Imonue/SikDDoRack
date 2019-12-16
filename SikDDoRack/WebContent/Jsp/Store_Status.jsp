<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Database.*"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
	overflow-y: scroll;
	-ms-overflow-style: none;
	margin: 0;
}
body::-webkit-scrollbar{
	display: none;
}
form{
	text-align: center;
}
a { 
	text-decoration:none;
	color: black;
 }
.pointer{cursor: pointer;}
#main{
	color: white;
	background-color: orange;
	text-align: center;
	margin: 0;
	padding: 10px 10px 20px 10px;
}
.ent_btn{
	border:0;
	background: none;
	border: 2px solid orange;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	padding: 5px 10px;
	margin: 5px auto;
}	
.ent_btn:hover{
	background: orange; 
	color: white; 
}
</style>
<body>
<%	
	Thread.sleep(100);
	request.setCharacterEncoding("utf-8");
	Store store = DB.instance.GetStoUser((String)session.getAttribute("id"));

	if(request.getParameter("_sto_now_table") == null){
		// Initialize
	}
	else{
		store.setSto_now_table(Integer.parseInt(request.getParameter("_sto_now_table")));
		store.setSto_res_pos(request.getParameter("_sto_res_pos"));
		
		DB.instance.UpdateStoUser(store, (String)session.getAttribute("id"));
		
		store = DB.instance.GetStoUser((String)session.getAttribute("id"));
	}
%>
<h2 id = "main">가게현황<br>업데이트</h2> <p> <br>
	<form action=<%=WhiteList.instance.getWhitelistJsp(6) %> method = "post">
	
		&nbsp; &nbsp; 예약 가능 여부 <select name = "_sto_res_pos">
				<option value = "가능" <%if(store.getSto_res_pos().equals("가능")) {%> selected <%}%>> 가능 </option>
				<option value = "불가능" <%if(store.getSto_res_pos().equals("불가능")) {%> selected <%}%>> 불가능 </option>
		</select><p>
		&nbsp; &nbsp; 현재 테이블 <input type=number name = "_sto_now_table" value = <%=store.getSto_now_table()%> min="0" max=<%=store.getSto_max_table() %>><p>
		&nbsp; &nbsp; <input class = "ent_btn" type = submit value = "등록">
	</form>
</body>
</html>