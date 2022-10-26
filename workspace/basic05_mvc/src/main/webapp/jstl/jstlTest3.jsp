<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest3.jsp</title>
</head>
<body>
	<h3>* JSTL 함수 *</h3>

	<c:set var="txt" value="   White   Space   "></c:set>
	글자갯수 : ${fn:length(txt)}
	<hr>
	
	공백제거 : @<c:out value="${fn:trim(txt)}"></c:out>@
	<hr>
	
	<c:set var="str" value="Hi My name is waLdo"></c:set>
	문자열 자르기 : ${fn:substring(str, 3, 9)} <!-- My nam -->
	<hr>
	
	${fn:toLowerCase(str)} <br>
	${fn:toUpperCase(str)}
	<hr>
	
<%
	// 엔터를 <br>로 바꾸기
	// 1) JSP
	String content="";
	content = content.replace("\n", "<br>");

	// 2) EL + JSTL
	pageContext.setAttribute("cn", "\n");
%>

	<c:set var="content" value="Hi
                                My name is
								WaLdo"></c:set>
	${content}
	<hr>
	${fn:replace(content, cn, "<br>")}
	<hr>
	
	<c:set var="text" value="Hi
                             My <name> is
                             'W  a  L  d  o'"></c:set>
							
	${fn:escapeXml(text)}
	<hr>
	${fn:replace(fn:escapeXml(text), cn, "<br>")}
	<hr>
	${fn:replace(fn:replace(fn:escapeXml(text), cn, "<br>"), ' ', '&nbsp')}
	
	</body>
</html>