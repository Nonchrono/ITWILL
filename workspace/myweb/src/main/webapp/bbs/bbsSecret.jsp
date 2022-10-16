<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../bbs/ssi.jsp" %>
<!-- 본문 시작 bbsSecret.jsp -->
<h3>* 패스워드 확인 *</h3>
<p><a href="bbsList.jsp">[글목록]</a></p>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	int secretp = Integer.parseInt(request.getParameter("secretp").trim());
	
%>
<div class="container">
	<form method="post" action="bbsSecretProc.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&secretp=<%=secretp%>" onsubmit="return pwCheck2()"> <!-- myscript.js -->
	<input type="hidden" name="bbsno" value="<%=bbsno%>">
	<input type="hidden" name="secretp" value="<%=secretp%>">
		<table class="table">
		<tr>
			<th class="success">비밀번호</th>
			<td><input type="password" name="passwd" id="passwd" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인" class="btn btn-primary">
			</td>
		</tr>
		</table>
	</form>
</div>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>