<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../member/ssi.jsp" %>
<!-- 본문 시작 memberModifyProc2.jsp -->
	
<%
	// 사용자가 입력 요청한 정보를 가져오기
	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String tel = request.getParameter("tel").trim();
	String email = request.getParameter("email").trim();
	String zipcode = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim(); 
	String job = request.getParameter("job");
	
	// 전달값을 모두 dto 객체에 담기
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	
	int cnt = dao.modify(dto); 
	
	if (cnt == 0) {
		out.println("<p>회원 수정이 실패했습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		
		session.setAttribute("s_id", "guest");
		session.setAttribute("s_passwd", "guest");
		session.setAttribute("s_mlevel", "guest");
		
		out.println("<script>");
		out.println("	location.href='../index.jsp'");
		out.println("	alert('회원수정 성공! 다시 로그인해주세요~');");
		out.println("</script>");
	} // if end
%>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>