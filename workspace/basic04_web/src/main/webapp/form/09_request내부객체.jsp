<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09_request내부객체.jsp</title>
</head>
<body>
	<!-- 사용자가 전송 버튼을 누른 건 모두 request에서 관리 -->
	
		<h3>*  request 내부 객체의 다양한 메소드 *</h3>
		<form action="09_ok.jsp">
				아이디 : <input type="text" name="uid">
				<br>
				<input type="submit" value="request내부객체">
		</form>

</body>
</html>