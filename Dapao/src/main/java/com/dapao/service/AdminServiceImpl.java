package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;
import com.dapao.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adao;

	@Override
	public List<UserVO> getAllUser() throws Exception {
		logger.debug("service : getAllUser() 호출 ");
		return adao.getAllUser();
	}
	
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
	public int ownerCount(Integer own_id) throws Exception {
		logger.debug("service : ownerCount() 호출 ");
		return adao.ownerCount(own_id);
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
	public CsVO FAQInfo(Integer cs_no) throws Exception {
		logger.debug("service : FAQInfo(Integer cs_no) 호출");
		return adao.FAQInfo(cs_no);
	}
	
	@Override
	public void FAQWrite(CsVO vo) throws Exception {
		logger.debug("service : FAQWrite() 호출");
		adao.FAQWrite(vo);
	}
	
	@Override
	public int FAQInfoUpdate(CsVO vo) throws Exception {
		logger.debug("service : FAQInfoUpdate(CsVO vo) 호출");
		return adao.FAQInfoUpdate(vo);
	}
	
	@Override
	public int FAQCount() throws Exception {
		logger.debug("service : FAQCount(Integer cs_no) 호출");
		return adao.FAQCount();
	}
}
