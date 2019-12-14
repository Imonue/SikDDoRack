<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Database.*"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% 
	Thread.sleep(200);
	request.setCharacterEncoding("utf-8");

	
%>
	<h5>가게 목록</h5> 
	<table>
			<tr>
				<td>음식점</td>
			</tr>
			<%
				String sto_name;
				DB.instance.SetStoTypeList("음식점");
				for(int i = 0; i < DB.instance.getStoreTypeList().size(); i++) {
						
					sto_name = DB.instance.getStoreTypeList().get(i).getSto_name();
			%>
			<tr>
				<td><a href = "../Frame/Customer_Frame.jsp?_sto_name=<%=sto_name %>" target = "_parent"><%=sto_name %></a></td>
			</tr>
					<%
				}
			%>
			<tr>
				<td><p></td>
			</tr>
			<tr>
				<td>카페</td>
			</tr>
			<%
				DB.instance.SetStoTypeList("카페");
				for(int i = 0; i < DB.instance.getStoreTypeList().size(); i++) {
						
					sto_name = DB.instance.getStoreTypeList().get(i).getSto_name();
			%>
			<tr>
				<td><a href = "../Frame/Customer_Frame.jsp?_sto_name=<%=sto_name %>" target = "_parent"><%=sto_name %></a></td>
			</tr>
			<%
				}
			%>
						<tr>
				<td><p></td>
			</tr>
			<tr>
				<td>PC방</td>
			</tr>
			<%
				DB.instance.SetStoTypeList("PC방");
				for(int i = 0; i < DB.instance.getStoreTypeList().size(); i++) {
						
					sto_name = DB.instance.getStoreTypeList().get(i).getSto_name();
			%>
			<tr>
				<td><a href = "../Frame/Customer_Frame.jsp?_sto_name=<%=sto_name %>" target = "_parent"><%=sto_name %></a></td>
			</tr>
			<%
				}
			%>
	</table>
</body>
</html>