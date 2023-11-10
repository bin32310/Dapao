package com.dapao.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.AcVO;
import com.dapao.domain.AdVO;
import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ExpVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.UserVO;
import com.dapao.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adao;
	
	@Override
	public UserVO userInfo(String us_id) throws Exception {
		logger.debug("service : userInfo(String us_id) 호출 ");
		return adao.userInfo(us_id);
	}
	
	@Override
	public int userStop(UserVO vo) throws Exception {
		logger.debug("service : userStop(UserVO vo) 호출 ");
		return adao.userStop(vo);
	}
	
	@Override
	public void userStateUpdate(String us_id) throws Exception {
		logger.debug("service : userStateUpdate(String us_id) 호출");
		adao.userStateUpdate(us_id);
	}
	
	@Override
	public int userDelete(String us_id) throws Exception {
		logger.debug("service : userDelete(String us_id) 호출");
		return adao.userDelete(us_id);
	}
	
	@Override
	public List<UserVO> getUserList(Criteria cri) throws Exception {
		return adao.getUserList(cri);
	}
	
	@Override
	public int getUserCount() throws Exception {
		return adao.getUserCount();
	}
	
	@Override
	public List<EntVO> ownerList(Criteria cri) throws Exception{
		logger.debug("service : ownerList() 호출");
		return adao.ownerList(cri);
	}

	
	@Override
	public EntVO ownerInfo(String own_id) throws Exception {
		logger.debug("service : ownerInfo(String own_id) 호출 ");
		return adao.ownerInfo(own_id);
	}
  
  	@Override
	public int ownerCount(String own_id) throws Exception {
		logger.debug("service : ownerCount() 호출 ");
		return adao.ownerCount(own_id);
	}
  	
  	@Override
  	public int ownerStop(EntVO vo) throws Exception {
  		logger.debug("service : ownerStop(EntVO vo) 호출 ");
  		return adao.ownerStop(vo);
  	}
	
	@Override
	public int ownerApprove(String own_id) throws Exception {
		logger.debug("service : ownerApprove(String own_id) 호출");
		return adao.ownerApprove(own_id);
	}
	
	@Override
	public int ownerInfoDelete(String own_id) throws Exception {
		logger.debug("service : ownerInfoDelete(String own_id) 호출");
		return adao.ownerInfoDelete(own_id);
	}
	
	@Override
	public List<CsVO> FAQList(Criteria cri) throws Exception {
		logger.debug("service : FAQList() 호출");
		return adao.FAQList(cri);
	}
	
	@Override
	public CsVO csInfo(Integer cs_no) throws Exception {
		logger.debug("service : csInfo(Integer cs_no) 호출");
		return adao.csInfo(cs_no);
	}
	
	@Override
	public void FAQWrite(CsVO vo) throws Exception {
		logger.debug("service : FAQWrite() 호출");
		adao.FAQWrite(vo);
	}
	
	@Override
	public int csInfoUpdate(CsVO vo) throws Exception {
		logger.debug("service : csInfoUpdate(CsVO vo) 호출");
		return adao.csInfoUpdate(vo);
	}
	
	@Override
	public int FAQCount() throws Exception {
		logger.debug("service : FAQCount() 호출");
		return adao.FAQCount();
	}
	
	@Override
	public int noticeCount() throws Exception {
		logger.debug("service : noticeCount() 호출");
		return adao.noticeCount();
	}
	
	@Override
	public List<CsVO> noticeList(Criteria cri) throws Exception {
		logger.debug("service : noticeList() 호출");
		return adao.noticeList(cri);
	}
	
	@Override
	public int csUpload(Integer cs_no) throws Exception {
		logger.debug("service : csUpload(Integer cs_no) 호출");
		return adao.csUpload(cs_no);
	}
	
	@Override
	public int csRemove(Integer cs_no) throws Exception {
		logger.debug("service : csRemove(Integer cs_no) 호출");
		return adao.csRemove(cs_no);
	}
	
	@Override
	public List<ReviewVO> reviewList(Criteria cri) throws Exception {
		logger.debug("service : reviewList(Criteria cri) 호출");
		return adao.reviewList(cri);
	}
	
	@Override
	public int reviewCount(Integer rv_no) throws Exception {
		logger.debug("service : reviewCount(Integer rv_no) 호출");
		return adao.reviewCount(rv_no);
	}
	
	@Override
	public ReviewVO reviewInfo(Integer rv_no) throws Exception {
		logger.debug("service : reviewInfo(Integer rv_no)호출");
		return adao.reviewInfo(rv_no);
	}
	
	@Override
	public int reviewDelete(Integer rv_no) throws Exception {
		logger.debug("service : reviewDelete(Integer rv_no)호출");
		return adao.reviewDelete(rv_no);
	}
  
  @Override
	public void noticeWrite(CsVO vo) throws Exception {
		logger.debug("service : noticeWrite(CsVO vo) 호출");
		adao.noticeWrite(vo);
	}
	
	@Override
	public int csDelete(Integer cs_no) throws Exception {
		logger.debug("service : csDelete(Integer cs_no) 호출");
		return adao.csDelete(cs_no);
	}
	
	@Override
	public List<AcVO> acList(Criteria cri) throws Exception {
		logger.debug("service : acList(Criteria cri) 호출");
		return adao.acList(cri);
	}
	
	@Override
	public int acCount(Integer ac_no) throws Exception {
		logger.debug("service : acCount(Integer ac_no) 호출");
		return adao.acCount(ac_no);
	}
	
	@Override
	public AcVO acInfo(Integer ac_no) throws Exception {
		logger.debug("service : acInfo(Integer ac_no) 호출");
		return adao.acInfo(ac_no);
	}
	
	// 신고관리 - 접수 처리
	@Override
	public int acHandling(Integer ac_no) throws Exception {
		logger.debug("service : acHandling(Integer ac_no) 호출");
		return adao.acHandling(ac_no);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(user 조회)
	@Override
	public String acResultSelectUserId(AcVO vo) throws Exception {
		logger.debug("service : acResultSelectUserId(AcVO vo) 호출");
		return adao.acResultSelectUserId(vo);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(owner 조회)
	@Override
	public String acResultSelectOwnerId(AcVO vo) throws Exception {
		logger.debug("service : acResultSelectOwnerId(AcVO vo) 호출");
		return adao.acResultSelectOwnerId(vo);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(user)
	@Override
	public int acResultUserUpdate(AcVO acVo,String stop) throws Exception {
		logger.debug("service : acResultUserUpdate(AcVO acVo,String stop) 호출");
		return adao.acResultUserUpdate(acVo, stop);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(owner)
	@Override
	public int acResultOwnerUpdate(AcVO acVo,String stop) throws Exception {
		logger.debug("service : acResultUserUpdate(AcVO acVo,String stop) 호출");
		return adao.acResultOwnerUpdate(acVo, stop);
	}
	
	//신고관리 - 신고 글 쓰기
	@Override
	public int acWrite(AcVO vo) throws Exception {
		logger.debug("service : acWrite(AcVO vo) 호출");
		return adao.acWrite(vo);
	}
	
	// 체험단관리 - 체험단 리스트
	@Override
	public List<ExpVO> expList(Criteria cri) throws Exception {
		logger.debug("service : expList(Criteria cri) 호출");
		return adao.expList(cri);
	}
	
	// 체험단관리 - 체험단 글개수 조회
	@Override
	public int expCount(Integer exp_no) throws Exception {
		logger.debug("service : expCount(Integer exp_no) 호출");
		return adao.expCount(exp_no);
	}
	
	// 체험단관리 - 체험단 글 1개 정보
	@Override
	public ExpVO expInfo(Integer exp_no) throws Exception {
		logger.debug("service : expInfo(Integer exp_no)호출");
		return adao.expInfo(exp_no);
	}
	
	// 체험단관리 - 상태 업데이트
	@Override
	public void expStateUpdate(Integer exp_no) throws Exception {
		logger.debug("service : expStateUpdate(Integer exp_no) 호출");
		adao.expStateUpdate(exp_no);
	}
	
	// 체험단관리 - 광고테이블 insert
	@Override
	public int expAdInsert(String own_id, String ad_date) throws Exception {
		logger.debug("service : expAdInsert(String own_id, String ad_date) 호출");
		return adao.expAdInsert(own_id, ad_date);
	}
	
	// 체험단관리 - 반려 상태 업뎃
	@Override
	public int expReturn(ExpVO vo) throws Exception {
		logger.debug("service : expReturn(Integer exp_no) 호출");
		return adao.expReturn(vo);
	}
	
}
