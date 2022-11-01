package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// URL에서 요청, 응답이 가능한 클래스 지정. 자동으로 객체 생성됨 (의존성 주입)
@Controller
public class HomeController {

	public HomeController() {
		System.out.println("-----HomeController() 객체 생성됨");
	} // end
	
	// 결과확인 http://localhost:9095/spring03_web/start.jsp
	// 결과확인 http://localhost:9095/home.do
	
	// 요청 명령어 등록하고, 실행의 주체는 메소드(함수)
	@RequestMapping("/home.do")
	public ModelAndView home () { // 명령어와 함수 이름은 같이 가는게 일반적
		ModelAndView mav = new ModelAndView();
		// application.properties 환경설정 참조
		// /WEB-INF/views/start.jsp
		mav.setViewName("start");
		
		// request 영역에 값 올리기
		mav.addObject("message", "어서오세요!");
		mav.addObject("img", "<img src='images/001.png' style='width:50px;'>");
		
		return mav;
	} // home() end
} // class end
