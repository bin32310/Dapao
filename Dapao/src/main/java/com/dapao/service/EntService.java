package com.dapao.service;

import java.util.List;

import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.TradeVO;

public interface EntService {
	// 상점 정보 수정
	public void entUpdate(EntVO vo);

	// 특정 상점 정보 조회
	public List<EntVO> listEnt(EntVO vo);

	// 가게 주문 리스트 조회
	public List<TradeVO> searchTrade(PageVO vo);

	// 가게 주문 리스트 갯수
	public int searchTradeCount(PageVO vo);

	// 주문 환불
	public void refund(TradeVO vo);

	public void entJoin(EntVO vo) throws Exception;

	public EntVO entLogin(EntVO vo) throws Exception;

	// 폰인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception;

	// 아이디 중복조회
	public Integer checkId(String own_id) throws Exception;

	// 정보조회
	public EntVO ownInfo(String own_id) throws Exception;

}
