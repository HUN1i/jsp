<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<link rel = stylesheet href = style.css>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String playerid = request.getParameter("playerid");
String playername = request.getParameter("playername");
String position = request.getParameter("position");
String playerdate = request.getParameter("playerdate");
String teamid = request.getParameter("teamid");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(String.format("insert into tbl_player_20221205 values('%s','%s','%s','%s','%s')",playerid,playername,position,playerdate,teamid));
	
	

}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page="list.jsp"></jsp:forward>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>