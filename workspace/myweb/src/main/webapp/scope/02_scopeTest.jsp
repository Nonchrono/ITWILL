<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_scopeTest</title>
</head>
<body>
	<h3>웹페이지의 SCOPE(유효범위)</h3>
<%-- 
	● [페이지 이동]
	1) <a href=""></a> // html 태그
	2) location.href=""	// 자바 스크립트
	3) <form action=""></form>
	4) <jsp:forward page=""></jsp:forward>
	5) response.sendRedirect("")
--%>
<%
	pageContext.setAttribute("one", 100);			// 현재 페이지에서만 유효
	request.setAttribute("two", 200);				// 
	session.setAttribute("three", 300);
	application.setAttribute("uid", "Nonchrono");
%>

	<!-- 1) request.getAttribute("two") null값 -->
	<!-- <a href="02_scopeResult.jsp">[SCOPE 결과 페이지 이동]</a> -->
	
	<!-- 2) request.getAttribute("two") null값 -->
	<!-- <form action="02_scopeResult.jsp">
		<input type="submit" value="[SCOPE 결과 페이지 이동]">
	</form> -->
	
	<!-- 3) request.getAttribute("two") null값 -->
	<!-- <script>
		alert("[SCOPE 결과 페이지 이동]");
		location.href="02_scopeResult.jsp";
	</script> -->
	
	<!-- 4) 액션태그 페이지 이동 -->
	<!-- request.getAttribute("two") 200 접근 가능
		 request 내부변수는 부모 페이지(scopeTest)와 자식 페이지(scopeResult)에서만 유효 -->
	<%-- <jsp:forward page="02_scopeResult.jsp"></jsp:forward> --%>
	
<%
	// 5) request.getAttribute("two") null값
	/* response.sendRedirect("02_scopeResult.jsp"); */
	
	// 6) request.getAttribute("two") 200 접근 가능
	String view="02_scopeResult.jsp";
	RequestDispatcher rd = request.getRequestDispatcher(view);
	rd.forward(request, response);
	
	/* 
		내부변수			02_scopeTest.jsp(부모)	02_scopeResult.jsp(자식)
		---------------------------------------------------------------
		pageContext				o						  x
		request					o						o 또는 x
		session					o						  o
		application				o						  o
	*/
%>
	
	
</body>
</html>