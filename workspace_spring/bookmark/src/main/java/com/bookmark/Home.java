package com.bookmark;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Home {

    public Home() {
        System.out.println("-----Hello 객체 생성 성공...");
    } // end

    @RequestMapping(value = "/home.do", method = RequestMethod.GET)
    public String index() {
        return "home";
    } // end

} // class end
