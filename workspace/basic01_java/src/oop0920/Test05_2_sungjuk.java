package oop0920;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Test05_2_sungjuk {

	public static void main(String[] args) {

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
			
			// 1) 단계 : 데이터 저장 변수 선언
			String[] name = new String[5];
			int[] kor = new int[5];
			int[] eng = new int[5];
			int[] mat = new int[5];
			int[] aver = new int[5];
			int[] rank = {1, 1, 1, 1, 1};
			
			int size = name.length; // 5
			int i = 0;
			
			
			// 2) 단계 : 데이터 입력 파일(sungjuk.txt) 가져와서 내용을 읽기
			fr = new FileReader(inName);
			br = new BufferedReader(fr);
			
			while(true) {
				String line = br.readLine(); // "무궁화, 95, 90, 100"
				if (line == null) {	
					break;
				} // if end
				// System.out.println(line);
				
				// , 를 기준으로 문자열 분리한 후 1) 단계에서 선언한 변수에 저장하기
				String[] word = line.split(",");
				name[i] = word[0].trim();
				kor[i] = Integer.parseInt(word[1].trim());
				eng[i] = Integer.parseInt(word[2].trim());
				mat[i] = Integer.parseInt(word[3].trim());
				i++; // 다음 사람
			} // while end
			
			// 3) 단계 : 평균 구하기 
			for (i = 0; i < size; i++) {
				aver[i] = (kor[i] + eng[i] + mat[i]) / 3;
			}
			
			// 4) 단계 : 등수 구하기 (평균을 기준으로)
			for (i = 0; i < size; i++) {
		         for (int j = 0; j < size; j++) {
		             if (aver[j] > aver[i]) {
		                 rank[i] = rank[i] + 1;
		             } // if end
		         } // for end
		     } // for end 
			
			
			// 5) 단계 : result.txt 결과 출력하기
			fw = new FileWriter(outName, false);
			out = new PrintWriter(fw, true);
			
			out.println("성/적/결/과");
			out.println("────────────────────────────────────────────────────────────");
			out.println("이름     국어     영어     수학     평균     등수     결과");
			out.println("────────────────────────────────────────────────────────────");
			
			
			//5명의 데이터 출력하기
	         for(i=0; i<size; i++) {
	            out.printf("%-6s %5d %5d %5d %5d %5d", name[i], kor[i], eng[i], mat[i], aver[i], rank[i]);
	            
	            //과락
	            if(aver[i]>=70) {
	               if(kor[i] < 40 || eng[i] < 40 || mat[i] < 40) {
	                  out.printf("%-10s", "재시험");
	               }else {
	                  out.printf("%-10s", "합 격");
	               }//if end
	            }else {
	               out.printf("%-10s", "불합격");
	            }//if end
	            
	            //평균 10점당 * 한 개씩
	            for(int star=1; star<=aver[i]/10; star++) {
	               out.printf("%c", '*');
	            }//for end
	            
	            //평균 95점 이상 장학생
	            if(aver[i]>=95) {
	               out.printf("%-12s", "장학생");
	            }//if end            
	            
	            out.println();   //한사람 출력하고 줄바꿈
	         }//for end
			
			
			
			
			
			
			
			
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
		
	}

}
