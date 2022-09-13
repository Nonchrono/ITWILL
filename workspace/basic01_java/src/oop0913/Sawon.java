package oop0913;

public class Sawon {
	// 멤버 변수 field
	String sabun;	// 사원번호
	String name;	// 이름
	int pay;		// 급여
		
	// 생성자 함수 constructor
	// 기본 생성자 (수동으로 만들어놓기)
	public Sawon() {}
	
	// 생성자 함수 자동 코딩
	// 메뉴 Source -> Generate Constructor using Fields...
	public Sawon(String sabun, String name, int pay) {
		this.sabun = sabun;
		this.name = name;
		this.pay = pay;
	};	
	
	// static 변수
	static String COMPANY = "아이티윌"; // static 변수는 일반 변수와 구분하기 위해서 대문자로 적기도 한다
	static int SUDANG = 10;
	static double TAX = 0.03;
	
	
	// static 함수
	static void line() {
		System.out.println("------------------------------");
	} // line() end
	
	
} // class end
