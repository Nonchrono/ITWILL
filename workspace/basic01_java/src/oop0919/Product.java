package oop0919;

public class Product extends Object {
					 // extends Object 생략가능
	public int price; // 상품 가격
	public int bonusPoint; // 마일리지
	
	public Product() {} // default constructor
	public Product(int price) {
		this.price = price; // this.멤버면수 = 지역변수
		// 상품가격의 10%를 보너스 점수 책정
		this.bonusPoint = (int)(price * 0.1);

	} // end
} // class end


class SmartTV extends Product {
	public SmartTV() {
		super(100);		// 상품가격 price=100, bonusPoint=10
	}
	
	@Override
	public String toString() {
		return "스마트TV";
	}
} //class end

class Notebook extends Product {
	public Notebook() {
		super(200);		// 상품가격 price=200, bonusPoint=20
	}
	
	@Override
	public String toString() {
		return "노트북";
	}
} //class end

class HandPhone extends Product {
	public HandPhone() {
		super(150);		// 상품가격 price=150, bonusPoint=15
	}
	
	@Override
	public String toString() {
		return "핸드폰";
	}
} //class end




