package com.dapao.controller;

import java.io.PrintWriter;
import java.security.Provider.Service;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dapao.domain.ItemVO;
import com.dapao.domain.UserVO;
import com.dapao.service.UserServiceImpl;
import com.mysql.cj.Session;

/**
 *    1. 공통URI (~.me 대신 폴더명) / 각 기능별 URI 설정
 *  2. 각 URI별 호출방식을 결정(GET/POST)
 *     GET : 정보 조회 / 정보 입력(view)
 *     POST : 정보 처리(DB)
 *  3. 처리결과와 리다이렉트 페이지 결정
 *  4. 예외처리
 *  
 * 
 * */

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
   
      private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
      
      
      @Inject
      private UserServiceImpl uService;
      
      //http://localhost:8088/user/userMain
      
      //http://localhost:8088/mypage/userInfo
      
   
      
  
   
         
      //http://localhost:8088/mypage/userInfo
      // 회원정보조회
      // 세션에서 아이디 정보 가져옴
      @RequestMapping(value = "/userInfo",method = RequestMethod.GET)
      public String infoGET(HttpSession session, Model model)throws Exception {
         logger.debug(" userInfoGET() 호출 ");
         
         // 사용자의 아이디정보 => 세션에 있는 정보 가져오기  1.infoGET( HttpSession session)
         String us_id = (String) session.getAttribute("us_id"); // 2.
         logger.debug(" us_id : " +us_id);
         
         // 회원정보 조회 
         UserVO resultVO =   uService.userInfo(us_id);
         logger.debug("resultVO"+resultVO);
         model.addAttribute("infoVO", resultVO);
         
         return "/mypage/userInfo";
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
   
         return "/mypage/userInfoUpdate";
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
         
         
         return "redirect:/mypage/userInfo";
      }
      
      
      //회원정보 탈퇴 아이디 패스워드 입력받고 확실한 경우에만 삭제 가능 GET
      @RequestMapping(value = "/userDelete",method=RequestMethod.GET)
      public String userDeleteGET() {
         logger.debug("userDeleteGET() 호출");
         //로그인제어 (생략)
         
         
         
         return "/mypage/userDelete";
      }
      
      
      // 회원정보 탈퇴 POST
      @RequestMapping(value = "/userDelete",method=RequestMethod.POST)
      public String userDeletePOST(UserVO vo, HttpSession session) {
         logger.debug("userDeletePOST() 호출");
         //로그인제어 (생략)
         // 전달정보를 저장하자(아이디, 비밀번호)
         logger.debug("vo : "+vo);
         
         // 서비스 --> DAO 회원정보 탈퇴 메서드
      int result =    uService.userDelete(vo);
         
         // 페이지 이동(결과에 따른 이동)
         if(result == 1) { //삭제성공 --> 로그링ㄴ세션도 같이 제거 해야함
         session.invalidate();
            return "redirect:/user/userMain";
         }
         // 삭제 실패(result == 0)
         return "redirect:/mypage/userDelete";
      }
      
      
      // 1102 추가
      //http://localhost:8088/mypage/userSellList
      // 마이페이지 내 판매글 보기
      @RequestMapping(value = "/userSellList", method = RequestMethod.GET)
      public void getList(HttpSession session, Model model) throws Exception{
		
    		// 세션 아이디 확인
			String us_id = (String)session.getAttribute("us_id");
			logger.debug(" us_id : " +us_id);
			
			  List<ItemVO> resultVO =   uService.userSellList(us_id);
			logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@resultVO"+resultVO);
	
			model.addAttribute("userSellList", resultVO);
    	  
    	  /*
		 * List<ItemVO> userSellList = null; userSellList =
		 * uService.userSellList(us_id); model.addAttribute("userSellList",
		 * userSellList);
		 */
      
      
      }
      
      
      
      
      
}