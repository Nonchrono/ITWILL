<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 memberWithdrawProc.jsp -->
<h3>* 회원탈퇴 결과 *</h3>

<%
	dto.setId((String)session.getAttribute("s_id"));
	dto.setPasswd(request.getParameter("passwd").trim());

	int cnt = dao.delete(dto);
	
	if(cnt == 0) {
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='memberWithdraw.jsp'>[다시시도]</a></p>");
	} else {
		// 세션변수 모두 제거하기
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		String message = "";
		message += "회원 탈퇴되었습니다. 이용해주셔서 감사합니다\\n";
		message += "재가입을 원할 경우 이메일로 문의하시기 바랍니다";
		out.println("<script>");
		out.println("	alert('"+ message +"')");
		out.println("	location.href='loginForm.jsp';"); // 목록 페이지 이동
		out.println("</script>");
	} // if end
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>