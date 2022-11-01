<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calcResult.jsp</title>
</head>
<body>
	<h1>계산 결과</h1>
	
	<h2>1) JSP</h2>
	<%=request.getAttribute("message")%><br>
	숫자 1 : <%=request.getAttribute("no1")%><br>
	숫자 2 : <%=request.getAttribute("no2")%><br>
	결과   : <%=request.getAttribute("result")%><br>
	<%=request.getAttribute("img") %><br>
	<hr>
	
	<h2>2) EL</h2>
	${requestScope.message}<br>
	숫자 1 : ${requestScope.no1}<br>
	숫자 2 : ${requestScope.no2}<br>
	결과   : ${requestScope.result}<br>
	${requestScope.img}
	<hr>
	
	<h2>3) EL</h2>
	${message}<br>
	숫자 1 : ${no1}<br>
	숫자 2 : ${no2}<br>
	결과   : ${result}<br>
	${img==null ? "" : img}
	<hr>
</body>
</html>