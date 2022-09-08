package oop0907;

public class Test02_method {

	public static int test1(int a, int b) {	// a=2, b=4. 리턴값이 없으니 void를 생략해야한다.
		int c= a+b;
		// return;		// 리턴값이 없는 경우 (void). 리턴값은 없거나 하나여야한다
		return c;		// 리턴값이 있는 경우 리턴값의 자료형을 void 자리에 쓴다
						// 리턴값은 1개 값만 리턴할 수 있다
	} // test1() end
	
	public static String test2(int a) {
		if (a % 2 ==0) {
			return "짝수";
		} else {
			return "홀수";
		}
	} // test2() end
	
	public static boolean test3(int a) {
		if (a % 4 == 0) {
			return true;
		} else {
			return false;
		}
	}
	
//	public static long test4(int n) {
//		for (int i = n; i >= 1; i--) {
//           return f = (long)a * (a-1));
//		} // for end
//	} // test4() end
	
	public static long test4(int n) {
		long gop = 1;
		for (int i = n; i >= 1; i--) {
           gop = gop * i;
		} // for end
		return gop;
	} // test4() end
	
	public static int fact (int a) {
		if (a == 0) {
			return 1;
		} else {
			return a * fact(a - 1);		// 재귀적 함수 호출
		} // if end
	} // fact() end
	
	
	public static void main(String[] args) {

		// 2. 리턴값이 있는 경우
		
		// System.out.println(Math.abs(-3));
		// System.out.println(Math.max(5, 7));
		
		int result = test1(2, 4);
		System.out.println(result);
		
		// 값 : 상수값, 변수값, 리턴값
		System.out.println(test1(5,6)); 	// 리턴값도 값이다
		
		// 짝수, 홀수 출력하기
		String str = test2(7);
		System.out.println(str);
		
		// 윤년 구하기
		if(test3(2022)) {
			System.out.println("윤년");
		} else {
			System.out.println("평년");
		} // if end
		
		// 팩토리얼 구하기
		long f = test4(5);
		System.out.println(f);
		
		/////////////////////////////////////////////////////////////////
		
		// 3. 재귀적 함수 호출                                                                          
		// 팩토리얼값 구하기
		System.out.println(fact(5));
		
		
	}	// main() end
}	// class end
