<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/auth.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsReply.jsp -->
<h3>* 답변 쓰기 *</h3>
<p><a href="bbsList.jsp">[글 목록]</a></p>

<div class="container">
	<form name="bbsfrm" id="bbsfrm" method="post" action="bbsReplyProc.jsp" onsubmit="return bbsCheck()"> <!-- myscript.js에 함수 작성함 -->
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
		<!-- 비밀글 체크 -->
		<div style="text-align: right">
			<label><input type="checkbox" name="secretp" value="1">&nbsp;비공개</label>&nbsp;&nbsp;
		</div>

		<!-- 진짜 작성자를 구분하기 위해 writer에 아이디 저장 -->
		<!-- 비로그인시에는 guest -->
		<input type="hidden" name="writer" value="<%=s_id%>">

		<!-- 테이블 -->
		<table class="table">
			<%
				// 비로그인시에 작성자 작성할 수 있게
				if (s_id.equals("guest") && s_passwd.equals("guest")) {
			%>
			<tr>
				<th class="success">작성자</th>
				<td><input type="text" name="wname" id="wname" class="form-control" maxlength="20" required></td>
			</tr>
			<%
				// 로그인시에 작성자 고정
			} else {
			%>
			<tr>
				<th class="success">작성자</th>
				<td><input type="text" name="wname" id="wname" value="<%=s_id%>" class="form-control" readonly></td>
			</tr>
			<%
				}
			%>
			<tr>
				<th class="success">제목</th>
				<td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" required></td>
			</tr>
			<tr>
				<th class="success">내용</th>
				<td><textarea rows="5"  class="form-control" name="content" id="content"></textarea></td>
			</tr>
			<%
				// 비로그인시에 비밀번호 작성할 수 있게
				if (s_id.equals("guest") && s_passwd.equals("guest")) {
			%>
			<tr>
				<th class="success">비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
			</tr>
			<%
				// 로그인시에 패스워드 고정 및 히든처리
			} else {
			%>
			<tr>
				<td><input type="hidden" name="passwd" id="passwd" value="<%=s_passwd%> class="form-control""></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="쓰기" class="btn btn-success">
					<input type="reset"  value="취소" class="btn btn-danger">
				</td>
		</table>
	</form>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>