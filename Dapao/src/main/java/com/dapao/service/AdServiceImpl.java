package com.dapao.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.persistence.AdDAOImpl;

@Service(value = "AdService")
public class AdServiceImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(AdServiceImpl.class);
	
	private AdDAOImpl addao;
	
	public String modalShow() throws Exception{
		logger.debug("modalShow() 호출");
		return addao.modalShow();
	}
}
