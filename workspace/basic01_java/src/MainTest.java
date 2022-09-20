
public class MainTest {

	public static void main(String[] args) {
		// oop0907.Test06_main.java 참조
		
		for (int i = 0; i < args.length; i++) {
			System.out.println(args[i]);
		}
		
		/*
		 	default package에 있는 MainTest.java참조
            명령 프롬프트에서 실습합니다
            주의사항 : 한글이 포함되어 있으면 컴파일시 에러 나는 경우가 발생
            		 주석을 포함한 한글을 삭제 후 테스트하거나 -encoding utf-8 후미에 붙여서 사용
            
            >cd\                    최상위 루트 이동
            >d:                     드라이브 변경
            >cd java202207          폴더 변경
            >cd workspace
            >cd basic01_java
            >cd src
            >dir
            >javac MainTest.java	자바소스 컴파일
            >java  MainTest			자바클래스 실행
            >java  MainTest Seoul Jeju Busan
		
		
		*/
	}

}
