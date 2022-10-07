<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "ssi.jsp"%>
<!-- jsp:include page="ssi.jsp"> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>sungjukRead.jsp</title>
</head>
<body>
	<br>
	<h3>* 성적 상세보기 *</h3>
	<p>
		<button type="button" onclick="location.href='sungjukForm.jsp'" class="btn btn-secondary">성적쓰기</button>
		<button type="button" onclick="location.href='sungjukList.jsp'" class="btn btn-secondary">성적목록</button>
	</p>
<%
	int sno = Integer.parseInt(request.getParameter("sno"));
	dto = dao.read(sno);
	if(dto == null) {
		out.print("해당 글 없음!!");
	} else {
%>
		<table class="table table-hover table-bordered">
		<tr>
			<th class="text-center table-warning">이름</th>
			<td><%=dto.getUname() %></td>
		</tr>
		<tr>
			<th class="text-center table-warning">국어</th>
			<td><%=dto.getKor()%></td>
		</tr>
		<tr>
			<th class="text-center table-warning">영어</th>
			<td><%=dto.getEng()%></td>
		</tr>
		<tr>
			<th class="text-center table-warning">수학</th>
			<td><%=dto.getMat()%></td>
		</tr>
		<tr>
			<th class="text-center table-warning">평균</th>
			<td><%=dto.getAver()%></td>
		</tr>
		<tr>
			<th class="text-center table-warning">주소</th>
			<td><%=dto.getAddr()%></td>
		</tr>
		<tr>
			<th class="text-center table-warning">작성일</th>
			<td><%=dto.getWdate()%></td>
		</tr>
		</table>
		<br>
		<button type="button" onclick="location.href='sungjukUpdate.jsp?sno=<%=sno%>'" class="btn btn-secondary">수정</button>
		<button type="button" onclick="location.href='sungjukDel.jsp?sno=<%=sno%>'" class="btn btn-secondary">삭제</button>
<%
	} // if  end
%>
	
	
</body>
</html>