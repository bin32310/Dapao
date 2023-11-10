package com.dapao.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.ExpVO;
import com.dapao.persistence.CsDAOImpl;
import com.dapao.persistence.ExpDAOImpl;

@Service(value="expService")
public class ExpServiceImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(ExpServiceImpl.class);
	
	@Autowired
	private ExpDAOImpl edao;
	
	// 사업자 - 체험단 신청
	public int ownExp(ExpVO vo) throws Exception{
		return edao.ownExp(vo);
	}
	
}
