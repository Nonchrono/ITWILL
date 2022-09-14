package oop0914;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Test02_Calendar {

	public static void main(String[] args) {
		// 날짜 관련 클래스 (년월일시분초 요일)
		// GregorianCalendar
		// Calendar
		// Date
		
		GregorianCalendar now = new GregorianCalendar();
		
		System.out.println(now.get(1));		// 년
		System.out.println(now.get(2));		// 월(-1)
		System.out.println(now.get(2)+1);	// 월
		System.out.println(now.get(5));		// 일
		
		System.out.println(now.get(Calendar.YEAR));
		System.out.println(now.get(Calendar.MONTH));
		System.out.println(now.get(Calendar.MONTH)+1);
		System.out.println(now.get(Calendar.DATE));
		
		System.out.println(now.get(Calendar.HOUR));
		System.out.println(now.get(Calendar.MINUTE));
		System.out.println(now.get(Calendar.SECOND));
		
		// 24시간을 기준으로
		System.out.println(now.get(Calendar.HOUR_OF_DAY));	// 현재 기준 10시지만 만약 오후 1시였다면 13으로 나왔을 것
		// 요일 (1일 2월 3화 4수 5목 6금 7토)
		System.out.println(now.get(Calendar.DAY_OF_WEEK));	// 4
		/////////////////////////////////////////////////////////////////
		
		// 날짜 데이터의 연산
		// 날짜 데이터도 연산이 가능하다
		
		// now 날짜에 3년 더하기
		now.add(Calendar.YEAR, 3);
		System.out.println(now.get(Calendar.YEAR));		// 2025
		
		// now 날짜에 5달 빼기
		now.add(Calendar.MONTH, -5);
		System.out.println(now.get(Calendar.MONTH));	// 3
		
		// now 날짜에 7일 더하기
		now.add(Calendar.DATE, 7);
		System.out.println(now.get(Calendar.DATE));		// 21
		//////////////////////////////////////////////////////////////////
		
		
		// 날짜 데이터 구성하기
		// 1997년 2월 28일
		GregorianCalendar myBirth = new GregorianCalendar();
		myBirth.set(Calendar.YEAR, 1997);
		myBirth.set(Calendar.MONTH, Calendar.FEBRUARY);
		myBirth.set(Calendar.DATE, 28);
		
		System.out.println(myBirth.MONTH);
		
		
		
	} // main() end
} // class end
