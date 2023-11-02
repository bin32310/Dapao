package com.dapao.service;

import java.util.List;

import com.dapao.domain.ItemVO;
import com.dapao.domain.TotalVO;

// 서비스 : 비지니스 로직을 구현하는 부분
// => 사용자 요구사항에 맞는 동작을 구현 
// => !!컨트롤러와 DAO를 연결하는 다리!!
// => 컨트롤러의 영속성 계층(DAO)의 종속적인 상황을 막아준다.
public interface ItemService {

	
	// 판매글 등록
	public int itemWrite(ItemVO itemVO);
	// 판매글 등록후 확인
	public int itemWriteCheck(String us_id);
	
	
	// 판매글 조회
	public TotalVO itemDetail(Integer it_no);
	
	// 비슷한 물품 조회 (같은 카테고리)
	public List<ItemVO> sellerItem(TotalVO seller);

	// 비슷한 물품 조회 (같은 카테고리)
	public List<ItemVO> sameCate(TotalVO item);

}
