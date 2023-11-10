package com.dapao.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dapao.service.AdServiceImpl;

@RestController
@RequestMapping("/ad")
public class AdRESTController {

	private static final Logger logger = LoggerFactory.getLogger(AdRESTController.class);
	
	@Inject
	private AdServiceImpl adService;
	
	// 메인체험단 공고 - 출력문
	@RequestMapping("/modalShow")
	public ResponseEntity<String> modalShow() throws Exception{
		logger.debug("modalShow() 호출");
		adService.modalShow();
		return null;
	}
	
	
	
}
