<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/ssi.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 memberWithdrawProc.jsp -->
<%
	String passwd = request.getParameter("passwd").trim();

	dto.setPasswd(passwd);
	dto.setId(s_id);

	int cnt = dao.delete(dto);
	
	if(cnt == 0) {
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='memberWithdraw.jsp'>[다시시도]</a></p>");
	} else {
		session.setAttribute("s_id", "guest");
		session.setAttribute("s_passwd", "guest");
		session.setAttribute("s_mlevel", "guest");
		
		out.println("<script>");
		out.println("	location.href='loginForm.jsp';"); // 목록 페이지 이동
		out.println("	alert('회원탈퇴되었습니다!')");
		out.println("</script>");
	} // if end

%>
	
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>