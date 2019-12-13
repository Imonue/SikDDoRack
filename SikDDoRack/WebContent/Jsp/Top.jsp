<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = "";
	String user_type = "";
	
	id = (String)session.getAttribute("id");
	user_type = (String)session.getAttribute("user_type");
	
	if(id == null || id.equals(""))
	{
%>		
		<Form action = <%=WhiteList.instance.getWhitelistFrame(3) %> method = "post" target = "_parent">
			<input type = "submit" value = "로그인">
		</Form>
<%
	}
	else
	{
		out.println(id + "님 환영합니다!!");
%>
		<Form action = <%=WhiteList.instance.getWhitelistFrame(6) %> method = "post" target = "_parent">
			<input type = "submit" value = "회원 정보 수정">
		</Form>
		<Form action = <%=WhiteList.instance.getWhitelistScript(2) %> method = "post" target = "_parent">
			<input type = "submit" value = "로그 아웃">
		</Form>
<%	
		if (user_type.equals("sto_user"))
		{
			%>
				<Form action = <%=WhiteList.instance.getWhitelistFrame(2) %> method = "post" target = "_parent">
					<input type = "submit" value = "내 가게 정보">
				</Form>
			<%
		}
	}
%>
</body>
</html>