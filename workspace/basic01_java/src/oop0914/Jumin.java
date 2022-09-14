package oop0914;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Jumin {
	
	private String juminno; // 주민번호
	
	public Jumin() {}
	public Jumin(String juminno) {
		this.juminno = juminno;
	}
	
	public boolean validate() {
		boolean flag = false;
		// 문) 주민번호가 맞으면 flag 변수 값을 true 대입하시오
		
		int sum = 0;
		int size = juminno.length()-1;
		
		for (int i = 0; i < size; i++) {
			int num = Integer.parseInt(juminno.substring(i, i+1));
			
			if ((i+2) <= 9) { 
				sum = sum + (num*(i+2));
			} else {
				sum = sum + (num*(i-6));
			}
		}
		
		sum = (11 - (sum % 11)) % 10;
		
		if (sum == Integer.parseInt(juminno.substring(12, 13))) {
			flag = true;
		}
		
		return flag;
	} // validate() end
	
	/*
	  public boolean validate() {
      boolean flag = false;
      //문) 주민번호가 맞으면 flag 변수값을 true 대입하시오
      int size = juminno.length();
      int[] arr = new int[size];
      
      for (int i=0; i<size; i++) {
         arr[i] = Integer.parseInt(juminno.substring(i, i+1));         
      }
      
      int[] arr2 = {2,3,4,5,6,7,8,9,2,3,4,5};
      int plus = 0;
      for (int i=0; i<size-1; i++) {
         plus = plus + (arr[i]*arr2[i]);
      }
      
      int rest = plus%11;
      int valno = 11-rest;
      
      if (valno==arr[12]) {
         flag = true;
      }
      
      return flag;
   	   }//validate() end
	*/
	
	
	public void disp() {
		// 생년월일, 성별, 나이, 띠 출력하기
		/*
        생년월일 : 1989년12월30일
        성별 : 남자
        나이 : 32   ->GregorianCalendar클래스 이용
        띠 :       ->태어난년도%12 (0원숭이 1닭 2개 ~~~~ 11양)
		*/
		
		GregorianCalendar now = new GregorianCalendar();
		
		String year = juminno.substring(0, 2);
		String month = juminno.substring(2, 4);
		String date = juminno.substring(4, 6);
		
		String gender = juminno.substring(6, 7);
		
		switch(gender) {
			case "1": year = "19" + year;
					  gender = "남자";
					  break;
			
			case "2": year = "19" + year;
			  		  gender = "여자";
			  		  break;
			
			case "3": year = "20" + year;
			  		  gender = "남자";
			  		  break;
			
			case "4": year = "20" + year;
			  		  gender = "여자";
			  		  break;
		}
		
		int age = (now.get(Calendar.YEAR)) - Integer.parseInt(year);
		int dd = Integer.parseInt(year) % 12;
		String ddi = "";
		
		switch(dd) {
			case 0: ddi = "원숭이"; break; 
			case 1: ddi = "닭"; break; 
			case 2: ddi = "개"; break; 
			case 3: ddi = "돼지"; break; 
			case 4: ddi = "쥐"; break; 
			case 5: ddi = "소"; break; 
			case 6: ddi = "호랑이"; break; 
			case 7: ddi = "토끼"; break; 
			case 8: ddi = "용"; break; 
			case 9: ddi = "뱀"; break; 
			case 10: ddi = "말"; break; 
			case 11: ddi = "양"; break; 
		}
		
		System.out.println("생년월일 : "+year+"년 "+month+"월 "+date+"일");
		System.out.println("성별 : "+gender);
		System.out.println("나이 : "+age);
		System.out.println("띠 : "+ddi);
		
		
	} // disp() end
	
} // class end
