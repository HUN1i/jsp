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
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>소속사</td>
		</tr>
		<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from tbl_artist_201905");
	
	while(rs.next()){
		String gender = rs.getString("gender");
		String talent = rs.getString("talent");
		if(gender.equals("F")){
			gender = "여";
		}
		else gender = "남";
		
		if(talent.equals("1")){
			talent = "보컬";
		}
		else if(talent.equals("2")){
			talent = "댄스";
		}
		else talent = "랩";
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=gender %></td>
			<td><%=talent %></td>
			<td><%=rs.getString(6) %></td>
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