<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/auth.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../bbs/ssi.jsp" %>

<!-- 본문 시작 bbsRead.jsp -->
<h3>* 게시판 상세보기 *</h3>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">[글목록]</a> <!-- 글목록으로 이동 -->
</p>
<div class="container">
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	//한줄에 해당하는 온전한 정보를 담으려면 dto
	// 여러줄은 List
	dto = dao.read(bbsno);
	if(dto == null) {
		out.println("해당 글 없음!!");
	} else {
		dao.incrementCnt(bbsno); // 조회수 증가
		
%>	
		<table class="table">
		<tr>
			<th class="success" scope="col">제목</th>
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th class="success" scope="col">내용</th>
			<td style="text-align: Left">
<%
			String content = Utility.convertChar(dto.getContent());
			out.print(content);			
%>
			</td>
		</tr>
		<tr>
			<th class="success" scope="col">조회수</th>
			<td><%=dto.getReadcnt()%></td>
		</tr>
		<tr>
			<th class="success" scope="col">작성자</th>
			<td><%=dto.getWname()%></td>
		</tr> 
		<tr>
			<th class="success" scope="col">작성일</th>
			<td><%=dto.getRegdt()%></td>
		</tr>
		<tr>
			<th class="success" scope="col">IP</th>
			<td><%=dto.getIp()%></td>
		</tr>
		</table>
		<br>
		<input type="button" value="답변쓰기" class="btn btn-info" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>&secretp=<%=dto.getSecretp()%>'">
		<input type="button" value="수정" class="btn btn-warning" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&secretp=<%=dto.getSecretp()%>'">
		
		<% if (s_mlevel.equals("A1")) { %>
		<input type="button" value="삭제" class="btn btn-danger" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
<% 
		} // if end
	} // if end
%>
</div>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>