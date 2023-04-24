<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select a.artist_id,a.artist_name,sum(p.score),round(avg(p.score),2),rank()over(order by sum(p.score) desc) from tbl_artist_201905 a,tbl_point_201905 p where a.artist_id = p.artist_id group by a.artist_id,a.artist_name order by sum(p.score)desc");
			while(rs.next()) {
				
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		<%
		}
		stmt.close();
		con.close();
		
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</table>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>