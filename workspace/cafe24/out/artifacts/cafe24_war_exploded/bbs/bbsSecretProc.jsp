<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../bbs/ssi.jsp" %>
<!-- 본문 시작 bbsSecretProc.jsp -->
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd").trim();
	int secretp = Integer.parseInt(request.getParameter("secretp").trim());
	String writer = request.getParameter("writer").trim();
	
	dto.setBbsno(bbsno);
	dto.setPasswd(passwd);
	
	Boolean result = dao.secret(bbsno, passwd); 
	if(result == false) {
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("	location.href='bbsRead.jsp?bbsno="+bbsno+"&col="+col+"&word="+word+"&secrept="+secretp+"&writer="+writer+"';"); // 목록 페이지 이동
		out.println("</script>");
	} // if end

%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>