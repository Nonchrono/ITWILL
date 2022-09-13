package oop0905;

public class Test06_1강선이풀이 {

	public static void main(String[] args) {

		double year=365.2422;
		int total=(int)(year*86400);
		
		int day= total/86400;
		total=total%86400;
		
		int time = total/3600;
		total=total%3600;
		
		int boon = total/60;
		total=total%60;
		
		//int cho = total/1;
		
		System.out.print(day + "일 ");
		System.out.print(time + "시간 ");
		System.out.print(boon + "분 ");
		System.out.print(total+ "초");
		
		
	}

}
