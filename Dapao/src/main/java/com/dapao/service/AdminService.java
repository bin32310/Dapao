package com.dapao.service;

import java.util.List;

import com.dapao.domain.EntVO;

public interface AdminService {
	
	// 사업자정보 리슼트
	public List<EntVO> allOwnerInfo();
}
