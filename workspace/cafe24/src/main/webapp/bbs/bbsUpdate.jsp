<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../member/auth.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsUpdate.jsp -->
<!-- 글 번호가 일치하는 행을 가져와서 수정 폼에 출력하기 read(), bbsForm.jsp 참고-->
<h3>* 게시판 수정 *</h3>

<div class="container">
<p style="text-align: right">
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp">[글목록]</a>
</p>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno")); // 수정 글번호
	int secretp = Integer.parseInt(request.getParameter("secretp").trim()); // 비밀글 여부
	dto = dao.read(bbsno); // 글번호가 일치하는 행을 가져오기
	String writer = request.getParameter("writer").trim();
	
	if (writer.equals(s_id) || writer.equals("guest")) { // 대전제로 작성자와 로그인한 아이디가 같을 때, 비회원은 해당 사항 없음
		
		if (dto == null) {
			out.println("해당 글 없음");
		} else {
%>
		<form name="bbsfrm" id="bbsfrm" method="post" action="bbsUpdateProc.jsp" onsubmit="return bbsCheck()">
		
		<!-- 히든 속성 -->
		<input type="hidden" name="bbsno" value="<%=bbsno%>">
		<input type="hidden" name="col" value="<%=col%>">
		<input type="hidden" name="word" value="<%=word%>">
		
		<div style="text-align: right">
<% 
		if (secretp != 1) {
%>
			<label><input type="checkbox" name="secretp" value="1">&nbsp;비공개</label>&nbsp;&nbsp;
<% 
		} else {
%>
			<label><input type="checkbox" name="secretp" value="1" checked="checked">&nbsp;비공개</label>&nbsp;&nbsp;
<%		
		}
%>
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
		   <td><input type="text" name="wname" id="wname" value="<%=dto.getWname()%>" class="form-control" maxlength="20" required></td>
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
<%
		} // if end
	} else { // 작성자의 아이디와 다른 아이디가 글을 수정하려고 할 때
%>
	out.println("<script>");
	out.println("	location.href='bbsList.jsp'");
	out.println("	alert('로그인 회원의 게시글은 본인만 수정이 가능합니다');");
	out.println("</script>");
<%	
	} // if end
%>	
</div>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>