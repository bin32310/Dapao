package com.dapao.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dapao.domain.UserVO;
import com.dapao.service.UserServiceImpl;





/**
 * 1. 공통URI (~.me 대신 폴더명) / 각 기능별 URI 설정 2. 각 URI별 호출방식을 결정(GET/POST) GET : 정보
 * 조회 / 정보 입력(view) POST : 정보 처리(DB) 3. 처리결과와 리다이렉트 페이지 결정 4. 예외처리
 * 
 * 
 */

@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserServiceImpl uService;

	// http://localhost:8088/user/userMain
	// 유저 메인페이지 호출
	@RequestMapping(value = "/userMain", method = RequestMethod.GET)
	public String userMainGET(HttpSession session, Model model) {
		logger.debug(" userMainGET() 호출 ");

		// 세션 아이디 확인
		String us_id = (String) session.getAttribute("us_id");
		logger.debug(" us_id : " + us_id);

		// 찜목록 불러오기
		if (us_id != null) {
			model.addAttribute("loveList", uService.loveList(us_id));
		}

		// 인기가게(광고) 목록 불러오기
		model.addAttribute("adList", uService.adList());

		// 중고거래 목록 불러오기
		model.addAttribute("itemList", uService.itemList());

		// 조회수 증가를 체크 : on - 1 , off - 2
		session.setAttribute("itemView", "on");

		return "/user/userMain";
	}

	// http://localhost:8088/user/userJoin
	// 회원가입 GET 정보받기
	@RequestMapping(value = "/userJoin", method = RequestMethod.GET)
	public void userJoinGET() {
		logger.debug(" userJoinGET() 호출 ");

		logger.debug(" 연결된 view 페이지 호출 (/views/user/userJoin.jsp) ");

	}

	// 회원가입 POST user정보 저장
	@RequestMapping(value = "/userJoin", method = RequestMethod.POST)
	public String userJoinPOST(/* @ModelAttribute */ UserVO joinVO) {
		logger.debug(" userJoinPOST() 호출 ");
		// 전달정보 저장(회원가입 정보)
		logger.debug("joinVO " + joinVO);
		logger.debug(" resultVO : " + joinVO);
		// ServiceImpl -> DAOImpl -> DB에 정보 저장
		// mdao.userJoin(joinVO);
		uService.userJoin(joinVO);
		logger.debug(" 회원가입 완료! ");

		// 로그인 페이지로 이동(redirect)
		return "redirect:/user/userLogin";
	}

	// http://localhost:8088/user/userLogin
	// 로그인 GET user 정보 받기
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET)
	public String userLoginGET() {
		logger.debug(" userLoginGET()  호출 ");
		logger.debug(" 연결된 뷰페이지로 이동 ");

		return "/user/userLogin";
	}

	// http://localhost:8088/user/userLogin
	// 로그인POST user 정보 저장
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLoginPOST(UserVO loginVO, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.debug(" userLoginPOST()  호출 ");
		logger.debug(" 연결된 뷰페이지로 이동 ");
		// 전달정보 저장
		logger.debug(" loginVO : " + loginVO);

		// 서비스 -> DAO
		UserVO resultVO = uService.userLogin(loginVO);
		logger.debug(" @@@@resultVO : " + resultVO);
		logger.debug("!!!!!!!resultVO.getus_id" + resultVO.getUs_id());

//	         if(resultVO==null) {
//				rttr.addFlashAttribute("login","fail");
//				 return "redirect:/user/userLogin";
//			}

		// 로그인 성공
		rttr.addFlashAttribute("login", "success");

		// 세션에 로그인 아이디를 저장
		session.setAttribute("us_id", resultVO.getUs_id());
		session.setAttribute("us_nickname", resultVO.getUs_nickname());
		session.setAttribute("us_state", resultVO.getUs_state());
		session.setAttribute("us_coin", resultVO.getUs_coin());

		return "redirect:/user/userMain";
	}

	// 로그아웃 처리
	@RequestMapping(value = "/userLogout", method = { RequestMethod.GET, RequestMethod.POST })
	public String userLogoutGET(HttpSession session) {
		logger.debug(" userLogoutGET() 호출 ");

		// 로그아웃 처리 => 세션정보 초기화
		session.invalidate();
		// 메인페이지로 이동

		return "redirect:/user/userMain";
	}

	/**
	 * 내용 : 유저 회원 가입 시 조건 컨트롤러 만든 날짜 : 23. 10. 29
	 */

	// http://localhost:8088/user/userJoin
	@RequestMapping(value = "/userJoinCheck", method = RequestMethod.POST)
	public String UserJoinCheck(@RequestParam("us_id") String us_id) {
		if (us_id == "") {
			logger.debug("유저가 빈칸 입니다.");
			return "";
		}

		return "";
	}

	
	// 비밀번호 찾기 (인증번호 발송)
	
	
	
	/*
	 * @RequestMapping(value = "/userFindPwNum", method = RequestMethod.POST) public
	 * ModelAndView userFindPwNum(HttpSession session, HttpServletRequest request,
	 * HttpServletResponse response)throws IOException { ModelAndView modelAndView =
	 * new ModelAndView(); String us_email =
	 * (String)request.getParameter("us_email"); String us_name =
	 * (String)request.getParameter("us_name"); UserVO vo = new UserVO();
	 * vo.setUs_email(us_email); vo.setUs_name(us_name);
	 * 
	 * if(vo != null) { Random r = new Random(); int num = r.nextInt(999999); }
	 * 
	 * if(vo.getUs_name().equals(us_name)) { session.setAttribute("us_email",
	 * vo.getUs_email());
	 * 
	 * String setfrom = "hhong865@naver.com"; String tomail = us_email; String title
	 * = "비밀번호 찾기 인증 이메일 입니다"; String content = System.getProperty("line.separator")
	 * + "안녕하세요 회원님" + System.getProperty("line.separator") + "비밀번호찾기 인증번호는" + num +
	 * "입니다." + System.getProperty("line.separator");
	 * 
	 * 
	 * try { MimeMessage message = MailSender.createMimeMessage(); } } return
	 * modelAndView;
	 * 
	 * }
	 */
	
	//아이디 찾기
	// http://localhost:8088/user/userFindId
		@RequestMapping(value = "/userFindId", method = RequestMethod.GET)
		public void userFindIdGET() {
			logger.debug(" userFindIdGET()  호출 ");
			logger.debug(" 연결된 뷰페이지로 이동 ");

			
		}
		
		
		
		// 아이디 찾기 POST 
	
	  @RequestMapping(value = "/userFindId", method = RequestMethod.POST)
	  public String userFindIdPOST(HttpSession session, UserVO vo, Model model) throws Exception { 
		  logger.debug(" userFindId2POST()  호출 ");
	  logger.debug(" 연결된 뷰페이지로 이동 ");
	  
	  logger.debug("vo@@@@@@@@@@@@@@@@"+vo);
	  
	     String us_info="0";
	     us_info=  uService.userFindId(vo);
	     logger.debug("@@@@@@@@@@@@@@@"+us_info);
	   
	     
	     logger.debug("info@@@@@@@@@@@@@@@@"+us_info);
	  
	    if(us_info == null) {
	    	session.setAttribute("userFindId", "fail");	
		    logger.debug("ddddddddddddddddddd");
	    	
	    }
	    
	    
	    else{
	    	model.addAttribute("us_id",us_info);
	    	session.setAttribute("userFindId", "success");	
	    	logger.debug("!!!!!!!!!!!!!!!!!!!!!!!!!");
	    }
	    return "redirect:/user/userFindId2";
	    
	   
	 
	
	  }
	
	  
	  
	  @RequestMapping(value = "/userFindId2", method = RequestMethod.GET)
	   public void userFindId2(@ModelAttribute("us_id") String us_id, Model model) throws Exception {
		  
		  	
		  	model.addAttribute(us_id);
		  
	    }
		
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

