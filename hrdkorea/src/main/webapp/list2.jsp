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
			<td>채점번호</td>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>점수</td>
			<td>평점</td>
			<td>멘토명</td>
		</tr>
		<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT P.SERIAL_NO, A.ARTIST_ID, A.ARTIST_NAME, A.BIRTH, P.SCORE, M.MENTO_ID FROM TBL_ARTIST_201905 A, TBL_MENTO_201905 M, TBL_POINT_201905 P WHERE (A.ARTIST_ID = P.ARTIST_ID) AND (M.MENTO_ID = P.MENTO_ID)");
	
	while(rs.next()){
		int dun = rs.getInt(5);
		String dun2 = "A";
		if(dun > 90){
			dun2 = "A";
		}
		else if(dun > 80){
			dun2 = "B";
		}
		else if(dun > 70){
			dun2 = "C";
		}
		else if(dun > 60){
			dun2 = "D";
		}
		else dun2 = "F";
		%>
		<tr>
			<td><%=rs.getString(1) %>
			<td><%=rs.getString(2) %>
			<td><%=rs.getString(3) %>
			<td><%=rs.getString(4) %>
			<td><%=rs.getString(5) %>
			<td><%= dun2%>
			<td><%=rs.getString(6) %>

		</tr>
			<%
			} 
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			%>
		
	</table>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>