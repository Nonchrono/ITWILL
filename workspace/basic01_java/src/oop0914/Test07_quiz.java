package oop0914;

public class Test07_quiz {

	public static void main(String[] args) {

		// 연습문제
		//문1)주민번호의 각 숫자의 합을 구하시오 (Character클래스와 charAt()함수 활용)
        //   8+9+1+2+3+0+1+2+3+4+5+6+7
		String jumin = "8912301234567";
		int sum = 0;
		
		for (int i = 0; i < jumin.length(); i++) {
			sum += Character.getNumericValue(jumin.charAt(i));
			System.out.println(sum);
		}
		System.out.println(sum);
		
		
		//문2)대소문자를 서로 바꿔서 출력하시오 (Character클래스와 charAt()함수 활용)
        //   gONE wITH tHE wIND
        String str="Gone With The Wind";
        
        for (int i = 0; i < str.length(); i++) {
        	
        	char str2 = str.charAt(i);
        	
        	if (str2 >= 'a' && str2 <= 'z') {
        		str2 = Character.toUpperCase(str2);
        	} else if (str2 >= 'A' && str2 <= 'Z') {
        		str2 = Character.toLowerCase(str2);
        	}
        	System.out.print(str2);
        }
		
	} // main() end
} // class end
