package oop0906;

public class Test07_quiz {

	public static void main(String[] args) {
		// 배열 연습문제
		
		char[] ch = {'I','t','W','i','l','l'};
		int size = ch.length; // 6
		
		//문1)대, 소문자의 갯수를 각각 구하시오
		// 대문자 : 2개
		// 소문자 : 4개
		
		int big = 0;
		int small = 0;
		
		for (int i = 0; i < size; i++) {
			if (ch[i] >= 'A' && ch[i] <= 'Z') {
				big += 1;
			} else if (ch[i] >= 'a' && ch[i] <= 'z') {
				small += 1;
			}
		}
		System.out.println(big);
		System.out.println(small);
		
		
		// 강사님 풀이. 동일히다
		int upper = 0;
		int lower = 0;
		
		for (int i = 0; i < size; i++) {
			if (ch[i] >= 'A' && ch[i] <= 'Z') {upper++;}
			else if (ch[i] >= 'a' && ch[i] <= 'z') {lower++;}
		}
		System.out.printf("대문자 갯수 : %d\n",upper);
		System.out.printf("소문자 갯수 : %d\n",lower);
		
		
		
		//문2)대소문자를 서로 바꿔서 출력하시오
		// iTwILL
		
		for (int i = 0; i < size; i++) {
			if (ch[i] >= 'A' && ch[i] <= 'Z') {
				ch[i] += 32; 
			} else if (ch[i] >= 'a' && ch[i] <= 'z') {
				ch[i] -= 32; 
			}
			System.out.print(ch[i]);
		}
		System.out.println();
		
		for (int i = 0; i < size; i++) {
			if (ch[i] >= 'A' && ch[i] <= 'Z') {
				System.out.printf("%c", ch[i]+32); 
			} else if (ch[i] >= 'a' && ch[i] <= 'z') {
				System.out.printf("%c", ch[i]-32); 
			}
		}
		System.out.println();
		
		
		
		
		//문3)모음의 갯수를 구하시오 (A E I O U a e i o u)
		// 모음의 갯수 : 2개
		
		int moum = 0;
		
		for (int i = 0; i < size; i++) {
			if (ch[i] == 'A' ||
				ch[i] == 'E' ||
				ch[i] == 'I' ||
				ch[i] == 'O' ||
				ch[i] == 'U' ||
				ch[i] == 'a' ||
				ch[i] == 'e' ||
				ch[i] == 'i' ||
				ch[i] == 'o' ||
				ch[i] == 'u') {
				moum +=1;
			}
		}
		System.out.println(moum);
		
		
		
		int mo = 0;
		
		for (int i = 0; i < size; i++) {
			char c = ch[i];
			if (c>= 'A' && c <= 'Z') {		// 대문자인지?
				c=(char)(c+32);				// 소문자로 변경
			} // if end
			
			switch(c) {
				case 'a':
				case 'e':
				case 'i':
				case 'o':
				case 'u': mo++;
			} // switch end
		} // for end
		
		System.out.printf("\n모음의 갯수 : %d\n", mo);
		
		
		///////////////////////////////////////////////////////////////////////////
		
		// 문4) 각 행의 모음의 갯수를 구하시오
		// str[0] 행 : 2개
		// str[1] 행 : 1개
		// str[2] 행 : 2개
		char[][] str = {
						{'Y','e','a','r'}
					   ,{'M','o','n','t','h'}
					   ,{'D','a','t','e'}
		};
		
		int moum2[] = new int[3];
		
		for (int i = 0; i < str.length; i++) {
			for (int j = 0; j < str[i].length; j++) {
				if (ch[j] == 'A' ||
					ch[j] == 'E' ||
					ch[j] == 'I' ||
					ch[j] == 'O' ||
					ch[j] == 'U' ||
					ch[j] == 'a' ||
					ch[j] == 'e' ||
					ch[j] == 'i' ||
					ch[j] == 'o' ||
					ch[j] == 'u') {
					moum2[i] +=1;
				}
			
			}
			System.out.print(moum2[i] + " ");
		}
		
		
		// 강사님 풀이
		int row = str.length; // 3
		int count = 0;
		
		for(int r=0; r < row; r++) {
			int col = str[r].length;
			for (int c = 0; c < col; c++) {
				char w = str[r][c];
				if (w>= 'A' && w <= 'Z') {		// 대문자인지?
					w=(char)(w+32);				// 소문자로 변경
				} // if end
				
				switch(w) {
					case 'a':
					case 'e':
					case 'i':
					case 'o':
					case 'u': count++;
				} // switch end
			} // for end
			System.out.printf("\n str[%d]행 모음의 갯수 : %d개", r, count);
			count = 0;
		} // for end
		
		
		
		
		//문5)대각선 방향의 각 요소의 합을 구하시오
		
		//대각선 ↘ 방향의 합 (4+9+7)		num[0][0] + num[1][1] + num[2][2]
		//대각선 ↙ 방향의 합 (2+9+6)		num[0][2] + num[1][1] + num[2][0]
		
		int[][] num = {
				{4, 3, 2}
			   ,{5, 9, 1}
			   ,{6, 8, 7}
		};
		
		int sum = 0;
		
		for (int i = 0; i < num.length; i++) {
			for (int j = 0; j < num[i].length; j++) {
				if (i == j) {
					sum += num[i][j];
				}
			}
		}
		System.out.println();
		System.out.println(sum);
		
		
		int sum2 = 0;
		
		for (int i = 0; i < num.length; i++) {
			for (int j = (num.length-1); j >= 0; j--) {
				if (i + j == 2) {
					sum2 += num[i][j];
				}
			}
		}
		System.out.println(sum2);
		
		
		
		
		
		// 강사님 풀이
		int hap1 = 0;	// 대각선 ↘
		int hap2 = 0;	// 대각선 ↙
		
		for(int i =0; i < num.length; i++) {
			hap1 = hap1 + num[i][i];
			// hap2 = hap2 + num[i][2-i];
			hap2 = hap2 + num[i][num.length-1-i];
		} // for end
		
		System.out.printf("\n대각선 ↘ 방향의 합 : %d", hap1);
		System.out.printf("\n대각선 ↙ 방향의 합 : %d", hap2);
		
	}
}
