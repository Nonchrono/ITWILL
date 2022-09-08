package oop0906;

public class Test05_quiz {

	public static void main(String[] args) {
		// 연습문제
		
		//문1)알파벳을 아래와 같이 한줄에 5개씩 출력하시오
        /*
           ABCDE
           FGHIJ
           KLMNO
           PQRST
           UVWXY
           Z
        */
		
		// 나는 못 풀고 강사님 풀이
		int count = 0;
		for (char ch = 'A'; ch <= 'Z'; ch++) {
			count++;
			System.out.print(ch);
			
			if (count % 5 == 0) {
				System.out.println();
			} // if end
		} // for end
		
		
		// 경환형 풀이
		 for(int a='A'; a <= 'Z'; a++) {
	         if(a%10==9 || a%10==4) {
	            System.out.print((char)a);
	            System.out.println();
	         } else {
	            System.out.print((char)a);
	         } // if end
	      } // for end
		
		
		
		/////////////////////////////////////////////////////////////////
		
		//문2)아래와 같이 출력하시오
        /*
           ####
            ###
             ##
              #
        */
		
		System.out.println();
		for (int i = 0; i < 4; i++) {
			for (int k = 0; k < i; k++) {
				System.out.print(" ");
			}
			
			for (int j = 4; j > i; j--) {
				System.out.print("#");
			}
				System.out.println();
		}
		
		System.out.println();
		for (int a = 1; a <= 4; a++) {
			for (int b = 1; b <=4; b++) {
				if(a <= b) {
					System.out.print("#");
				} else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}
		
		
		// 샵, 공백, 줄바꿈
		/////////////////////////////////////////////////////////////////
			
		
		/* 문3)다음 식의 결과값을 구하시오
        1   2   3   4   5      99
        ─ - ─ + ─ - ─ + ─ ...  ──   = ?
        2   3   4   5   6      100
		*/
		
		double result = 0.0;
		
		for (int i = 1; i <= 99; i++) {
				if (i % 2 == 0) {
					result = result - ((double)i / ((double)i+1.0));
				} else {
					result = result + ((double)i / ((double)i+1.0));
				}
		}
		System.out.println(result);
		
		
		
		// 강사님 풀이
		double hap = 0.0;
		boolean flag = false;
		for (int a = 1; a <= 99; a++) {
			if (flag) {
				hap = hap - ((double)a/(a+1));
				flag = false;
			} else {
				hap = hap + ((double)a/(a+1));
				flag = true;
			} // if end
		} // for end
		System.out.println(hap); // 0.688172
			
			
		/////////////////////////////////////////////////////////////////
			
			
		
		//문4)아래와 같이 계산해서 출력하시오
        /*    
           1+....+10=55
           11+....+20=155
           21+....+30=255

           81+....+90=
           91+....+100=955   
        */
		
		int sum = 0;
		
		for (int end = 10; end <= 100; end = end+10) {
			for (int start = end-9; start <= end; start++) {
				sum += start;
				}
			System.out.println((end-9)+"+...+"+end+"="+sum);
			sum = 0;
		}
		
		
		/////////////////////////////////////////////////////////////////	
		
		
		//문5)어느 달팽이는 낮에는 3cm올라가고, 밤에는 2.5cm 내려온다고 할때
        //   달팽이가 13cm의 나무 꼭대기에 올라가려면 며칠이 걸리는지 구하시오
		
		int day = 0;
		double degree = 0.0;
		
		while (true) {
			if (degree < 13.0) {
				degree = degree + 3;
				day++;
			} else {
				break;
			}
			if (degree < 13.0) {
				degree = degree - 2.5;
			}
		}
		System.out.println(day);
		
		
		int day2 = 0;
		double snail = 0.0;
		
		while (true) {
			day2++;
			snail = snail + 3.0;
			if(snail >= 13.0) {
				break;
			} else {
				snail = snail - 2.5;
			} // if end
		} // while end
		System.out.println(day2);
		
		
		
		// break 이용하면 좋을 듯? 
		/////////////////////////////////////////////////////////////////
		
		
	} // main() end
} // class end
