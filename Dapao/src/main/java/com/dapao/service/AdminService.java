package com.dapao.service;

import java.util.List;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.ProdVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.UserVO;

import jdk.jshell.spi.ExecutionControl.ExecutionControlException;

public interface AdminService {
		
	// 회원관리 - 개인유저정보 출력
	public UserVO userInfo(String us_id) throws Exception;
	
	// 회원관리 - 회원정지부여
	public int userStop(UserVO vo) throws Exception;
	
	// 회원관리 - 회원정지(회원상태변경 0->1)
	public void userStateUpdate(String us_id) throws Exception;
	
	// 회원관리 - 회원탈퇴(회원상태변경 0->2)
	public int userDelete(String us_id) throws Exception;
	
	// 회원관리 - 페이징처리 후 리스트조회
	public List<UserVO> getUserList(Criteria cri) throws Exception;
	
	// 회원관리 - 전체회원수조회
	public int getUserCount() throws Exception;
	
	// 사업자 관리 - 사업자정보 리스트
	public List<EntVO> ownerList(Criteria cri) throws Exception;
	
	// 사업자 관리 - 사업자 총개수 조회
	public int ownerCount(String own_id) throws Exception;
	
	// 사업자 관리 - 사업자 정보 출력
	public EntVO ownerInfo(String own_id) throws Exception;
	
	// 사업자 관리 - 사업자 정지
	public int ownerStop(EntVO vo) throws Exception;
	
	// 사업자 관리 - 사업자 승인
	public int ownerApprove(String own_id) throws Exception;
	
	// 사업자 관리 - 사업자 탈퇴
	public int ownerInfoDelete(String own_id) throws Exception;
	
	// FAQ&공지 관리 - cs 1개정보 출력
	public CsVO csInfo(Integer cs_no) throws Exception;
	
	// FAQ&공지 관리 - cs 정보 수정
	public int csInfoUpdate(CsVO vo) throws Exception;
	
	// FAQ&공지 관리 - cs 등록
	public int csUpload(Integer cs_no) throws Exception;
	
	// FAQ&공지 관리 - cs 등록해제
	public int csRemove(Integer cs_no) throws Exception;
	
	// FAQ&공지 관리 - cs 삭제
	public int csDelete(Integer cs_no) throws Exception;
	
	// FAQ&공지 관리 - FAQ 리스트
	public List<CsVO> FAQList(Criteria cri) throws Exception;
	
	// FAQ&공지 관리 - FAQ 글쓰기
	public void FAQWrite(CsVO vo) throws Exception;
	
	// FAQ&공지 관리 - FAQ 총 글개수 조회
	public int FAQCount() throws Exception;
	
	//  FAQ&공지 관리 - notice 총 글개수 조회
	public int noticeCount() throws Exception;
	
	//  FAQ&공지 관리 - notice 글 목록 리스트
	public List<CsVO> noticeList(Criteria cri) throws Exception;
	
	//  FAQ&공지 관리 - notice 글쓰기
	public void noticeWrite(CsVO vo) throws Exception;

	// 리뷰관리 - 리뷰리스트
	public List<ReviewVO> reviewList(Criteria cri) throws  Exception;
		
	// 리뷰관리 - 리뷰 총 글개수 조회
	public int reviewCount(Integer rv_no) throws Exception;
	
	// 리뷰관리 - 리뷰 1개정보 출력
	public ReviewVO reviewInfo(Integer rv_no) throws Exception;
	
	// 리뷰관리 - 리뷰 삭제
	public int reviewDelete(Integer rv_no) throws Exception;
	
	// 회원상품관리 - 총 상품 글개수 조회
	public int itemCount() throws Exception;
	
	// 회원상품관리  - 회원상품 목록 리스트
	public List<ItemVO> itemList(Criteria cri) throws Exception;
	
	// 회원상품관리 - 상품삭제(글내리기)
	public int itemDelete(Integer it_no) throws Exception;
	
	// 사업자상품관리 - 총 상품 글개수 조회
	public int prodCount() throws Exception;
	
	// 사업자상품관리 - 사업자상품 목록 리스트
	public List<ProdVO> prodList(Criteria cri) throws Exception;
	
	// 사업자상품관리 - 상품삭제(글내리기)
	public int prodDelete(Integer prod_no) throws Exception;

	
}
