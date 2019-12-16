<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import =  "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<frameset rows = "10%,*">
	<frame frameborder="0" src = <%=WhiteList.instance.getWhitelistJsp(0) %>>
	<frame frameborder="0" src = <%=WhiteList.instance.getWhitelistJsp(11) %>>
</frameset>
<body>

</body>
</html>