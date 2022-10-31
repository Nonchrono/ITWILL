<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsIns.jsp -->
<% 
	// 사용자가 입력 요청한 정보를 가져오기
	String wname = request.getParameter("wname").trim(); // 비로그인시의 작성자
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	String passwd = request.getParameter("passwd").trim();
	String ip = request.getRemoteAddr(); // 요청 pc의 IP
	String secretp = request.getParameter("secretp"); // 비밀글 여부 // 비밀글 1, 공개글 0
	String writer = request.getParameter("writer"); // 로그인시의 작성자
	
	// 비밀글 체크를 안 한 상태면 값을 0으로
	if (secretp == null) {
		secretp = "0";
	}
	
	// 전달값을 모두 dto 객체에 담기
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	dto.setSecretp(secretp);
	dto.setWriter(writer);
	
	// 글 작성 함수
	int cnt = dao.create(dto);
	
	if (cnt == 0) {
		out.println("<p>글 작성이 실패했습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('글이 작성되었습니다~');");
		out.println("	location.href='bbsList.jsp'");
		out.println("</script>");
	} // if end
%>	
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>