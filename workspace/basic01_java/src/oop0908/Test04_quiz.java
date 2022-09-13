package oop0908;

import java.util.StringTokenizer;

public class Test04_quiz {

	public static void main(String[] args) {
		// String 관련 연습 문제
		
		
		//문1) 이메일 주소에 @문자 있으면
	     
		//    @글자 기준으로 문자열을 분리해서 출력하고
        //    @문자 없다면 "이메일주소 틀림" 메세지를 출력하시오        
        /*    
              출력결과
              webmaster
              itwill.co.kr
        */
		
		
		String email = new String("webmaster@itwill.co.kr");

		// @글자 기준으로 문자열을 분리
		StringTokenizer em = new StringTokenizer(email, "@");
		
		// @ 글자가 있는지 확인하고 출력, 없다면 "이메일 주소 틀림" 메세지 출력
		if (email.indexOf("@") >= 0) {
			while (em.hasMoreTokens()) {
				System.out.println(em.nextToken());
			}
		} else {
			System.out.println("이메일 주소 틀림");
		}
		
		System.out.println(email.substring(0, email.lastIndexOf("@")));
		System.out.println(email.substring(email.lastIndexOf("@")+1, email.length()));
		
		
		
		// 강사님 풀이
		
		if (email.indexOf("@")==-1) {
			System.out.println("이메일 주소 틀림!");
		} else {
			System.out.println("이메일 주소 맞음!");
		
			int pos = email.indexOf("@");
			System.out.println(pos); 	// 9
			
			String id     = email.substring(0, 9);
			String server = email.substring(pos+1);
			
			System.out.println(id);
			System.out.println(server);
		}
		
		//문2) 이미지 파일만 첨부 (.png .jpg .gif)
        /*     
               출력결과 
               파일명 : sky2022.04.06
               확장명 : png
        */
		
		String path = new String("d:/frontend/images/sky2022.09.08.png");
		
		// 마지막 /의 위치, 마지막 .의 위치를 알아야한다
		
		if (path.contains(".png") || path.contains(".jpg") || path.contains(".gif")) {
			System.out.printf("파일명 : %s \n", path.substring(path.lastIndexOf("/")+1, path.lastIndexOf(".")));
			System.out.printf("확장명 : %s", path.substring(path.lastIndexOf(".")+1, path.length()));
		} else {
			System.out.println("이미지 파일만 첨부해주세요");
		}
		System.out.println();
		
		// 강사님 풀이
		
		// 마지막 "/" 기호의 순서값
		int lastSlash = path.lastIndexOf("/");
		System.out.println(lastSlash);  // 18
		
		// 전체 파일명
		String file = path.substring(lastSlash+1);
		System.out.println("전체 파일명 : " + file);
		
		// file에서 마지막 "." 기호의 순서값
		int lastDot = file.lastIndexOf(".");
		System.out.println(lastDot);	// 13
		
		// 파일명
		String filename = file.substring(0, lastDot);
		System.out.println("파일명 : "+filename);
	
		// 확장명
		String ext = file.substring(lastDot+1);
		System.out.println("확장명 : "+ext);
		
		
		// 확장명을 전부 소문자로 치환
		ext = ext.toLowerCase();
		if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
			System.out.println("파일이 전송되었습니다~");
		} else {
			System.out.println("이미지 파일만 가능합니다!");
		} // if end
		
		
	} // main() end
} // class end
