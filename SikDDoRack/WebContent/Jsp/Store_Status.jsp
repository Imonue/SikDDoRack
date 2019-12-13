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
	<form action=<%=WhiteList.instance.getWhitelistJsp(6) %> method = "post">
	
		예약 가능 여부 <select name = "_sto_res_pos">
				<option value = "가능" <%if(store.getSto_res_pos().equals("가능")) {%> selected <%}%>> 가능 </option>
				<option value = "불가능" <%if(store.getSto_res_pos().equals("불가능")) {%> selected <%}%>> 불가능 </option>
		</select><p>
		현재 테이블 <input type=number name = "_sto_now_table" value = <%=store.getSto_now_table()%> min="0" max=<%=store.getSto_max_table() %>><p>
		<input type = submit value = "등록">
	</form>
</body>
</html>