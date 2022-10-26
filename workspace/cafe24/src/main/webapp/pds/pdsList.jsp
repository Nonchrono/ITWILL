<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsList.jsp -->
<h3>* 포토 갤러리 *</h3>
<p><a href="pdsForm.jsp">[사진 올리기]</a></p>
<%
	ArrayList<PdsDTO> list = dao.list();
	if(list == null) {
		out.println("관련 자료 없음!!");
	} else {
		out.println("전체 글 갯수 : "+ list.size());
%>
	<div class="container">
		<table class="table table-hover">
		<thead>
			<tr class="success">
				<th style="text-align: center;">제목</th>
				<th style="text-align: center;">사진</th>
				<th style="text-align: center;">조회수</th>
				<th style="text-align: center;">작성자</th>
				<th style="text-align: center;">작성일</th>
			</tr>
		</thead>
		<tbody>
<%
		for(int i=0; i < list.size(); i++) {
			dto = list.get(i);
%>
			<tr>
				<td style="text-align: left;"><a href="pdsRead.jsp?pdsno=<%=dto.getPdsno()%>"><%=dto.getSubject()%></td>
				<td style="text-align: center;"><img src="../storage/<%=dto.getFilename()%>" width="50"></td>
				<td style="text-align: center;"><%=dto.getReadcnt()%></td>
				<td style="text-align: center;"><%=dto.getWname()%></td>
				<td style="text-align: center;"><%=dto.getRegdate().substring(0, 10)%></td>
			</tr>
<%
		} // for end
		out.println("	</tbody>");
		out.println("</table>");
		out.println("</div>");
	} // if end
%>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>