package kr.co.itwill.media;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MediaCont {

    @Autowired
    private MediaDAO dao;

    public MediaCont() {
        System.out.println("-----MediaCont() 객체 생성됨");
    } // end

    // 목록 조회 명령어
    @RequestMapping("/media/list.do")
    public ModelAndView list(int mediagroupno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("media/list");
        mav.addObject("list", dao.list(mediagroupno));
        mav.addObject("mediagroupno", mediagroupno);

        return mav;
    } // list() end

    // createForm으로 이동하는 명령어
    @RequestMapping(value = "/media/create.do", method = RequestMethod.GET)
    public ModelAndView createForm(int mediagroupno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("media/createForm");
        mav.addObject("mediagroupno", mediagroupno); // 부모글 번호
        return mav;
    } // createForm() end

} // class end
