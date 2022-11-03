package net.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator{
	// 사용하고자 하는 메일 서버(POP3, SMTP)에서 인증 받은 계정 + 비번 등록
	
	// 비번이 들어가기 때문에 외부에 노출되면 안 된다
	private PasswordAuthentication pa;
	
	public MyAuthenticator() { // 기본 생성자
		pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com", "soldesk6901");
	} // end
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
	
} // class end
