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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$(function () {
	$(".hide_res").hide();
	$(".hide_cafe").hide();
	$(".hide_pc").hide();

	$('#tag_res').click(function(){
		if($("#tag_res").text() == " ● 음식점"){
			$("#tag_res").text(" ● 음식점 ") 
	    	$(".hide_res").show();
		}else if($("#tag_res").text() == " ● 음식점 "){
			$("#tag_res").text(" ● 음식점")
	    	$(".hide_res").hide();
		}
    });//tag_res click
    $('#tag_cafe').click(function(){
		if($("#tag_cafe").text() == " ● 카페"){
			$("#tag_cafe").text(" ● 카페 ")
	    	$(".hide_cafe").show();
		}else if($("#tag_cafe").text() == " ● 카페 "){
			$("#tag_cafe").text(" ● 카페")
	    	$(".hide_cafe").hide();
		}
    });//tag_cafe click
    $('#tag_pc').click(function(){
		if($("#tag_pc").text() == " ● PC방"){
			$("#tag_pc").text(" ● PC방 ")
	    	$(".hide_pc").show();
		}else if($("#tag_pc").text() == " ● PC방 "){
			$("#tag_pc").text(" ● PC방")
	    	$(".hide_pc").hide();
		}
    });//tag_pc click
});
</script>
</head>
<style>
body{
overflow-y: scroll;
-ms-overflow-style: none;
margin: 0;
}
body::-webkit-scrollbar{
display: none;
}
a { 
text-decoration:none;
color: black;
 }
.pointer{cursor: pointer;}
#main{
color: white;
background-color: orange;
text-align: center;
margin: 0;
padding: 10px 10px 20px 10px;
}
</style>
<body>
<% 
	Thread.sleep(200);
	request.setCharacterEncoding("utf-8");

	
%>
	<h2 id = "main">SikDDoRack<br>-가게목록-</h2> <p>
	<table>
			<tr>
				<td><div id = "tag_res" class = "pointer"> ● 음식점</div></td>
			</tr>
			<%
				String sto_name;
				DB.instance.SetStoTypeList("음식점");
				for(int i = 0; i < DB.instance.getStoreTypeList().size(); i++) {
						
					sto_name = DB.instance.getStoreTypeList().get(i).getSto_name();
			%>
			<tr class = "hide_res">
				<td><a href = "../Frame/Customer_Frame.jsp?_sto_name=<%=sto_name %>" target = "_parent"> &nbsp; ▶ <%=sto_name %></a></td>
			</tr>
					<%
				}
			%>
			<tr>
				<td><p></td>
			</tr>
			<tr>
				<td><div id = "tag_cafe" class = "pointer"> ● 카페</div></td>
			</tr>
			<%
				DB.instance.SetStoTypeList("카페");
				for(int i = 0; i < DB.instance.getStoreTypeList().size(); i++) {
						
					sto_name = DB.instance.getStoreTypeList().get(i).getSto_name();
			%>
			<tr class="hide_cafe">
				<td><a href = "../Frame/Customer_Frame.jsp?_sto_name=<%=sto_name %>" target = "_parent"> &nbsp; ▶<%=sto_name %></a></td>
			</tr>
			<%
				}
			%>
						<tr>
				<td><p></td>
			</tr>
			<tr>
				<td><div id = "tag_pc" class = "pointer"> ● PC방</div></td>
			</tr>
			<%
				DB.instance.SetStoTypeList("PC방");
				for(int i = 0; i < DB.instance.getStoreTypeList().size(); i++) {
						
					sto_name = DB.instance.getStoreTypeList().get(i).getSto_name();
			%>
			<tr class = "hide_pc">
				<td><a href = "../Frame/Customer_Frame.jsp?_sto_name=<%=sto_name %>" target = "_parent"> &nbsp; ▶<%=sto_name %></a></td>
			</tr>
			<%
				}
			%>
	</table>
</body>
</html>