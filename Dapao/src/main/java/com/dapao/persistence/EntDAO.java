package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.EntVO;

public interface EntDAO {
	// 가게 데이터 수정하기
	public void entUpdate(EntVO vo);

	// 특정 가게 데이터 조회
	public List<EntVO> listEnt(EntVO vo);

	public void entJoin(EntVO vo) throws Exception;

	public EntVO entLogin(EntVO vo) throws Exception;
}
