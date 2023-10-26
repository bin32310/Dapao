package com.dapao.persistence;

import com.dapao.domain.EntVO;

public interface EntDAO {
	
	public void entJoin(EntVO vo) throws Exception;
	
	public EntVO entLogin(EntVO vo) throws Exception;

}
