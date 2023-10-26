package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.ProdVO;


public interface ProdDAO {
	//특정 조건 상품검색
	public List<ProdVO> searchProd(ProdVO vo);
}
