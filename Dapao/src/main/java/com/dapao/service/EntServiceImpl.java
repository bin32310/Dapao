package com.dapao.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TradeVO;
import com.dapao.persistence.EntDAO;

@Service
public class EntServiceImpl implements EntService {

	private static final Logger logger = LoggerFactory.getLogger(EntServiceImpl.class);
	@Autowired
	private EntDAO edao;

	@Override
	public void entUpdate(EntVO vo) {
		logger.debug(" service -> entUpdate(EntVO vo) 호출 ");
		edao.entUpdate(vo);

	}

	@Override
	public EntVO listEnt(EntVO vo) {
		logger.debug(" service listEnt() 호출 ");
		return edao.listEnt(vo);
	}

	@Override
	public List<TradeVO> searchTrade(PageVO vo) {
		logger.debug(" service listTrade(String own_id) 호출 ");
		return edao.searchTrade(vo);
	}

	@Override
	public int searchTradeCount(PageVO vo) {
		logger.debug(" service searchTradeCount(PageVO vo) 호출 ");
		return edao.searchTradeCount(vo);
	}

	@Override
	public void refund(TradeVO vo) {
		logger.debug(" service refund(TradeVO vo) 호출 ");
		edao.refund(vo);
	}

	@Override
	public void entJoin(EntVO vo) throws Exception {
		logger.debug("컨트롤러 -> entJoin()서비스 호출");
		edao.entJoin(vo);

	}

	@Override
	public EntVO entLogin(EntVO vo) throws Exception {
		logger.debug("컨트롤러 -> entLogin()서비스 호출");

		return edao.entLogin(vo);
	}

	// 휴대폰 인증
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception {
		edao.certifiedPhoneNumber(userPhoneNumber, randomNumber);

	}

	// 아이디 중복확인
	@Override
	public Integer checkId(String own_id) throws Exception {

		return edao.checkId(own_id);
	}

	// 정보조회
	@Override
	public EntVO ownInfo(String own_id) throws Exception {
		logger.debug("컨트롤러 -> ownInfo()서비스 호출");
		return edao.ownInfo(own_id);
	}
	
	@Override
	public List<ReviewVO> entReviewList(String own_id) throws Exception {
		logger.debug(" service -> entReviewList(String own_id) 호출 ");
		return edao.entReviewList(own_id);
	}
	

}
