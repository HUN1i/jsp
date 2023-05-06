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
<form action = "action.jsp" name = "frm" method = "post">
<table border = 2>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select max(player_id) + 1 from tbl_player_20221205");
	rs.next();
		%>
		
		<tr>
		<td>선수ID</td>
		<td>
		<input type = "text" name = "playerid" value = <%=rs.getString(1)%> readonly>
		</td>
		</tr>
		<tr>
		<td>선수이름</td>
		<td>
		<input type = "text" name = "playername">
		</td>
		</tr>
		<tr>
		<td>포지션</td>
		<td>
		<input type = "radio" name = "position" value = "GK">골키퍼
		<input type = "radio" name = "position" value = "DF">수비수
		<input type = "radio" name = "position" value = "MF">미드필더
		<input type = "radio" name = "position" value = "FW">공격수
		</td>
		</tr>
		<tr>
		<td>선수등록일</td>
		<td>
		<input type = "text" name = "playerdate">
		</td>
		</tr>
		<tr>
		<td>소속팀</td>
		<td>
		<select name = "teamid">
		<option value = "K00">무소속</option>
		<option value = "K01">울산현대</option>
		<option value = "K02">삼성블루윙즈</option>
		<option value = "K03">스틸러스</option>
		<option value = "K04">유나이티드</option>
		<option value = "K05">현대모터스</option>
		<option value = "K06">FC부산소마고</option>
		<option value = "K07">드래곤즈</option>
		<option value = "K08">일화천마</option>
		<option value = "K09">FC서울</option>
		<option value = "K10">시티즌</option>
		<option value = "K11">경남FC</option>
		<option value = "K12">광주상무</option>
		<option value = "K13">강원FC</option>
		<option value = "K14">제주유나이티드FC</option>
		<option value = "K15">대구FC</option>
		</select>
		</td>
		</tr>
		<tr>
		<td>
		<input type = "submit" value = "제출" onClick = "return check()">
		<input type = "reset" value = "취소" onClick = "reset()">
		</td>
		</tr>
		<%
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<script type="text/javascript" src = "check.js"></script>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>