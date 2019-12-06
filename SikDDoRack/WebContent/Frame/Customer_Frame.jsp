<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	session.setAttribute("sto_name", request.getParameter("_sto_name"));
	String user_type = (String)session.getAttribute("user_type");
	if(user_type == null){
%>
		<script>
     		alert( '로그인이 필요한 페이지입니다.' );
     		location.href="../Frame/Main_Frame.jsp";
    	</script>
<%
	}
	else
	{
		if(user_type.equals("cus_user")) {
%>
		<frameset rows = "10%,*">
			<frame src = "../Jsp/Top.jsp" name = "top">
			<frameset cols = "20%, *">
				<frame src = "../Jsp/Menu.jsp" name = "menu">
				<frameset rows = "50%,50%">
					<frame src = "../Jsp/Cus_Status.jsp" name = "target1">
					<frame src = "../Jsp/Cus_Status2.jsp" name = "target2">
				</frameset>
			</frameset>
		</frameset>
<%
	}
		else {
			
			%>
			<script>
	     		alert( '손님 계정만 이용가능한 페이지 입니다.' );
	     		location.href="../Frame/Main_Frame.jsp";
	    	</script>
			<%
		}
	}
%>
<body>

</body>
</html>