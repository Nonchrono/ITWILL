
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPWProc.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 비밀번호 찾기 결과 *</h3>
	
<%
String mname = request.getParameter("mname").trim();
String id = request.getParameter("id").trim();
String email = request.getParameter("email").trim();

dto.setMname(mname);
dto.setId(id);
dto.setEmail(email);

int cnt = dao.findPW(dto);

if(cnt == 1) {
	dto = dao.findPWProc(mname, id, email); 
	
	// 1) 사용하고자 하는 메일 서버에서 인증 받은 계정과 비번 등록하기
	// -> MyAuthenticator 클래스 생성

	// 2) 메일 서버(POP3) 지정하기
	String mailServer="mw-002.cafe24.com"; // cafe24 메일 서버
	Properties props = new Properties();
	props.put("mail.smtp.host", mailServer);
	props.put("mail.smtp.auth", true);
	
	// 3) 메일 서버에서 인증 받은 계정 + 비번
	Authenticator myAuth = new MyAuthenticator(); // 다형성 (부모가 자식 집에 들어감)
	
	// 4) 2)와 3)이 유효한지 검증
	Session sess = Session.getInstance(props, myAuth);
	
	// 5) 메일 보내기
	String content = "임시 비밀번호는 " + dto.getPasswd() + "입니다.";
	
	// 받는 사람 이메일 주소
	InternetAddress[] address = { new InternetAddress(email) }; 
	
	// 메일 관련 정보 작성
	Message msg = new MimeMessage(sess); // msg에 관련 자료를 다 담아서 transport 전송하면 된다
	
	// 받는 사람 // 받는 사람에 참조도 숨은 참조도 넣을 수 있다
	msg.setRecipients(Message.RecipientType.TO, address);
	// 참조 : Message.RecipientType.CC
	// 숨은참조 : Message.RecipientType.BCC // 동시에 보내는 이메일 주소 숨길 수 있다.
	
	// 보내는 사람
	msg.setFrom(new InternetAddress("webmaster@itwill.co.kr"));
	
	// 메일 제목
	msg.setSubject("비밀번호 찾기 결과입니다");
	
	// 메일 내용
	msg.setContent(content, "text/html; charset=UTF-8");
	
	// 메일 보낸 날짜
	msg.setSentDate(new Date());
	
	// 메일 전송
	Transport.send(msg);
	
	out.print(email + "님에게 메일이 발송되었습니다");
} // if end
	
%>
	
	</div>
</body>
</html>