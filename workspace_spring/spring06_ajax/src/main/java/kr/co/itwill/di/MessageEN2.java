package kr.co.itwill.di;

import javax.swing.*;

public class MessageEN2 implements IHello {

    public MessageEN2() {
        System.out.println("-----MessageEN2() 객체 생성");
    }

    @Override
    public void sayHello(String name) {
        JOptionPane.showMessageDialog(null, name + ", Hello!");
    }

} // class end
