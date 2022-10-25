<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ssi.jsp 추가 -->
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>


<%
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String regdt = request.getParameter("regdt");
	
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setRegdt(regdt);
	
	
	
%>

<!-- 본문시작 noticeList.jsp -->
<div class="container">
<h3>* 공지사항 목록 *</h3>
<p><a href="noticeForm.jsp">[글쓰기]</a></p>
<div class="table-responsive">
    <table class="table table-hover table-condensed">
    <thead>
        <tr class="success">
            <th scope="row">제목</th>
            <th scope="row">조회수</th>
            <th scope="row">작성자</th>
            <th scope="row">작성일</th>
        </tr>
    </thead>
    <tbody>
    	<tr>
    		<td><%=dto.getSubject()%></td>
    		<td><%=dto.getContent()%></td>
    		<td>관리자</td>
    		<td><%=dto.getRegdt()%></td>
    	</tr> 
	</tbody>
	</table>
</div>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>