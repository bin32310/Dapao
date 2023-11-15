package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.TradeVO;

public interface EntDAO {
	// 가게 데이터 수정하기
	public void entUpdate(EntVO vo);
	// 특정 가게 데이터 조회
	public List<EntVO> listEnt(EntVO vo);
	// 가게 검색조건에 따른 주문 리스트 조회
	public List<TradeVO> searchTrade(PageVO vo);
	// 가게 검색조건에 따른 주문 리스트 총갯수
	public int searchTradeCount(PageVO vo);
	// 주문 환불
	public void refund(TradeVO vo);
	
	public void entJoin(EntVO vo) throws Exception;
	
	public EntVO entLogin(EntVO vo) throws Exception;
	// 폰 인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception;
	
	// 아이디 중복체크
	public Integer checkId(String own_id) throws Exception;
	
	// 정보조회
	public EntVO ownInfo(String own_id) throws Exception;
	
}
