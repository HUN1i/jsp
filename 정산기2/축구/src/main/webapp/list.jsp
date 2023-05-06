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
<h1>선수조회</h1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table border = 2>
<tr>
<td>선수ID</td>
<td>선수이름</td>
<td>포지션</td>
<td>선수등록일</td>
<td>팀이름</td>
</tr>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select play.player_id, play.player_name, play.player_position, play.player_date, team.team_name from tbl_player_20221205 play, tbl_team_20221205 team where play.team_id = team.team_id order by play.player_id asc");
	
	while(rs.next()){
		String position = rs.getString(3);
		if(position.equals("GK")){
			position = "골키퍼";
		}
		else if(position.equals("DF")){
			position = "수비수";
		}
		else position = "공격수";
		
		String date = rs.getString(4);
		String newdate1 = date.substring(0,4);
		String newdate2 = date.substring(4,6);
		String newdate3 = date.substring(6,8);
		
		%>
		<tr>
		<td><a href = "modify.jsp?player_id=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=position%></td>
		<td><%=newdate1 + "년" + newdate2 + "월" + newdate3 + "일"%></td>
		<td><%=rs.getString(5) %></td>
		
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</section>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>