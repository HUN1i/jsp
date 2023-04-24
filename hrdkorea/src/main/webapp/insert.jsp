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
		String artistid = request.getParameter("artistid");
		String artistname = request.getParameter("artistname");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String birth = year+month+day;
		String gender = request.getParameter("gender");
		String talent = request.getParameter("talent");
		String agency = request.getParameter("agency");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = String.format("insert into tbl_artist_201905 values ('%s','%s','%s','%s','%s','%s')",artistid,artistname,birth,gender,talent,agency);
	ResultSet rs = stmt.executeQuery(sql);

	
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			%>
		<jsp:forward page="submit.jsp"></jsp:forward>
	</table>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>