package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.ItemVO;
import com.dapao.domain.TotalVO;

public interface ItemDAO {
	
	// 판매글 작성 기능
	public int itemWrite(ItemVO itemVO);
	// 판매글 작성 후 확인
	public int itemWriteCheck(String us_id);
	
	// 판매글 조회(상세보기) 기능
	public TotalVO itemDetail(Integer it_no);
	
	// 판매자 다른 물품
	public List<ItemVO> sellerItem(TotalVO seller);

	// 비슷한 물품 조회 (같은 카테고리)
	public List<ItemVO> sameCate(TotalVO item);
	

}
