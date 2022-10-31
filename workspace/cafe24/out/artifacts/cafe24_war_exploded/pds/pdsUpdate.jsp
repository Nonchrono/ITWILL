<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsUpdate.jsp -->

<h3>* 첨부형 게시판 수정 *</h3>
<p>
	<a href="pdsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="pdsList.jsp">[글목록]</a>
</p>

<div class="container">
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno")); // 수정 글번호
	String oldFileName = request.getParameter("filename");
	
	dto = dao.read(pdsno); // 글번호가 일치하는 행을 가져오기
	if (dto == null) {
		out.println("해당 글 없음");
	} else {
%>
<form name="bbsfrm" id="bbsfrm" method="post" action="pdsUpdateProc.jsp" enctype="multipart/form-data">
	<!-- 히든 속성 -->
	<input type="hidden" name="pdsno" value="<%=pdsno%>">
	<input type="hidden" name="oldFileName" value="<%=oldFileName%>">
	<%-- <input type="hidden" name="col" value="<%=col%>">
	<input type="hidden" name="word" value="<%=word%>"> --%>
	
	<table class="table">
	<tr>
	    <th>이름</th>
	    <td style="text-align: left"><input type="text" name="wname" id="wname" size="20" maxlength="100" required autofocus></td>
	</tr>
	<tr>
	   <th>제목</th>
	   <td style="text-align: left">
	   	<textarea rows="5" cols="30" name="subject" id="subject"></textarea>
	   </td>
	</tr>
	<tr>
	    <th>비밀번호</th>
	    <td style="text-align: left"><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
	    <th>첨부파일</th>
	    <td style="text-align: left"><input type="file" name="filename" id="filename"></td>
	</tr>
	<tr>
	    <td colspan="2">
	    	  <input type="submit" value="사진 올리기" class="btn btn-success">
	    	  <input type="reset"  value="취소"      class="btn btn-danger">
	    </td>
	</tr>
	</table>
</form>
<%
	} // if end
%>
</div>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>