package oop0908;

import java.util.StringTokenizer;

public class Test04_1_quiz {

	public static void main(String[] args) {

		//문1

		String email=new String("webmaster@itwill.co.kr");

		StringTokenizer st=new StringTokenizer(email, "@");
		String[] word=email.split("@");


		if(st.hasMoreElements()) {
		//System.out.println("이메일주소 맞음");
		System.out.println(word[0]);
		System.out.println(word[word.length-1]);
		}else {
		System.out.println("이메일주소 틀림");
		};



		//문2

		String path=new String("i:/frontend/images/sky2022.09.08.png");


		String[] slash=path.split("/");
		String middle=new String(slash[slash.length-1]);

		String[] jum=middle.split("[.]");

		System.out.println("파일명 : "+jum[0]);
		System.out.println("확장명 : "+jum[jum.length-1]);


		//이미지 파일만 첨부 (.png .jpg .gif)
		if(  jum[jum.length-1].equals("png")
		 || jum[jum.length-1].equals("jpg")
		 || jum[jum.length-1].equals("gif")  )
		{
		System.out.println("올바른 이미지 확장자");
		}else {
		System.out.println("이미지 파일만 첨부하시오");
		}//if end
		
		
	}

}
