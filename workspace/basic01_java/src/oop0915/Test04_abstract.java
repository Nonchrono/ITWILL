package oop0915;

abstract class Animal {   // 추상 클래스 (추상 메소드가 하나라도 있으니!)
	String name;
	void view() {} 		  // 일반 메소드
	abstract void disp(); // 추상 메소드(미완성)
	
}

// 추상 클래스는 부모 역할만 주로 한다
// 추상 클래스를 상속 받은 자식 클래스는 반드시 추상 메소드를 완성해야한다(override)
class Elephant extends Animal {
	@Override
	void disp() {
		System.out.println("점보");
	}
}

class Tuna extends Animal {
	@Override
	void disp() { 
		System.out.println("니모");
	}
} // class end



public class Test04_abstract {

	public static void main(String[] args) {
		// 추상 클래스 Abstract class
		/*
			● 추상 클래스
			  - 미완성 클래스
			  - 객체를 생성할 수 없다
			  - new 연산자를 직접 사용할 수 없다
			  - 추상 메소드가 1개라도 있으면 추상 클래스
			  - 일반 메소드와 추상 메소드가 같이 선언 가능하다
		
			● 추상 메소드
			  - 미완성 메소드
			  - 형식) 리턴형 함수형();
			  - 메소드의 body {}가 없는 함수
			  - 메소드를 선언만 해놓음
			  
			● 인터페이스 : 추상 메소드에만 선언 가능하다
		*/
		//////////////////////////////////////////////////////////
		
		
		
		// 추상 클래스는 new 연산자로 직접 객체 생성할 수 없다
		// Animal ani = new Animal();
		
		
		Elephant jumbo = new Elephant();
		jumbo.disp();
		
		Tuna nemo = new Tuna();
		nemo.disp();
		
		
		// 다형성
		Animal animal = new Elephant(); // 자식이 부모에 대입이 되면 부모는 자식의 형태로 바꾼다
		animal.disp();
		
		animal = new Tuna();
		animal.disp();
		
		
	}

}
