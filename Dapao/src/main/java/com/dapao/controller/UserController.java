package com.dapao.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dapao.domain.UserVO;
import com.dapao.service.UserService;

/**
 * 	1. 공통URI (~.me 대신 폴더명) / 각 기능별 URI 설정
 *  2. 각 URI별 호출방식을 결정(GET/POST)
 *  	GET : 정보 조회 / 정보 입력(view)
 *  	POST : 정보 처리(DB)
 *  3. 처리결과와 리다이렉트 페이지 결정
 *  4. 예외처리
 *  
 * 
 * */

@Controller
@RequestMapping("/user/*")
public class UserController {
	
		private static final Logger logger = LoggerFactory.getLogger(UserController.class);
		
		
		@Inject
		private UserService uService;
		
		//http://localhost:8088/user/userMain
		
		//http://localhost:8088/user/userMain
		// 유저 메인페이지 호출
		@RequestMapping(value = "/userMain",method = RequestMethod.GET)
		public String userMainGET(HttpSession session, Model model) {
			logger.debug(" userMainGET() 호출 ");
			
			// 세션 아이디 확인
			String us_id = (String)session.getAttribute("us_id");
			
			// 찜목록 불러오기
			//if(us_id != null) {
			//	model.addAttribute("loveList", uService.loveList(us_id));
			//}
			
			// 인기가게(광고) 목록 불러오기
			//model.addAttribute("adList", uService.adList());
			
			// 중고거래 목록 불러오기
			//model.addAttribute("itemList", uService.itemList());
			
			return "/user/userMain";
		}
		
		//http://localhost:8088/user/userJoin
		// 회원가입 GET 정보받기
		@RequestMapping(value = "/userJoin",method = RequestMethod.GET)
		public String userJoinGET() {
			logger.debug(" userJoinGET() 호출 ");
			
			logger.debug(" 연결된 view 페이지 호출 (/views/user/userJoin.jsp) ");
			
			//      /폴더명/뷰페이지 이름
			return "/user/userJoin";
		}
		

		// 회원가입 POST user정보 저장
		@RequestMapping(value = "/userJoin",method = RequestMethod.POST)
		public String userJoinPOST(/* @ModelAttribute */ UserVO joinVO) {
			logger.debug(" userJoinPOST() 호출 ");
			// 전달정보 저장(회원가입 정보)
			logger.debug("joinVO "+joinVO);
			logger.debug(" resultVO : "+joinVO);
			// ServiceImpl -> DAOImpl -> DB에 정보 저장
			//mdao.userJoin(joinVO);
			uService.userJoin(joinVO);
			logger.debug(" 회원가입 완료! ");
			
			// 로그인 페이지로 이동(redirect)		
			return "redirect:/user/userLogin";
		}
		
		
		
		
		//http://localhost:8088/user/userLogin
		// 로그인 GET user 정보 받기
		@RequestMapping(value = "/userLogin",method = RequestMethod.GET)
		public String userLoginGET() {
			logger.debug(" userLoginGET()  호출 ");
			logger.debug(" 연결된 뷰페이지로 이동 ");
			
			
			return "/user/userLogin";
		}
	
		//http://localhost:8088/user/userLogin
		// 로그인POST user 정보 저장
		@RequestMapping(value = "/userLogin",method = RequestMethod.POST)
		public String userLoginPOST(UserVO loginVO,HttpSession session) {
			logger.debug(" userLoginPOST()  호출 ");
			logger.debug(" 연결된 뷰페이지로 이동 ");
			// 전달정보 저장
			logger.debug(" loginVO : "+loginVO);
			
			// 서비스 -> DAO 
			UserVO resultVO = uService.userLogin(loginVO);
			logger.debug(" resultVO : "+resultVO);
			
			// 로그인 처리 결과에 따른 페이지 이동
			
			if(resultVO.getUs_state() == 2  ) {
				// 로그인 실패 -> 로그인 페이지로 이동
				return "redirect:/user/userLogin";
				
			}
			
			// 로그인 성공
			// 세션에 로그인 아이디를 저장
			session.setAttribute("us_id", resultVO.getUs_id());
			session.setAttribute("us_state", resultVO.getUs_state());
			return "redirect:/user/userMain";
		}
		
