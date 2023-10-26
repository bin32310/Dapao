package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.EntVO;

public interface AdminDAO {
	
	// 사업자 정보 리스트
	public List<EntVO> getAllOwner();
}
