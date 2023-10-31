package com.dapao.service;

import java.util.List;

import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;

public interface AdminService {
	
	// 사업자정보 리스트
	public List<EntVO> ownerList() throws Exception;
	
	// 1. 회원관리 - 모든유저정보 출력
	public List<UserVO> getAllUser() throws Exception;
	
	// 2. 회원관리 - 개인유저정보 출력
	public UserVO userInfo(String us_id) throws Exception;
	
	// 사업저정보 출력
	public EntVO ownerInfo(String own_id) throws Exception;
	
	// 사업자 탈퇴
	public void ownerInfoDelete(String own_id) throws Exception;
	
	// FAQ 리스트
	public List<CsVO> FAQList() throws Exception;
	
	// FAQ 1개정보 출력
	public CsVO FAQInfo(Integer cs_no) throws Exception;
	
	//FAQ 글쓰기
	public void FAQWrite() throws Exception;
	
	// FAQ 정보 수정
	public int FAQInfoUpdate(CsVO vo) throws Exception;
	
}
