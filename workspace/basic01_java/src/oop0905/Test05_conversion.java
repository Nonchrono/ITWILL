package oop0905;

public class Test05_conversion {

	public static void main(String[] args) {
		// 자료형 변환 (Datatype Conversion)
		
		// 1. 자동 형변환
		// 정수형 : byte < short < int < long
		// 실수형 : float < double
		// 정수형과 실수형이 서로 연산이 되면 자동으로 실수형화 된다.
		byte a = 3;
		int b = a; // 자동형 변환 (byte -> int)
		long c = b;	// (int -> long)
		// a = c;	// long 타입을 byte 타입에 넣으니 오류가 뜬다.
		
		float d = 3.4f;
		double e = d; // 자동 형변환
		
		
		int kor = 80, eng = 95, mat = 100;
		System.out.println((kor + eng + mat)/3);
		System.out.println((kor + eng + mat)/3.0);
		System.out.println((kor + eng + mat)/3.);
		// 소수점을 찍고 싶다면 실수를 계산식에 넣어야한다.
		////////////////////////////////////////////////////////////
		
		
		
		// 2. 강제 형변환 (cast 연산)
		// -> 필요한 곳에서 일시적으로 변환
		// -> 형식) (자료형) 값
		System.out.println((int)3.5);				// 3
		System.out.println((double)4);				// 4.0
		System.out.println((int)2.6 + (int)5.7);	// 2+5 = 7
		System.out.println((int)(2.6+5.7));			// (int)(8.3) = 8
		
		
		//ASCII(American Standard Code for Information Interchange)
        // -> 문자를 숫자로 기억하기 위한 총 128개의 부호
        // -> 미국 ANSI에서 표준화한 정보교환용 7비트 부호체계
        // -> 키보드에 있는 자판은 대부분 아스키코드값이 존재하고, 프로그래밍에서 활용할 수 있다.
		System.out.println((int)'A');	// 65
		System.out.println((int)'B');	// 66
		System.out.println((int)'C');	// 67
		
		System.out.println((int)'a');	// 97
		System.out.println((int)'b');	// 98
		System.out.println((int)'c');	// 99
		
		System.out.println((char)65);	// A
		System.out.println((char)66);	// B
		System.out.println((char)67);	// C

		System.out.println((char)97);	// a
		System.out.println((char)98);	// b
		System.out.println((char)99);	// c
		
		System.out.println((int)' ');	// 32 공백
		System.out.println((int) '\r'); // 13 엔터
		
		System.out.println('A' < 'a');	// true
									// 65 < 97
		
		// 문) 임의의 문자가 소문자인지 확인하시오
		char ch = 'a';
		String result = (ch >= 'a' && ch <= 'z') ? "소문자" : "기타";
		System.out.println(ch + "은 " + result);
		
		
	}	// main() end
}	// class end
