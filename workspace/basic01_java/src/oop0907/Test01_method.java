package oop0907;

public class Test01_method {

	// 메소드 작성 영역
	
	// void 리턴값이 없다
	public static void test1() {
		System.out.println("JAVA");
	} // test1() end
	
	public static void test2() {
		System.out.println("Python");
		return; // 함수는 호출한 시점으로 되돌아 간다
				// 마지막 return 명령어는 생략 가능하다
	} // test2() end
	
	public static void test3(int a) {		// 매개변수(parameter)의 자료형은 생략할 수 없다.
		System.out.println(a);
		return;
	}
	// 매개변수 a는 지역변수라서 메소드 내부에서만 사용이 가능하다.
	
	public static void test4(int a, int b, int c) {
		System.out.println((a+b+c));
		return;
	} // test4() end
	
	public static void test5(double a, double b) {
		System.out.println(a+b);
		return;
	}
	
	public static void test6(char a, byte b) {
		for (int i = 0; i < b; i++) {
			System.out.println(a);
		} // for end
	} // test6() end
	
	public static void main(String[] args) {
		// Method 메소드
		// 함수, function, 프로시저
		
		// 1. 리턴값이 없는 함수
		
		// 1) 전달값(argument value)이 없는 경우
		
		test1(); // 함수 호출
		test2();
		test1();
		
		// 2) 전달값이 있는 경우
		test3(10);				// 기본적으로 int
		test4(20,30,40);
		test5(1.2, 3.4);		// double
		
		
		// 문제) # 기호를 100번 출력하시오
		byte num = 100;
		char ch = '#';
		test6(ch, num);
		
	}

}
