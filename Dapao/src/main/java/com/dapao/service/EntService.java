package com.dapao.service;

import com.dapao.domain.EntVO;

public interface EntService {
	
	public void entJoin(EntVO vo) throws Exception;
	
	public EntVO entLogin(EntVO vo) throws Exception;

}
