package kr.co.itwill.di;

public class MessageKO1 implements IHello {

    public MessageKO1() {
        System.out.println("-----MessageKO1() 객체 생성됨");
    }

    @Override
    public void sayHello(String name) {
        System.out.println(name + "님, 안녕하세요!");
    } // end

} // class end
