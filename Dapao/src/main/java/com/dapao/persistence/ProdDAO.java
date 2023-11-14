package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.ProdVO;

public interface ProdDAO {
	// 특정 조건 상품검색
	public List<ProdVO> searchProd(PageVO vo);
	// 특정 사업자 상품리스트 조회
	public List<ProdVO> listProd(EntVO vo);
	// 상품 수정하기
	public void updateProd(ProdVO vo);
	// 상품 등록하기
	public void insertProd(ProdVO vo);
	// 등록한 상품 전체 갯수
	public int getProdList(String own_id);
	// 페이징처리 후 리스트 목록조회
	public List<ProdVO> getListPage(PageVO vo);
}
