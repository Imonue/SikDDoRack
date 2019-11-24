<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Database.*" import = "Infomation.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보 수정</h1>
<% 
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("user_type").equals("sto_user"))
	{ 
		Store store = DB.instance.GetStoUser((String)session.getAttribute("id"));
		
		if(request.getParameter("_sto_pw") == null){
			// Initialize
		}
		else{
			store.setSto_pw(request.getParameter("_sto_pw"));
			store.setSto_tel(request.getParameter("_sto_tel"));
			store.setSto_phone(request.getParameter("_sto_phone"));
			store.setSto_max_table(Integer.parseInt(request.getParameter("_sto_max_table")));
			
			DB.instance.UpdateStoUser(store, (String)session.getAttribute("id"));
		}
		
%>
		<Form action = "Modify_User.jsp" method = "post">
		
			ID <input type = "text" name = "_sto_id" value = <%=store.getSto_id()%> disabled="disabled"><p>
			PW <input type = "password" name = "_sto_pw" value = <%=store.getSto_pw()%>><p>
			가게 이름 <input type = "text" name = "_sto_name" value = <%=store.getSto_name()%> disabled="disabled"><p>
			가게 전화 번호 <input type = "text" name = "_sto_tel" value = <%=store.getSto_tel() %>><p>
			가게 대표 번호 <input type = "text" name = "_sto_phone" value = <%=store.getSto_phone() %>><p>
			가게 최대 테이블 <input type = "text" name = "_sto_max_table" value = <%=store.getSto_max_table()%>><p>
					
			<input type = "submit" value = "회원 정보 수정">
		</Form>
<%
	}
	else if(session.getAttribute("user_type").equals("cus_user"))
	{
		Customer customer = DB.instance.GetCusUser((String)session.getAttribute("id"));
		
		if(request.getParameter("_cus_pw") == null){
			// Initialize
		}
		else{
			customer.setCus_pw(request.getParameter("_cus_pw"));
			customer.setCus_phone(request.getParameter("_cus_phone"));
			
			DB.instance.UpdateCusUser(customer, (String)session.getAttribute("id"));
		}
%>
		<Form action = "Modify_User.jsp" method = "post">
		
			ID <input type = "text" name = "_cus_id" value = <%=customer.getCus_id()%> disabled="disabled"><p>
			PW <input type = "password" name = "_cus_pw" value = <%=customer.getCus_pw()%>><p>
			이름 <input type = "text" name = "_cus_name" value = <%=customer.getCus_name()%> disabled="disabled"><p>
			전화 번호 <input type = "text" name = "_cus_phone" value = <%=customer.getCus_phone() %>><p>		
					
			<input type = "submit" value = "회원 정보 수정">
		</Form>
<%
	}
%>
</body>
</html>