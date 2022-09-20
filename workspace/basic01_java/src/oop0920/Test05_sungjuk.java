package oop0920;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Test05_sungjuk {

	public static void main(String[] args) {
		// 문제) 성적 프로그램
		// 성적 입력 자료(sungjuk.txt)를 가져와서 성적 결과 파일 완성하기 (result.txt)
		
		/*
		
			1) 입력 데이터 파일 : sungjuk.txt
		
			2) 결과 파일 : result.txt
		
			  										성 / 적 / 결 /과
              -------------------------------------------------------
              이름     국어   영어  수학   평균  등수   결과
              -------------------------------------------------------
			  라일락    100  100  100   100   1    합격 ********** 장학생
              진달래     50   55   60    55   4    불합격 *****
              개나리     95   95   35    75   3    재시험 *******
			  무궁화     80   85   90    85   2    합격 ********
              홍길동     60   40   30    43   5    불합격 ****
              ------------------------------------------------------
		
		*/
		
		// 파일 경로
		String inName = "D:/java202207/sungjuk.txt";
		String outName = "D:/java202207/result.txt";

		// 파일 가져오기
		FileReader fr = null;
		BufferedReader br = null;
		
		// 파일 출력(생성)하기
		FileWriter fw = null;
		PrintWriter out = null;
		
	    
	    
		
		try {
		
			
			// 1) 파일 가져오기
			fr = new FileReader(inName);
			
			// 2) 파일 내용 읽기 (BufferedReader에 옮겨닮기)
			br = new BufferedReader(fr);
			
			// 각각의 배열
			String[] name = new String[5];
			int[] kor = new int[5];
			int[] eng = new int[5]; 
			int[] mat = new int[5];
			int[] aver = new int[5];
			String[] pass = {"","","","",""};
			String[] star = {"","","","",""};
			String[] top = {"","","","",""};
			int[] rank = {1, 1, 1, 1, 1};
			int size = aver.length;           
			
			
			// 값 받아오기
			for (int i = 0; i < aver.length; i++) {
				String[] str = br.readLine().split(",");
				
				name[i] = str[0];
				kor[i] = Integer.parseInt(str[1]);
				eng[i] = Integer.parseInt(str[2]);
				mat[i] = Integer.parseInt(str[3]);
				aver[i] = (kor[i] + eng[i] + mat[i]) / 3;
			}
			
			
			// 평균 구하기
			for (int i =0; i < size; i++) {
				aver[i] = (kor[i] + eng[i] + mat[i]) / 3;
			}
			
			
			// 등수 구하기
		    for (int i = 0; i < size; i++) {
		         for (int j = 0; j < size; j++) {
		             if (aver[j] > aver[i]) {
		                 rank[i] = rank[i] + 1;
		             } // if end
		         } // for end
		     } // for end 
		    
		    
		    // 과락 (합격, 재시험, 불합격)
		    for (int i = 0; i < size; i++) {
		        if (aver[i] >= 70) {
		            if (kor[i] < 40 || eng[i] < 40 || mat[i] < 40) {
		                pass[i] += "재시험";
		            } else {
		                pass[i] += "합격";
		            } // if end
		        } else {
		            	pass[i] += "불합격";
		        } // if end
		    } // for end
			
		    //  평균 10점당 * 한개씩
		    for (int i = 0; i < size; i++) {
		        for (int j = 1; j <= (int)(aver[i]/10); j++) {
		            star[i] += "*";
		        } // if end
		    }
		    
	        // 평균 95점 이상이면 장학생
		    for (int i = 0; i < size; i++) {
		        if(aver[i] >= 95) {
		            top[i] += "장학생";
		        }
		    }
			

			// true : append 모드
			// false : overwrite 모드
			fw = new FileWriter(outName, false);
			
			// autoFlush : true 버퍼 클리어
			out = new PrintWriter(fw, true);
		    
			out.printf("\t\t\t%s\n", "성 / 적 / 결 / 과");
			out.println("---------------------------------------------------------------------------------------------------------------------");
			out.printf("%s\t\t%s\t\t%s\t\t%s\t\t%s\t\t%s\t\t%s\n","이름", "국어", "영어", "수학", "평균", "등수", "결과");
			out.println("----------------------------------------------------------------------------------------------------------------------");
		    for (int i = 0; i < size; i++) {
		    	out.printf("%s\t%d\t\t%d\t\t%d\t\t%d\t\t%d\t\t%s\t\t%s\t%s\n", name[i], kor[i], eng[i], mat[i], aver[i], rank[i], pass[i], star[i], top[i]);
		    }
		    
		} catch(Exception e) {
			System.out.println("성적 프로그램 읽고, 쓰기 실패 : "+e);
		} finally {
			// 자원 반납 순서 주의 (작은 단위부터)
			try {
				if (br != null) { br.close(); }
			} catch (Exception e) {}
			
			try {
				if (fr != null) { fr.close(); }
			} catch (Exception e) {}
			
			try {
				if (out != null) { fr.close(); }
			} catch (Exception e) {}
			
			try {
				if (fw != null) { fr.close(); }
			} catch (Exception e) {}
		} // end
		
		
		
		
	} // main() end

} // class end
