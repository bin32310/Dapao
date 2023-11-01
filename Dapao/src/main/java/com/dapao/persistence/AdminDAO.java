package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;

public interface AdminDAO {
	
	// 사업자 정보 리스트
	public List<EntVO> ownerList(Criteria cri) throws  Exception;
	
	// 사업자 총개수 조회
	public int ownerCount(Integer own_id) throws Exception;
	
	// 회원관리 - 모든유저정보 출력
	public List<UserVO> getAllUser() throws Exception;
	
	// 회원관리 - 개인유저정보 출력
	public UserVO userInfo(String us_id) throws Exception;
	
	// 사업자 정보 출력
	public EntVO ownerInfo(String own_id) throws Exception;
	
	// 사업자 승인
	public int ownerApprove(String own_id) throws Exception;
	
	// 사업자 탈퇴
	public int ownerInfoDelete(String own_id) throws Exception;
	
	// FAQ 리스트
	public List<CsVO> FAQList(Criteria cri) throws Exception;
	
	// FAQ 1개정보 출력
	public CsVO FAQInfo(Integer cs_no) throws Exception;
	
	//FAQ 글쓰기
	public void FAQWrite(CsVO vo) throws Exception;
	
	// FAQ 정보 수정
	public int FAQInfoUpdate(CsVO vo) throws Exception;
	
	// FAQ 총 글개수 조회
	public int FAQCount() throws Exception;
}
