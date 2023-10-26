package com.dapao.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dapao.domain.EntVO;
import com.dapao.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService aService;
	
	//http://localhost:8088/admin/AllOwnerInfo
	@RequestMapping("/AllOwnerInfo")
	public String getAllOwnerGET(Model model){
		logger.debug("getAllOwnerGET() 호출");
		
		List<EntVO> vo = aService.allOwnerInfo();
		
		model.addAttribute("vo", vo);
		
		return "/admin/allOwnerInfo";
	}
	

}
