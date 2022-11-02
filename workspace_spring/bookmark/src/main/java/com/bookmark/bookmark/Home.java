package com.bookmark.bookmark;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Home {

    public Home() {
        System.out.println("-----Hello 객체 생성 성공...");
    } // end

    @RequestMapping(value = "/index.do", method = RequestMethod.GET)
    public String index() {
        return "index";
    } // end

} // class end
