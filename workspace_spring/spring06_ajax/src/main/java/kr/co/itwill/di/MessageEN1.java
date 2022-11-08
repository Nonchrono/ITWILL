package kr.co.itwill.di;

public class MessageEN1 implements IHello{

    public MessageEN1() {
        System.out.println("-----MessageEN1() 객체 생성됨");
    } // end

    @Override
    public void sayHello(String name) {
        System.out.println(name + ", Hello!");
    } // end
} // class end
