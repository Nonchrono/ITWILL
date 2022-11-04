package com.bookmark.bookmark.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BbsCont {

    @Autowired
    private BbsDAO dao;

    public BbsCont() {
        System.out.println("-----BbsCont 객체 생성 성공...");
    } // end

    @RequestMapping(value = "/bbs/list.do", method = RequestMethod.GET)
    public ModelAndView list(HttpServletRequest req) {
         ModelAndView mav = new ModelAndView();
         mav.setViewName("bbs/list");

        // int totalRowCount = dao.totalRowCount(); // 총 글갯수

        List<BbsDTO> list = dao.list();

         return mav;
    } // list() end

} // class end
