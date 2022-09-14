package oop0908;	// <- 현재 클래스의 저장 위치. 한번만 선언한다

// 클래스를 사용하려면 저장위치(package)를 선언하고 사용한다
import java.io.*;
import java.sql.*;
import java.util.Arrays; // 해당 클래스를 직접 선언
import java.awt.*;		 // GUI 관련 클래스
import javax.swing.*;	 // GUI 관련 클래스
import oop0907.*;

/*
	Access Modifier 접근제어, 접근수정
	-> Private		비공개. 클래스 내부에서만 접근 가능하다. 은닉할 수 있다.
	-> package		생략한다. 현재 package(해당 파일 기준 oop0908) 내에서만 접근 가능하다
	-> protected	상속관계에 있는 클래스가 다른 패키지에 있는 경우
	-> public		공개. 현재 파일 기준 basic01_java 프로젝트 내에서 모두 접근 가능하다
*/

class Sungjuk {	// package 생략되어 있음
				// package class Sungjuk
				// 클래스명의 첫글자는 대문자로 한다
	
	// 멤버변수 field
	public String name;		// 클래스 외부에서 접근 가능하다
	int kor, eng, mat;		// package 생략되어있다
	private int aver;		// Sungjuk 클래스 내부에서만 접근 가능하다
	// 멤버 변수에도 Access Modifier을 붙일 수 있다
	// 클래스 내부에서는 상관없이 모두 접근이 가능하기에 외부에서 이 클래스를 접근할 때의 범위를 표현하고 있다
	
	
	// 멤버함수 Method
	private void view() {} // view() end
	
	void calc() {		// package 생략되어 있음
						// 클래스 내부의 멤버들 간에는 Access Modifier와 상관 없이 접근 가능하다
		view();
		aver = (kor+eng+mat)/3;
	} // calc() end
	
	
	public void disp() {
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
	}  // disp() end
	
	
} // class end




//////////////////////////////////////////////////////////
public class Test01_class {

	public static void main(String[] args) {
		// 클래스와 객체 (Object)
		// 클래스명의 첫글자는 대문자로 한다
		// -> 구성멤버 : 멤버변수 field, 멤버함수 method()
		
		System.out.println(Math.PI); 		// 멤버변수
		System.out.println(Math.abs(-3)); 	// 멤버함수
		
		// new 연산자
		// -> 클래스를 사용하려면 메모리를 할당하고 사용한다
		// -> 형식) new 클래스명()
		// -> 객체(Object)
		
		// 객체 지향 프로그램 (Object Oriented Program)
		
		// 기본 자료형
		// int a = 3;		// int는 메모리 4바이트 할당
		
		// 참조 자료형 (reference) 어딘가를 참조한다 -> 클래스
		// RAM(Random Access Memory)의 heap 영역에 메모리가 할당되고 주소값이 발생된다 (휘발성 메모리. 컴퓨터 끄면 사라짐)
		new Sungjuk();		// 객체(Object)
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		
		// sj 참조 변수 (reference) : 메모리가 할당된 곳의 주소를 기억한다
		Sungjuk sj = new Sungjuk(); // 예) 50번지
		
		// . 연산자
		// -> 참조변수를 통해 객체에 접근하는 연산자
		sj.name = "";
		sj.kor = 100;
		sj.eng = 95;
		sj.mat = 90;
		// sj.aver 에러. private 속성은 클래스 외부에서 접근 불가능
		
		sj.calc();
		sj.disp();
		// sj.view(); 에러. private 속성은 클래스 외부에서 접근 불가능
		
		System.out.println();
		Sungjuk one = new Sungjuk();
		one.name = "박지성";
		one.kor = 20;
		one.eng = 30;
		one.mat = 35;
		one.calc();
		one.disp();
		
		System.out.println();
		Sungjuk two = new Sungjuk();
		two.name = "김연아";
		two.kor = 100;
		two.eng = 95;
		two.mat = 90;
		two.calc();
		two.disp();
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		
		// 참조 변수가 가지고 있는 객체의 주소값
		System.out.println(one.hashCode()); 
		System.out.println(two.hashCode()); 
		
		
		int a = 3;
		int b = a;
		
		Sungjuk tmp = two;
		System.out.println(tmp.hashCode());
		
		tmp.disp();
		
	} // main() end
} // class end