		// 로그아웃 처리
		@RequestMapping(value = "/userLogout",method = { RequestMethod.GET, RequestMethod.POST })
		public String userLogoutGET(HttpSession session) {
			logger.debug(" userLogoutGET() 호출 ");
			
			// 로그아웃 처리 => 세션정보 초기화 
			session.invalidate();
			// 메인페이지로 이동
			
			return "redirect:/user/userMain";
		}
			
			
			
		// 회원정보조회
		// 세션에서 아이디 정보 가져옴
		@RequestMapping(value = "/userInfo",method = RequestMethod.GET)
		public String infoGET(HttpSession session, Model model) {
			logger.debug(" userInfoGET() 호출 ");
			
			// 사용자의 아이디정보 => 세션에 있는 정보 가져오기  1.infoGET( HttpSession session)
			String us_id = (String) session.getAttribute("us_id"); // 2.
			
			
			// 회원정보 조회 
			UserVO resultVO =	uService.userInfo(us_id);

			model.addAttribute("infoVO", resultVO);
			
			return "/user/userInfo";
		}
			
			
		//회원정보 수정 GET방식 =--> update뷰페이지에 기존에 있던 데이터 보여주는것  1. get메서드 만들기 public String updateGET()  + 매핑 
		@RequestMapping(value = "/userUpdate",method = RequestMethod.GET)
		public String updateGET(HttpSession session, Model model) {
			logger.debug(" userUpdateGET() 호출 ");
			
			// 2. 로그인한 회원 아이디 조회
			String us_id = (String) session.getAttribute("us_id");
			// 3. 그걸 바탕으로 서비스 ---> DAO 접근 --> DAO안에 회원정보 조회 동작 호출---> 그 정보를 뷰페이지로 전달하기위해 모델객체사용
			UserVO resultVO =  uService.userInfo(us_id); // --> 다음에 모델객체사용
			model.addAttribute("vo", resultVO);
			
			// model.addAttribute(uService.userInfo(id));
			// => 이름 : userVO (리턴타입의 클래스 첫글자를 소문자로 변경)
	
			return "/user/userUpdate";
		}
			
			
			
			
		// 회원정보 수정 POST 방식
		@RequestMapping(value = "/userUpdate",method = RequestMethod.POST)
		public String userUpdatePOST(UserVO updatevo) {
			logger.debug(" userUpdatePOST() 호출");
			
			// 수정할 정보를 저장(파라메터) public String updatePOST(UserVO vo)
			logger.debug("vo "+updatevo);
			
			//서비스 -> DAO 회원정보 수정
			uService.userupdate(updatevo);
			// 메인페이지로 이동
			
			
			return "redirect:/user/userInfo";
		}
		
		
		//회원정보 탈퇴 아이디 패스워드 입력받고 확실한 경우에만 삭제 가능 GET
		@RequestMapping(value = "/userDelete",method=RequestMethod.GET)
		public String userDeleteGET() {
			logger.debug("userDeleteGET() 호출");
			//로그인제어 (생략)
			
			
			
			return "/user/userDelete";
		}
		
		
		// 회원정보 탈퇴 POST
		@RequestMapping(value = "/userDelete",method=RequestMethod.POST)
		public String userDeletePOST(UserVO vo, HttpSession session) {
			logger.debug("userDeletePOST() 호출");
			//로그인제어 (생략)
			// 전달정보를 저장하자(아이디, 비밀번호)
			logger.debug("vo : "+vo);
			
			// 서비스 --> DAO 회원정보 탈퇴 메서드
		int result = 	uService.userDelete(vo);
			
			// 페이지 이동(결과에 따른 이동)
			if(result == 1) { //삭제성공 --> 로그링ㄴ세션도 같이 제거 해야함
			session.invalidate();
				return "redirect:/user/userMain";
			}
			// 삭제 실패(result == 0)
			return "redirect:/user/userDelete";
		}
		
		
		
}
