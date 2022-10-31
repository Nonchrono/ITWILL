<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 noticeForm.jsp -->

<div class="container">
	<form name="noticefrm" id="noticefrm" method="post" action="noticeIns.jsp" onsubmit="return noticeCheck()"> <!-- myscript.js -->
	<table class="table">
	<tr>
	   <th class="success">작성자</th>
	   <td><input type="text" name="wname" id="wname" value="관리자" class="form-control" maxlength="20" readonly></td>
	</tr>
	<tr>
	   <th class="success">제목</th>
	   <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
	   <th class="success">내용</th>
	   <td><textarea rows="5"  class="form-control" name="content" id="content"></textarea></td>
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