<%@page import="sun.security.util.Length"%>
<%@page import="java.sql.*"%>
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
	if(request.getParameterValues("_cus_ids") != null) {
		String cus_ids[] = request.getParameterValues("_cus_ids");
		
		if(request.getParameter("_type").equals("확인")){
			for (int i = 0; i < cus_ids.length ; i++) {
				Reservation_com reser_com = DB.instance.CopyReser(cus_ids[i], (String)session.getAttribute("id"));
				DB.instance.AddResercom(reser_com);
				DB.instance.DeleteReser(cus_ids[i], (String)session.getAttribute("id"));
			}
		}
		
		else if(request.getParameter("_type").equals("거절")){
			for (int i = 0; i < cus_ids.length ; i++) {
				DB.instance.DeleteReser(cus_ids[i], (String)session.getAttribute("id"));
			}
		}
		
		else if(request.getParameter("_type").equals("취소")){
			for (int i = 0; i < cus_ids.length ; i++) {
				DB.instance.DeleteResercom(cus_ids[i], (String)session.getAttribute("id"));
			}
		}
	}
%>
	<div style="width = 45%; border:1px solid black; float:left; margin-right:5%;">
		<form action="Store_Status2.jsp" method="post">
			<h5>예약신청목록</h5>
			<table border = 1>
				<tr>
					<td></td>
					<td>아이디</td>
					<td>예약 시간</td>
					<td>예약 인원</td>
				</tr>
				<%
					ResultSet rs = DB.instance.GetStoReser((String)session.getAttribute("id"));
					while(rs.next()){
						String cus_id = rs.getString("cusid");
						String res_date = rs.getString("resdate");
						String cus_count = rs.getString("cuscount");
						%>
						<tr>
							<td><input type="checkbox" name="_cus_ids" value=<%=cus_id %>></td>
							<td><%=cus_id %></td>
							<td><%=res_date %></td>
							<td><%=cus_count %></td>
						</tr>
						<%
					}
				%>
			</table>
			<input type = "submit" name = "_type" value = "확인">
			<input type = "submit" name = "_type" value = "거절">
		</form>
	</div>
	<div style="width = 45%; border:1px solid black; float:left; margin-right:5%;">
		<form action="Store_Status2.jsp" method="post">
			<h5>예약확정목록</h5>
			<table border = 1>
				<tr>
					<td></td>
					<td>아이디</td>
					<td>예약 시간</td>
					<td>예약 인원</td>
				</tr>
				<%
					ResultSet rs_com = DB.instance.GetStoResercom((String)session.getAttribute("id"));
					while(rs_com.next()){
						String cus_id = rs_com.getString("cusid_com");
						String res_date = rs_com.getString("resdate_com");
						String cus_count = rs_com.getString("cuscount_com");
						%>
						<tr>
							<td><input type="checkbox" name="_cus_ids" value=<%=cus_id %>></td>
							<td><%=cus_id %></td>
							<td><%=res_date %></td>
							<td><%=cus_count %></td>
						</tr>
						<%
					}
				%>
			</table>
			<input type = "submit" name = "_type" value = "취소">
		</form>
	</div>
</body>
</html>