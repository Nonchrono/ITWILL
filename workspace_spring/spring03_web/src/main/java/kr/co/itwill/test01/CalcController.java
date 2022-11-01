package kr.co.itwill.test01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// URL에서 요청 명령어를 읽어서 실행해주는 클래스. 자동으로 객체를 생성해주는 어노테이션
@Controller
public class CalcController {

	public CalcController() {
		System.out.println("-----CalcController() 객체 생성됨");
	} // end

	// URL에서 요청한 명령어를 등록해서 사용
	// @RequestMapping(value = "", method = GET || POST)
	// servlet 생명주기에서는 service() -> doGet(), doPost()

	// 결과 확인 http://localhost:9095/add.do?no1=3&no2=5
	// /add.do 명령어를 get 방식으로 요청하면
	@RequestMapping(value = "/add.do", method = RequestMethod.GET)
	public ModelAndView add(HttpServletRequest req) {
		// 사용자가 요청한 값이 있다면 가져오기
		int no1 = Integer.parseInt(req.getParameter("no1"));
		int no2 = Integer.parseInt(req.getParameter("no2"));
		int result = no1 + no2;
		
		// view 페이지로 이동하기 위한 클래스
		// -> Model
		// -> ModelAndView
		ModelAndView mav = new ModelAndView();
		// application.properties 환경설정의 prefix와 suffix 참조
		// /WEB-INF/views/calcResult.jsp 뷰 페이지로 이동
		mav.setViewName("calcResult");

		// 공유장소 request 영역에 값 올리기
		req.setAttribute("no1", no1);
		req.setAttribute("no2", no2);
		req.setAttribute("result", result);
		req.setAttribute("message", "<h3>두 수 사이의 합</h3>");
		req.setAttribute("img", "<img src='images/001.png' width='50px';>");
		
		return mav;
	} // add() end
	
	
	
	// 결과확인 http://localhost:9095/sub.do?no1=3&no2=5
	@RequestMapping(value = "/sub.do", method = RequestMethod.GET)
	public ModelAndView sub(HttpServletRequest req) {
		int no1 = Integer.parseInt(req.getParameter("no1"));
		int no2 = Integer.parseInt(req.getParameter("no2"));
		int result = no1 - no2;
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// 공유장소 request 영역에 값 올리기
		req.setAttribute("no1", no1);
		req.setAttribute("no2", no2);
		req.setAttribute("result", result);
		req.setAttribute("message", "<h3>두 수 사이의 차</h3>");
		req.setAttribute("img", "<img src='images/002.png' width='50px';>");
		
		return mav;
	} // sub() end
	
	
	// 결과확인 http://localhost:9095/mul.do?no1=3&no2=5
	@RequestMapping(value = "/mul.do", method = RequestMethod.GET)
	public ModelAndView mul(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		int no1 = Integer.parseInt(req.getParameter("no1"));
		int no2 = Integer.parseInt(req.getParameter("no2"));
		int result = no1 * no2;
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// 공유장소 request 영역에 값 올리기
		req.setAttribute("no1", no1);
		req.setAttribute("no2", no2);
		req.setAttribute("result", result);
		req.setAttribute("message", "<h3>두 수 사이의 곱</h3>");
		req.setAttribute("img", "<img src='images/003.png' width='50px';>");
		
		return mav;
	} // mul() end
	
	// 결과확인 http://localhost:9095/div.do?no1=3&no2=5
	@RequestMapping(value = "/div.do", method = RequestMethod.GET)
	public ModelAndView div(HttpServletRequest req) {
		int no1 = Integer.parseInt(req.getParameter("no1"));
		int no2 = Integer.parseInt(req.getParameter("no2"));
		int result = no1 / no2;
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// 공유장소 request 영역에 값 올리기
		req.setAttribute("no1", no1);
		req.setAttribute("no2", no2);
		req.setAttribute("result", result);
		req.setAttribute("message", "<h3>두 수 사이의 나누셈</h3>");
		req.setAttribute("img", "<img src='images/004.png' width='50px';>");
		
		return mav;
	} // div() end

} // class end
