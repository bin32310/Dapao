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

import com.dapao.domain.EntVO;
import com.dapao.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService aService;
	
	// http://localhost:8088/admin/allUserInfo
		// 모든회원정보출력
		@RequestMapping(value ="/allUserInfo", method = RequestMethod.GET)
		public void allUserGET(Model model) throws Exception {
			logger.debug("모든 회원정보 조회 Service호출");
			model.addAttribute("userList", aService.getAllUser());
			logger.debug("allUserInfo 페이지 이동");
			
		}
		
		// 회원개인정보출력
		@RequestMapping(value="/userInfo",method = RequestMethod.GET)
		public String userInfo(@RequestParam("us_id") String us_id, Model model) throws Exception{
			
			// 전달정보저장 - userid
			logger.debug("us_id : "+us_id);
			
			logger.debug("개인회원정보@@@@@@@@@@@@@@ : "+aService.userInfo(us_id));
			
			// 개인정보출력
			model.addAttribute("userInfo", aService.userInfo(us_id));
			return "redirect:/admin/allUserInfo";
		}
	
	//http://localhost:8088/admin/ownerList
	@RequestMapping("/ownerList")
	public void ownerListGET(Model model) throws Exception{
		logger.debug("ownerListGET() 호출");
		
		model.addAttribute("vo", aService.ownerList());
	}
	
//	@RequestMapping("/AllOwnerInfo")
//	public String getAllOwnerPOST(@RequestParam String own_id) {
//		logger.debug("getAllOwnerPOST() 호출");
//		
//		return "";
//		
//	}
	

}
