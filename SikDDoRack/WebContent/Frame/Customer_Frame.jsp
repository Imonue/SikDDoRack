<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Infomation.*"%>
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
     		window.history.back();
    	</script>
<%
	}
	else
	{
		if(user_type.equals("cus_user")) {
%>
		<frameset rows = "56px,*">
			<frame frameborder="0" src = <%=WhiteList.instance.getWhitelistJsp(0) %> name = "top">
			<frameset cols = "25%, *">
				<frame frameborder="0" style="border:5px; border-color:orange; border-style:solid;" src = <%=WhiteList.instance.getWhitelistJsp(5) %> name = "menu">
				<frameset rows = "50%,50%">
					<frame frameborder="0" style="border:5px; border-color:orange; border-style:solid;" src = <%=WhiteList.instance.getWhitelistJsp(3) %> name = "target1">
					<frame frameborder="0" style="border:5px; border-color:orange; border-style:solid;" src = <%=WhiteList.instance.getWhitelistJsp(4) %> name = "target2">
				</frameset>
			</frameset>
		</frameset>
<%
	}
		else {
			
			%>
			<script>
	     		alert( '손님 계정만 이용가능한 페이지 입니다.' );
	     		window.history.back();
	    	</script>
			<%
		}
	}
%>
<body>

</body>
</html>