<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 loginProc.jsp -->
<h3>* 로 그 인 결 과 *</h3>
<%
	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(passwd);

	String mlevel = dao.loginProc(dto);
	if (mlevel == null) {
		out.println("<p>아이디/비밀번호 다시 한번 확인해주세요!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		// 로그인 성공
		out.println("로그인에 성공하셨습니다!");
		out.println("회원 등급 : " + mlevel);
	} // if end
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>