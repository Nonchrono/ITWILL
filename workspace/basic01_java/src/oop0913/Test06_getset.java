<<<<<<< HEAD
package oop0913;

class BbsDTO { // Data Transfer Object  DTO
	// getter / setter / toString이 들어있는 클래스
	// DTO 클래스가 있다는 전제 하에 Spring이 동작되기 때문에 잘 구현해놔야 오류 안 남

	// 멤버 변수
	private int bbsno;		// 글번호
	private String writer;	// 글작성자
	private String subjec;	// 글제목
	
	public BbsDTO() {}
	
	public int getBbsbsno() {
		return this.bbsno;
	}
	
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	
	public String getWriter() {
		return this.writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getSubject() {
		return this.subjec;
	}
	public void setSubject(String subject) {
		this.subjec = subject;
	}
	
} // class end

public class Test06_getset {

	public static void main(String[] args) {
		// getter와 setter 함수
		/*
			● 함수명 작성 규칙
			  - is함수명()		물어보는 함수. 대부분 boolean 값으로 반환
			  - to함수명()		to 뒤의 값으로 반환
			  - get함수명()		대부분 리턴값이 존재
			  - set함수명()		원하는 값으로 세팅할 때
		*/
		
		
		// getter 함수명을 작성하는 규칙
		// -> get + 멤버 변수의 첫글자를 대문자로 바꾼 후 함수명() // getName()
		
		// setter 함수명을 작성하는 규칙
		// -> set + 멤버 변수의 첫글자를 대문자로 바꾼 후 함수명() // setName()
		
		BbsDTO dto = new BbsDTO();
		
		dto.setBbsno(1);
		dto.setWriter("오필승");
		dto.setSubject("무궁화 꽃이 피었습니다");
		
		System.out.println(dto.getBbsbsno());
		System.out.println(dto.getWriter());
		System.out.println(dto.getSubject());
	} // main() end
} // class end
=======
package oop0913;

class BbsDTO { // Data Transfer Object  DTO
	// getter / setter / toString이 들어있는 클래스
	// DTO 클래스가 있다는 전제 하에 Spring이 동작되기 때문에 잘 구현해놔야 오류 안 남

	// 멤버 변수
	private int bbsno;		// 글번호
	private String writer;	// 글작성자
	private String subjec;	// 글제목
	
	public BbsDTO() {}
	
	public int getBbsbsno() {
		return this.bbsno;
	}
	
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	
	public String getWriter() {
		return this.writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getSubject() {
		return this.subjec;
	}
	public void setSubject(String subject) {
		this.subjec = subject;
	}
	
} // class end

public class Test06_getset {

	public static void main(String[] args) {
		// getter와 setter 함수
		/*
			● 함수명 작성 규칙
			  - is함수명()		물어보는 함수. 대부분 boolean 값으로 반환
			  - to함수명()		to 뒤의 값으로 반환
			  - get함수명()		대부분 리턴값이 존재
			  - set함수명()		원하는 값으로 세팅할 때
		*/
		
		
		// getter 함수명을 작성하는 규칙
		// -> get + 멤버 변수의 첫글자를 대문자로 바꾼 후 함수명() // getName()
		
		// setter 함수명을 작성하는 규칙
		// -> set + 멤버 변수의 첫글자를 대문자로 바꾼 후 함수명() // setName()
		
		BbsDTO dto = new BbsDTO();
		
		dto.setBbsno(1);
		dto.setWriter("오필승");
		dto.setSubject("무궁화 꽃이 피었습니다");
		
		System.out.println(dto.getBbsbsno());
		System.out.println(dto.getWriter());
		System.out.println(dto.getSubject());
	} // main() end
} // class end
>>>>>>> 91a47acfae583ddd205a7a2adab33b2f2d960d9f
