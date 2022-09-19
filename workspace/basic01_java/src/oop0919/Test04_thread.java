package oop0919;

class MyThread3 implements Runnable {
	private int num;
	private String name;
	
	public MyThread3() {}
	public MyThread3(int num, String name) {
		this.num = num;
		this.name = name;
	} // end
	
	// start() 함수는 run() 함수를 호출하는 기능
	
	@Override
	public void run() {	// 비지니스 로직 구현
		for(int a = 0; a < num; a++) {
			System.out.println(name+":"+a);
		} // for end
	} // run() end
} // class end



public class Test04_thread {

	public static void main(String[] args) {
		// 3) Runnable 인터페이스를 이용해서 쓰레드를 구현한 경우
		
		/*
			interface Runnable {}
			class Thread implements Runnable {}
		*/
		
		Thread t1 = new Thread(new MyThread3(1000, "*"));
		Thread t2 = new Thread(new MyThread3(1000, "**"));
		Thread t3 = new Thread(new MyThread3(1000, "***"));
		
		t1.start();
		t2.start();
		t3.start();
		
	}

}
