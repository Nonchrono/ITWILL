package kr.co.itwill.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberCont {

    @Autowired
    MemberDAO memberDAO;

    public MemberCont() {
        System.out.println("-----MemberCont() 객체 생성됨");
    } // MemberCont() end

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm() {
        return "/product/login";
    } // loginForm() end

} // class end
