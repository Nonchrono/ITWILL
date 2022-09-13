package oop0905;

public class Test06_2_강사님풀이 {

	public static void main(String[] args) {

		
		double year = 365.2422;
		int total = (int) (year*86400); // 31556926
		
		int day = total / 86400; // 365
		System.out.println(day + "일");
		
		total = total % 86400;
		int hour = total / 3600;
		System.out.println(hour + "시간");
		
		total = total % 3600;
		int minute = total / 60;
		System.out.println(minute + "시간");
		
		int second = total % 60;
		System.out.println(second + "시간");
		
	} // main() end
} // class end
