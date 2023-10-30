package com.dapao.service;

import java.util.List;

import com.dapao.domain.EntVO;

public interface EntService {
	
	public void entJoin(EntVO vo) throws Exception;
	
	public EntVO entLogin(EntVO vo) throws Exception;
	
	// 상점 정보 수정
	public void entUpdate(EntVO vo);
	// 특정 상점 정보 조회
	public List<EntVO> listEnt(EntVO vo);
}
