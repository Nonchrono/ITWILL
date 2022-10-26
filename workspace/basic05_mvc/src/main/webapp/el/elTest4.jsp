<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest4.jsp</title>
</head>
<body>
	<h3>* JSP와 EL의 값 공유 *</h3>
	
<%
	// JSP와 EL은 현재 페이지 내에서 서로 값을 공유할 수 없다
	String uname = "짱구는못말려"; // JSP 변수
%>
	이름 (JSP) : <%=uname%><br> <!-- 짱구는못말려 -->
	이름 (EL) : ${uname}		   <!-- 빈문자열 -->
	<hr>
	
	
<%
	// 현재 페이지에서 JSP와 EL이 서로 값을 공유하기 위해서는 pageScope를 활용한다
	pageContext.setAttribute("uid", "KOREA");
%>
	아이디(JSP) : <%=pageContext.getAttribute("uid") %><br>	<!-- KOREA -->
	아이디(EL) : ${pageScope.uid}<br> <!--KOREA -->
	아이디(EL) : ${uid} <!-- KOREA -->
	<hr>


</body>
</html>