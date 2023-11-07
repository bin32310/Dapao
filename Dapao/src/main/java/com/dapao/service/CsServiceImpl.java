package com.dapao.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.persistence.CsDAOImpl;

@Service(value="csService")
public class CsServiceImpl {

	private static final Logger logger = LoggerFactory.getLogger(CsServiceImpl.class);
	
	@Autowired
	private CsDAOImpl cdao;

	// 회원이보는 공지사항리스트 수
	public int userNoticeCount() throws Exception{
		return cdao.userNoticeCount();
	}
	
	// 회원이보는 공지사항리스트
	public List<CsVO> userNoticeList(Criteria cri) throws Exception{
		return cdao.userNoticeList(cri);
	}

}
