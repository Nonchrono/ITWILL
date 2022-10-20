<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIDProc.jsp</title>
</head>
<body>
	<div class="container">
	<table class="table" style="text-align: center;">
		<tr>
			<th colspan="2">* ID 찾기 결과 *</th>
		</tr>
		<tr>
			<td colspan="2">
<%
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();

	dto = dao.findId2(mname, email);
	
	if(dto == null) {
		out.println("값을 제대로 입력해주세요!!");
	}
	
	out.println("ID 찾기 결과 : "+dto.getId());
%>
			</td>
		</tr>
		<tr>
			<td><button onclick="location.href='../index.jsp'">홈으로</button></td>
			<td><button onclick="location.href='findPW.jsp'">비밀번호 찾기</button></td>
		</tr>
	</table>
	</div>
</body>
</html>