<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../bbs/ssi.jsp" %>
<!-- 본문 시작 bbsReplyProc.jsp -->
<% 
	// 수정 요청한 정보를 가져오기
	int bbsno = Integer.parseInt(request.getParameter("bbsno").trim());
	String wname = request.getParameter("wname").trim();
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	String passwd = request.getParameter("passwd").trim();
	String ip = request.getRemoteAddr(); // 요청 PC의 IP
	String secretp = request.getParameter("secretp").trim();
	
	// 전달값을 모두 dto 객체에 담기
	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	dto.setSecretp(secretp); 
	
	int cnt = dao.reply(dto); 
	 
	if (cnt == 0) {
		out.println("<p>답변쓰기 실패했습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('답변이 추가되었습니다~');");
		out.println("	location.href='bbsList.jsp'");
		out.println("</script>");
	} // if end
%>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>