package com.dapao.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dapao.domain.ExpVO;
import com.dapao.service.ExpServiceImpl;

@Controller
@RequestMapping(value="/exp/*")
public class ExpController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExpController.class);
	
	@Autowired
	private ExpServiceImpl eService;
	
	// 사업자 - 체험단 신청페이지
	// http://localhost:8088/exp/ownExp
	@RequestMapping(value="/ownExp")
	public void ownExp() throws Exception{
		logger.debug("사업자 - 체험단 신청 페이지");
	}
	
	// 사업자 - 체험단 신청 데이터처리
	@RequestMapping(value="ownExpPOST", method = RequestMethod.POST)
	public String ownExpPOST(@ModelAttribute ExpVO vo) throws Exception{
		
		logger.debug("vo : "+vo);
		
		// exp테이블 데이터삽입
		int result = eService.ownExp(vo);
		logger.debug("result : "+result);
		
		return "/ent/entMain";
	}
	
}
