package com.bookmark.bookmark.bbs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BbsCont {

    public BbsCont() {
        System.out.println("-----BbsCont 객체 생성 성공...");
    } // end

    @RequestMapping(value = "/bbs/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
         ModelAndView mav = new ModelAndView();

         return mav;
    }

} // class end
