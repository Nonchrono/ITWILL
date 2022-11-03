package kr.co.itwill.mediagroup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;

@Controller
public class MediagroupCont {

    @Autowired
    private MediagroupDAO dao;


    public MediagroupCont() {
        System.out.println("-----MediagroupCont() 객체 생성됨");
    } // end
    
    // 미디어그룹 쓰기 페이지 호출
    // http://localhost:9095/mediagroup/create.do
    @RequestMapping(value = "/mediagroup/create.do", method = RequestMethod.GET)
    public String createForm() {
        return "mediagroup/createForm";
    } // createForm() end

    @RequestMapping(value = "mediagroup/create.do", method = RequestMethod.POST)
    public ModelAndView createProc(@ModelAttribute MediagroupDTO dto) {
        ModelAndView mav = new ModelAndView();

        int cnt = dao.create(dto);
        if(cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String msg1 = "<p>미디어 그룹 등록 실패</p>";
            String img = "<img src='../images/fail.png' style='width:100px;'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            mav.setViewName("redirect:/mediagroup/list.do");
        } // if end

        return mav;
    } // createProc() end

    @RequestMapping("mediagroup/list.do")
    public ModelAndView list(HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mediagroup/list");

        int totalRowCount = dao.totalRowCount(); // 총 글갯수

        // 페이징 파트
        int numPerPage = 5; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 10; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        // 현재 페이지 번호 (정수형)
        int currentPage = Integer.parseInt(pageNum);
        // 페이지의 첫번째 글 번호 ((현재 페이지-1)*한페이지당 글수+1)
        int startRow = (currentPage - 1) * numPerPage + 1;
        // 페이지의 마지막 글 번호 (현재 페이지*한페이지당 글 수)
        int endRow = currentPage * numPerPage;
        // 현재 2페이지라면 시작 번호는 6, 끝 번호는 10
        
        // 총 페이지 수 (총 글 갯수 / 한페이지당 글 수)
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);

        // (현재 페이지 번호 / 페이징 목록의 페이지 수)
        double d_page = (double) currentPage / pagePerBlock;
        // 묶음 페이지 번호 : 페이징 목록의 페이지 수를 한번에 묶음 (1~10은 0, 11~20은 1)
        int Pages = (int)Math.ceil(d_page)-1;
        // 시작 페이지 번호 (묶음 페이지 번호 * 블럭당 페이지 수) 1, 11, 21, 31 ...
        int startPage = Pages * pagePerBlock+1;
        // 끝 페이지 번호 (시작 페이지 번호 + 블럭당 페이지 수) 10, 20, 30, 40 ...
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
            list = dao.list2(startRow, endRow);
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end

        mav.addObject("pageNum", currentPage);
        mav.addObject("list", list);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        return mav;
    } // list() end

    @RequestMapping(value = "mediagroup/delete.do", method = RequestMethod.GET)
    public ModelAndView deleteForm(int mediagroupno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mediagroup/deleteForm"); /* 진짜 지울지 확인하는 과정을 거치려고 한다 */
        mav.addObject("mediagroupno", mediagroupno); /* 필요한 것들은 전부 request에 올리면 된다 */
        return mav;
    } // deleteForm() end

    @RequestMapping(value = "mediagroup/delete.do", method = RequestMethod.POST)
    public ModelAndView deleteProc(int mediagroupno) {
        ModelAndView mav = new ModelAndView();

        int cnt = dao.delete(mediagroupno);
        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
            mav.addObject("msg1", "<p>미디어 그룹 삭제 실패</p>");
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            mav.setViewName("redirect:/mediagroup/list.do");
        } // if end
        return mav;
    } // deleteProc() end

    @RequestMapping(value = "mediagroup/update.do", method = RequestMethod.GET)
    public ModelAndView updateForm(int mediagroupno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mediagroup/updateForm");
        // mav.addObject("root", Utility.getRoot());
        mav.addObject("dto", dao.read(mediagroupno));
        return mav;
    } // updateForm() end

    @RequestMapping(value = "mediagroup/update.do", method = RequestMethod.POST)
    public ModelAndView updateProc(@ModelAttribute MediagroupDTO dto) {
        ModelAndView mav = new ModelAndView();

        int cnt = dao.update(dto);
        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
            mav.addObject("msg1", "<p>미디어 그룹 수정 실패</p>");
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            mav.setViewName("redirect:/mediagroup/list.do");
        } // if end

        return mav;
    } // updateProc() end

} // class end
