package com.dapao.service;

import java.util.List;

import com.dapao.domain.AcVO;
import com.dapao.domain.AdVO;
import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ExpVO;
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
	
	// 신고관리 - 신고 리스트
	public List<AcVO> acList(Criteria cri) throws Exception;
	
	// 신고관리 - 신고 총 개수 조회
	public int acCount(Integer ac_no) throws Exception;
	
	// 신고관리 - 신고 1개 글 정보
	public AcVO acInfo(Integer ac_no) throws Exception;
	
	// 신고관리 - 접수 처리
	public int acHandling(Integer ac_no) throws Exception;
	
	// 신고관리 - 신고 처리상태 업뎃(user 조회)
	public String acResultSelectUserId (AcVO vo) throws Exception;
	
	// 신고관리 - 신고 처리상태 업뎃(owner 조회)
	public String acResultSelectOwnerId (AcVO vo) throws Exception;
	
	// 신고관리 - 신고 처리상태 업뎃(user)
	public int acResultUserUpdate(AcVO acVo,String stop) throws Exception;
	
	// 신고관리 - 신고 처리상태 업뎃(owner)
	public int acResultOwnerUpdate(AcVO acVo,String stop) throws Exception;

	//신고관리 - 신고 글 쓰기
	public int acWrite(AcVO vo) throws Exception;
	
	// 체험단관리 - 체험단 리스트
	public List<ExpVO> expList(Criteria cri) throws  Exception;
	
	// 체험단관리 - 체험단 글개수 조회
	public int expCount(Integer exp_no) throws Exception;
	
	// 체험단관리 - 체험단 글 1개 정보
	public ExpVO expInfo(Integer exp_no) throws Exception;
	
	// 체험단관리 - 상태 업데이트
	public void expStateUpdate(Integer exp_no) throws Exception;
	
	// 체험단관리 - 광고테이블 insert
	public int expAdInsert(String own_id, String ad_date) throws Exception;
	
	// 체험단관리 - 반려 상태 업뎃
	public int expReturn(ExpVO vo) throws Exception;
}
