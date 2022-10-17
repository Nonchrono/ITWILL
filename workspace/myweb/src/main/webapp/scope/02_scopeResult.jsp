<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_scopeResult</title>
</head>
<body>
	<h3>웹페이지의 SCOPE(유효범위) 결과</h3>
<%
	// 자식 페이지에서 내부 변수 값 가져오기 (유효범위 확인)
	out.print("1) pageContext 영역 : "+ pageContext.getAttribute("one"));
	out.print("<hr>");
	out.print("2) request 영역 : "+ request.getAttribute("two"));
	out.print("<hr>");
	out.print("3) session 영역 : "+ session.getAttribute("three"));
	out.print("<hr>");
	out.print("4) application 영역 : "+ application.getAttribute("uid"));
	out.print("<hr>");
%>
</body>
</html>