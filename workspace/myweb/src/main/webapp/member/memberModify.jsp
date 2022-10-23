<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 본문 시작 memberModify.jsp -->
<h3>* 회원정보 수정 *</h3>

<div class="container">
	<form method="post" action="memberModifyProc.jsp">
		<table class="table">
		<tr>
			<th class="success">비밀번호</th>
			<td><input type="password" name="passwd" id="passwd" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="회원정보 수정" class="btn btn-danger">
				&nbsp;&nbsp;&nbsp;
				<button class="btn" onClick="location.href='../index.jsp'">취소</button>
			</td>
		</tr>
		</table>
	</form>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>