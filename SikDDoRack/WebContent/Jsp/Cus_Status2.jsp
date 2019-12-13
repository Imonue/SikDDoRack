<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Database.*"
    import =  "Infomation.*"
    import =  "Security.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약 신청</h1>
<%
	// 예약 신청을 하는 페이지, 선택한 가게에 예약이 있으면 해당 예약 정보 표시
	Thread.sleep(100);
	request.setCharacterEncoding("utf-8");
	Customer customer = DB.instance.GetCusUser((String)session.getAttribute("id"));
	Store store = DB.instance.GetStoUserName((String)session.getAttribute("sto_name"));
	Reservation reser = DB.instance.CheckReser(customer.getCus_id(), store.getSto_id());
	Reservation_com reser_com = DB.instance.CheckResercom(customer.getCus_id(), store.getSto_id());
	
	if(request.getParameter("_type") == null){
		// Initialize
	}
	
	else {
	
		if(request.getParameter("_type").equals("res_cancel")) {
			DB.instance.DeleteReser(customer.getCus_id(), store.getSto_id());
			reser = DB.instance.CheckReser(customer.getCus_id(), store.getSto_id());
		}
		
		else if(request.getParameter("_type").equals("res_com_cancel")) {
			DB.instance.DeleteResercom(customer.getCus_id(), store.getSto_id());
			reser_com = DB.instance.CheckResercom(customer.getCus_id(), store.getSto_id());
		}
		
		else if(request.getParameter("_type").equals("res_insert")) {
			// 손님 아이디, 가게 아이디, 예약 날짜, 손님 핸드폰 번호 암호화
			reser.setCus_id(customer.getCus_id());
			reser.setSto_id(store.getSto_id());
			reser.setRes_date(request.getParameter("_res_date"));
			reser.setCus_phone(customer.getCus_phone());
			
			reser.setCus_count(Integer.parseInt(request.getParameter("_cus_count")));
			reser.setSto_name(store.getSto_name());
			
			// IV 생성
			String iv = Security.instance.CreateIV();
			//System.out.println("IV : " + iv);
			
			String key = Security.instance.CreateKey();
			
			reser = Security.instance.EnReser(key, reser, iv);
		
			
			
			DB.instance.AddReser(reser);
			
			reser = DB.instance.CheckReser(customer.getCus_id(), store.getSto_id());
		}
		
	}
	
	if(reser.getRes_id() != null) {
		%>
		
		<h3>예약신청이 접수되었습니다.</h3><p>
		<table>
			<tr>
				<td><%=reser.getCus_id()%></td>
				<td><%=reser.getRes_date()%></td>
				<td><%=reser.getCus_count()%>명</td>
			</tr>
		</table>
		
		<form action= "Cus_Status2.jsp" method = "post">
			<input type = "submit" value = "예약취소">
			<Input type = "hidden" name = "_type" value = "res_cancel">
		</form>
		<%		
	}
	else if (reser_com.getRes_id_com() != null) {
		%>
		
		<h3>예약신청이 확정되었습니다.</h3><p>
		<table>
			<tr>
				<td><%=reser_com.getCus_id_com()%></td>
				<td><%=reser_com.getRes_date_com()%></td>
				<td><%=reser_com.getCus_count_com()%>명</td>
			</tr>
		</table>
		
		<form action= "Cus_Status2.jsp" method = "post">
			<input type = "submit" value = "예약취소">
			<Input type = "hidden" name = "_type" value = "res_com_cancel">
		</form>
		<%	
	}
	
	else if(store.getSto_res_pos().equals("가능")) {		
	%>
	
		<form action=<%=WhiteList.instance.getWhitelistJsp(4) %> method = "post">
			예약 시간 <select name = "_res_date">
				<option value = "11:00"> 11:00 </option>
				<option value = "11:30">11:30</option>
				<option value = "12:00" selected>12:00</option>
				<option value = "12:30">12:30</option>
				<option value = "13:00">13:00</option>
				<option value = "13:30">13:30</option>
				<option value = "14:00">14:00</option>
				<option value = "14:30">14:30</option>
				<option value = "15:00">15:00</option>
				<option value = "15:30">15:30</option>
				<option value = "16:00">16:00</option>
				<option value = "16:30">16:30</option>
				<option value = "17:00">17:00</option>
				<option value = "17:30">17:30</option>
				<option value = "18:00">18:00</option>
				<option value = "18:30">18:30</option>
				<option value = "19:00">19:00</option>
				<option value = "19:30">19:30</option>
				<option value = "20:00">20:00</option>
				<option value = "20:30">20:30</option>
				<option value = "21:00">21:00</option>
				<option value = "21:30">21:30</option>
				<option value = "22:00">22:00</option>
			</select><p>
			예약 인원 <select name = "_cus_count">
				<option value = "1" selected> 1 </option>
				<option value = "2"> 2 </option>
				<option value = "3"> 3 </option>
				<option value = "4"> 4 </option>
				<option value = "5"> 5 </option>
				<option value = "6"> 6 </option>
				<option value = "7"> 7 </option>
				<option value = "8"> 8 </option>
				<option value = "9"> 9 </option>
				<option value = "10"> 10 </option>
			</select>명<p>
			<Input type = "hidden" name = "_type" value = "res_insert">	
			<Input type = "submit" value = "신청">	
		</form>
		
	<%
	}
	else {
		out.println("현재 이 가게는 예약이 불가능합니다.");
		out.println(store.getSto_res_pos());
	}
%>
</body>
</html>