package com.dapao.service;

import java.util.List;

import com.dapao.domain.ProdVO;

public interface ProdService {
	// 검색조건에 맞는 상품 검색 동작
	public List<ProdVO> searchProd(ProdVO vo) throws Exception;
}
