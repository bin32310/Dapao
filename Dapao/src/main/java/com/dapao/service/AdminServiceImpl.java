package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;
import com.dapao.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adao;

	@Override
	public List<EntVO> ownerList() throws Exception{
		logger.debug("service : allOwnerInfo() 호출");
		return adao.ownerList();
	}
	
	@Override
	public List<UserVO> getAllUser() throws Exception {
		logger.debug("컨트롤러의 호출로 Service호출");
		return adao.getAllUser();
	}
	
	@Override
	public UserVO userInfo(String us_id) throws Exception {
		logger.debug("컨트롤러의 호출로 Service호출");
		return adao.userInfo(us_id);
	}
	
	
}
