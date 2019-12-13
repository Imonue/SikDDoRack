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
<%	
	request.setCharacterEncoding("utf-8");
	String check = request.getParameter("_check");
	if(check.equals("sto")){
		// 가게에 해당하는 정보를 받아와서 가게 업데이트 코드
		Store store = new Store();
			
		store.setSto_id(request.getParameter("_sto_id"));
		
		String pw = Security.Sha256(request.getParameter("_sto_pw"));
		store.setSto_pw(pw);
		store.setSto_name(request.getParameter("_sto_name"));
		store.setSto_phone(request.getParameter("_sto_phone"));
		store.setSto_tel(request.getParameter("_sto_tel"));
		store.setSto_type(request.getParameter("_sto_type"));
		store.setSto_addr(request.getParameter("_sto_addr"));
		store.setSto_lati(Float.parseFloat(request.getParameter("_sto_lati")));
		store.setSto_longi(Float.parseFloat(request.getParameter("_sto_longi")));
		store.setSto_max_table(Integer.parseInt(request.getParameter("_sto_max_table")));
		
		DB.instance.AddStoUser(store);
	}
	else if(check.equals("cus")){
		// 손님에 해당하는 정보를 받아와서 가게 업데이트 코드
		Customer customer = new Customer();
				
		customer.setCus_id(request.getParameter("_cus_id"));
		String pw = Security.Sha256(request.getParameter("_cus_pw"));
		customer.setCus_pw(pw);
		customer.setCus_name(request.getParameter("_cus_name"));
		customer.setCus_phone(request.getParameter("_cus_phone"));
		
		DB.instance.AddCusUser(customer);
	}
	
	response.sendRedirect(WhiteList.instance.getWhitelistFrame(3));
%>
</body>
</html>