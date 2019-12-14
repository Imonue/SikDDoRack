<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import =  "Database.*"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Thread.sleep(100);
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
				<td><a href = "../Jsp/Map.jsp?_sto_name=<%=sto_name %>&_sto_type=음식점" target = "map"><%=sto_name %></a></td>
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
				<td><a href = "../Jsp/Map.jsp?_sto_name=<%=sto_name %>&_sto_type=카페" target = "map"><%=sto_name %></a></td>
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
				<td><a href = "../Jsp/Map.jsp?_sto_name=<%=sto_name %>&_sto_type=PC방" target = "map"><%=sto_name %></a></td>
			</tr>
					<%
				}
			%>
	</table>
</body>
</html>