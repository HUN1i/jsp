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
<script type="text/javascript" src = "check.js"></script>
	<h1>오디션 등록</h1>
	<form name = "frm" action = "insert.jsp" method = "post">
	<table border=1>
		<tr>
			<td>참가번호</td>
			<td>
			<input type = "text" name = "artistid" >*참가번호는(A000) 4자리입니다.
			</td>
		</tr>
		<tr>
			<td>참가자명</td>
			<td>
			<input type = "text" name = "artistname">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
			<input type = "text" name = "year">년<input type = "text" name = "month">월<input type = "text" name = "day">일
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
			<input type = "radio" name = "gender" value = "M">남성
			<input type = "radio" name = "gender" value = "F">여성
			</td>
		</tr>
		<tr>
			<td>특기</td>
			<td>
			<select name = "talent">
			<option value = "" selected>특기선택
			<option value = "1" >보컬
			<option value = "2" >댄스
			<option value = "3" >랩
			</option>
			
			</select>
		</tr>
		<tr>
			<td>소속사</td>
			<td>
			<input type = "text" name = "agency">
			</td>
		</tr>
		<tr>
		<td>
		<button type = "submit" value = "오다션 등록" onclick=" check()">오다션 등록</button>
		<button type = "reset" value = "다시쓰기" onclick="re()">다시쓰기</button>
		</td>
		</tr>
		
	</table>
	</form>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>