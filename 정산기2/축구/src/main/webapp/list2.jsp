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
<section>
<h1>선수 별 홈그라운드 조회</h1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table border = 2>
<tr>
<td>선수이름</td>
<td>포지션</td>
<td>팀이름</td>
<td>경기장 이름</td>
<td>좌석 수</td>
</tr>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select play.player_name, play.player_position,team.team_name, stad.stadium_name, stad.seat_count from tbl_player_20221205 play, tbl_team_20221205 team, tbl_stadium_20221205 stad where play.team_id = team.team_id and stad.stadium_id = team.stadium_id and stad.seat_count >= 30000");
	
	while(rs.next()){
		String position = rs.getString(3);
		if(position.equals("GK")){
			position = "골키퍼";
		}
		else if(position.equals("DF")){
			position = "수비수";
		}
		else position = "공격수";
		%>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=position%></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		
		<%
	}
	stmt.close();
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</section>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>