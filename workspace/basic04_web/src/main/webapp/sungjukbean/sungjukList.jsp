<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="net.sungjuk.*"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>sungjukList.jsp</title>
</head>
<body>
	<h3 class="text-center">* 성적 목록 *</h3>
	<button type="button" onclick="location.href='sungjukForm.jsp'" class="btn btn-secondary" align="right">성적쓰기</button>
	
	<br><br>
	<table class="table table-bordered table-hover">
	<tr class="table-warning">
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>등록일</th>
		<th>상세보기</th>
	</tr>
<%
	ArrayList<SungjukDTO> list = dao.list();
	if (list == null) {
		out.println("<tr>");
		out.println("	<td colspan='5'>글없음!!</td>");
		out.println("</tr>");
	} else {
		for(int i=0; i < list.size(); i++) {
			dto = list.get(i);
%>
	<tr>
		<td><%=dto.getUname()%></td>
		<td><%=dto.getKor()%></td>
		<td><%=dto.getEng()%></td>
		<td><%=dto.getMat()%></td>
		<td><%=dto.getWdate().substring(0,10)%></td>
		<td><a href="sungjukRead.jsp?sno=<%=dto.getSno()%>">[상세보기]</a></td>
	</tr>
<%
		} // for end
	} // if end

%>	
	</table>


</body>
</html>