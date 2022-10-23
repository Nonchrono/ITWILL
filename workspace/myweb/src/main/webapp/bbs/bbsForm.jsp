<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../bbs/ssi.jsp" %>
<script src="../ckeditor/ckeditor.js"></script>
<!-- 본문 시작 bbsForm.jsp -->
<h3>* 글쓰기 *</h3>
<p><a href="bbsList.jsp">글목록</a><p>

<div class="container">
	<form name="bbsfrm" id="bbsfrm" method="post" action="bbsIns.jsp" enctype="multipart/form-data" onsubmit="return bbsCheck()"> <!-- myscript.js에 함수 작성함 -->
	<div style="text-align: right">
		<label><input type="checkbox" name="secretp" value="1">&nbsp;비공개</label>&nbsp;&nbsp;
	</div>
	<table class="table">
	<tr>
	   <th class="success">작성자</th>
	   <td><input type="text" name="wname" id="wname" class="form-control" maxlength="20" required></td>
	</tr>
	<tr>
	   <th class="success">제목</th>
	   <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
	   <th class="success">내용</th>
	   <td><textarea rows="5"  class="form-control" name="content" id="content"></textarea></td>
	   <script>
       		CKEDITOR.replace('content', {
       			height: 400
       		});
       </script>
	</tr>
	<tr>
	   <th class="success">비밀번호</th>
	   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
	</tr>
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