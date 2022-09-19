package oop0919;

// 상품 구매 관련 클래스
public class Buyer {
	private int myMoney = 1000; // 나의 총 재산
	private int myMileage = 0;	// 나의 마일리지 점수 (bonusPoint 누적)
	private int i = 0;
	// 상품을 구매했을 때 어떤 상품을 구매했는지 저장 (나의 구매상품 목록)
	Product[] item = new Product[10];
	
	
	
	/*
	    				Product
		+------------+-------------+-------------+--
		|  SmartTV   |   Notebook  |  Handphone  |  ~~
		+------------+-------------+-------------+--
			item[0]       item[1]       item[2]     ~~
	*/
	
	public Buyer() {}
	
	/*
	// 메소드 오버로딩 (함수명 중복 정의)
	public void buy(SmartTV a) {} //buy() end
	public void buy(Notebook a) {} //buy() end
	public void buy(HandPhone a) {} //buy() end
	*/
	public void buy(Product p) { // 다형성
								 // Product -> SmartTv, Notebook, HandPhone 클래스의 부모 클래스
		if (this.myMoney < p.price) {
			System.out.println("잔액이 부족합니다.");
			return;
		}
		
		item[i++] = p; // 구매상품 저장
		this.myMoney = this.myMoney - p.price; // 나의 재산은 감소
		this.myMileage = this.myMileage + p.bonusPoint; // 나의 마일리지는 증가
	} // buy() end
	
	public void disp() {
		
		// 문제) 구매 상품 목록과 구매한 상품의 총 합계금액을 구하시오
		//		(item 배열 활용)
		
		/*
		int sum = 0; // 합계
		String buylist = ""; // 구매 상품 목록
		
		for (int i = 0; i < item.length; i++) {
			if (item[i] == null) {
				continue;
			} else {
				// System.out.print(item[i]+" ");
				buylist += item[i].toString()+" ";
				sum += + item[i].price;
			}	
		}*-
		*/
		
		// 구매한 상품 목록
		StringBuilder shoplist = new StringBuilder();
		
		// 사용 금액
		int hap = 0;
		
		for (int n =0; n < item.length; n++) {
			if(item[n] == null) {
				break;
			} // if end
			shoplist.append(item[n].toString()); // 상품명
			hap = hap + item[n].price;
		}// for end
		
		
		System.out.println("구매 상품 목록 : "+shoplist);
		System.out.println("사용금액 : "+hap);
		System.out.println("나의 남은 재산 : "+this.myMoney);
		System.out.println("나의 마일리지 : "+this.myMileage);
		
		
	} // disp() end
}
