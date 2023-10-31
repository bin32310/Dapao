package com.dapao.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;
import com.dapao.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService aService;
	
	// http://localhost:8088/admin/userList
		// 모든회원정보출력
		@RequestMapping(value ="/userList", method = RequestMethod.GET)
		public void allUserGET(Model model) throws Exception {
			logger.debug("모든 회원정보 조회 Service호출");
			model.addAttribute("userList", aService.getAllUser());
			logger.debug("userList 페이지 이동");
			
		}
		
	// 회원개인정보출력
   @RequestMapping(value="/userInfo",method = RequestMethod.GET)
   @ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
   public UserVO userInfo(@RequestParam("us_id") String us_id) throws Exception{
      
      // 전달정보저장 - userid
      logger.debug("us_id : "+us_id);
      
      logger.debug("개인회원정보@@@@@@@@@@@@@@ : "+aService.userInfo(us_id));
      
      // 개인정보출력
      return aService.userInfo(us_id);
   }
	
	//http://localhost:8088/admin/ownerList
	// 사업자 리스트 출력	
	@RequestMapping("/ownerList")
	public void ownerListGET(Model model) throws Exception{
		logger.debug("ownerListGET() 호출");
		
		model.addAttribute("vo", aService.ownerList());
	}
	
	// 사업자 1명의 정보 출력
	@RequestMapping("/ownerInfo")
	@ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
	public EntVO ownerInfoGET(@RequestParam("own_id") String own_id) throws Exception{
		logger.debug("ownerInfoGET() 호출");
		return aService.ownerInfo(own_id);
	}
	
	//사업자 탈퇴
	@RequestMapping("/ownerInfoDelete")
	public void ownerInfoDeleteGET(String own_id) throws Exception{
		logger.debug("ownerInfoDeleteGET() 호출");
		aService.ownerInfoDelete(own_id);
	}
	
	//http://localhost:8088/admin/FAQList
	// FAQ 리스트
	@RequestMapping("/FAQList")
	public void FAQList(Model model) throws Exception{
		logger.debug("FAQList() 호출");
		model.addAttribute("vo", aService.FAQList());
	}
	
	//FAQ 1개정보
	@RequestMapping("/FAQInfo")
	@ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
	public CsVO FAQInfo(@RequestParam("cs_no") Integer cs_no) throws Exception{
		logger.debug("FAQInfo() 호출"+cs_no);
		logger.debug("cs_no@@"+cs_no);
		return aService.FAQInfo(cs_no);
	}
	
	//FAQ 글쓰기
	@RequestMapping("/FAQWrite")
	public void FAQWrite() throws Exception{
		logger.debug("FAQWrite() 호출");
		aService.FAQWrite();
	}
	
	//FAQ 수정하기
	@RequestMapping("/FAQInfoUpdate")
	@ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
	public int FAQInfoUpdate(CsVO vo) throws Exception{
		logger.debug("FAQInfoUpdate() 호출");
		logger.debug("vo@@" + vo);
		return aService.FAQInfoUpdate(vo);
	}

}
