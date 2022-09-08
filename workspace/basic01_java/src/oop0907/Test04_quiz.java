package oop0907;

public class Test04_quiz {
	
	
	public static double sd (int[] a) {
		

		double sum = 0;
		double aver2 = 0;
		
		// 배열의 값 합계 구하기
		for (int i = 0; i < a.length; i++) {
			sum += a[i];
		}
		
		aver2 = (sum / a.length);
		
		// 평균과 aver의 각 요소를 빼기
		
		double[] a2 = new double[a.length];
		
		for (int i = 0; i < a.length; i++) {
			a2[i] = a[i] - aver2;
			a2[i] = Math.abs(a2[i]);
		}
		
		double result = 0;
		for (int i = 0; i < a.length; i++) {
			result += a2[i];
		}
		result = result / a2.length;
		return result;
	}
	
	public static void main(String[] args) {
		// 문제) 표준편차(Standard deviation) 구하기
		
		/*
		 * 빅데이터
		 * 저장, 수입 		- 크롤링, 데이터베이스
		 * 분석, 예측		- 통계 (회귀분석, 상관분석)	R
		 * 비지니스 모델
		 */
		
		int[] aver= {85, 90, 93, 86, 82};
		
		/*
			1) aver의 평균(87.2)를 구하고 aver의 각 요소에서 87.2를 뺀다. 
			   85 - 87.2 = -2.2
			   90 - 87.2 = 2.8
			   93 - 87.2 = 5.8
			   86 - 87.2 = -1.2
			   82 - 87.2 = -5.2
			   
			   
			2) 1)의 값을 전부 양수로 바꾼다 -> 편차 (abs 사용하면 편할 듯)
			   2.2
			   2.8
			   5.8
			   1.2
			   5.2
			   
			3) 2)의 편차들의 평균값 : 표준편차
			   (2.2 + 2.8 + 5.8 + 1.2 + 5.2) / 5 -> 3.44
 		*/
		
		
		
		double result = sd(aver);
		System.out.printf("표준편차 : %.2f", result);
		
		
	} // main() end
} // class end
