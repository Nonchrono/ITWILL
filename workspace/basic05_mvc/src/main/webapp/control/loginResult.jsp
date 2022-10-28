<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginResult.jsp</title>
</head>
<body>
	<h3>* 회원 로그인 결과 *</h3>

	1) JSP<br>
	<%=request.getAttribute("msg") %><br>
	<%=request.getAttribute("img") %><br>
	
	아이디 : <%=request.getAttribute("r_uid") %><br>
	패스워드 : <%=request.getAttribute("r_upw") %><br>
	
	아이디 : <%=session.getAttribute("s_uid") %><br>
	패스워드 : <%=session.getAttribute("s_upw") %><br>
	
	아이디 : <%=application.getAttribute("a_uid") %><br>
	패스워드 : <%=application.getAttribute("a_upw") %><br>
	<hr>
	
	2) EL (표현언어)<br>
	${requestScope.msg}<br>
	${requestScope.img}<br>
	
	아이디 : ${requestScope.r_uid}<br>
	패스워드 : ${requestScope.r_upw}<br>
	
	아이디 : ${sessionScope.s_uid}<br>
	패스워드 : ${sessonScope.s_upw}<br>
	
	아이디 : ${applicationScope.a_uid}<br>
	패스워드 : ${applicationScope.a_upw}<br>
	<hr>
	 
	<!-- Scope는 생략 가능하다 -->
	<!-- 웹의 ServletContext : pageContext → request → session → application -->
	${msg} <br>
	${img} <br>
	아이디 : ${r_uid}<br> 패스워드 : ${r_upw}<br>
	아이디 : ${s_uid}<br> 패스워드 : ${s_upw}<br>
	아이디 : ${a_uid}<br> 패스워드 : ${a_upw}<br>

</body>
</html>