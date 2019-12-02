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
	request.setCharacterEncoding("utf-8");
	Store store = DB.instance.GetStoUser(request.getParameter("sto_id"));
%>
	<table>
		<tr>
			<td>가게이름</td>
			<td><%=store.getSto_name()%></td>
		</tr>
		<tr>
			<td>가게주소</td>
			<td><%=store.getSto_addr()%></td>
		</tr>
		<tr>
			<td>가게번호</td>
			<td><%=store.getSto_tel()%></td>
		</tr>
		<tr>
			<td>전체 테이블</td>
			<td><%=store.getSto_max_table()%></td>
		</tr>
		<tr>
			<td>현재 테이블</td>
			<td><%=store.getSto_now_table()%></td>
		</tr>
		<tr>
			<td>예약가능여부</td>
			<td><%=store.getSto_res_pos()%></td>
		</tr>
	</table>

</body>
</html>