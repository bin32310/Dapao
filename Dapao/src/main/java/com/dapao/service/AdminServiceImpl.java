package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.EntVO;
import com.dapao.persistence.AdminDAO;

@Repository
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adao;

	@Override
	public List<EntVO> allOwnerInfo() {
		
		List<EntVO> allOwnerlist = adao.getAllOwner();
		
		return allOwnerlist;
	}
	
	
}
