<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIDProc.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* ID 찾기 결과 *</h3>
	
<%
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();

	dto = dao.findId(mname, email);
	
	if(dto == null) {
		out.println("값을 제대로 입력해주세요!!");
	}
	
	out.println("ID 찾기 결과 : "+dto.getId());
%>
	
	<button onclick="location.href='findPW.jsp'">비밀번호 찾기</button>
	
	</div>
</body>
</html>