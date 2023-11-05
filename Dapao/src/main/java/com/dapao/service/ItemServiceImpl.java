package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.ItemVO;
import com.dapao.domain.TotalVO;
import com.dapao.persistence.ItemDAOImpl;


@Service(value = "itemService")
public class ItemServiceImpl {
	
	

	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Inject
	private ItemDAOImpl idao;

	
	// 판매글 등록
	public int itemWrite(ItemVO itemVO) {
		logger.debug("itemWrite(ItemVO itemVO) 호출 ");
		
		return idao.itemWrite(itemVO);
	}
	
	// 판매글 등록 확인
	public int itemWriteCheck(String us_id) {
		logger.debug("itemWriteCheck(String us_id) 호출 ");
		
		return idao.itemWriteCheck(us_id);
	}



	// 판매글 상세 
	public TotalVO itemDetail(Integer it_no) {
		
		logger.debug("itemDetail(Integer it_no) 호출 ");
		
		// 디비동작(DAO)중에서 회원정보 조회
		return idao.itemDetail(it_no);
		
	}
	
	// 판매자 다른 물품
	public List<ItemVO> sellerItem(TotalVO seller) {
		logger.debug("sellerItem(TotalVO seller) 호출 ");
		return idao.sellerItem(seller);
	}

	// 비슷한 물건 조회(같은 카테고리)
	public List<ItemVO> sameCate(TotalVO item) {

		logger.debug("sameCate(String it_cate) 호출 ");
		
		return idao.sameCate(item);
	}
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	

}
