package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.UserVO;
import com.dapao.persistence.ItemDAOImpl;


@Service(value = "itemService")
public class ItemServiceImpl {
	
	

	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Inject
	private ItemDAOImpl idao;

	
	// 조회수 증가
	public int viewCnt(Integer it_no) {
		logger.debug("viewCnt(Integer it_no) 호출 ");
		return idao.viewCnt(it_no);
	}
	
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



	// 판매물건글 상세 
	public TotalVO itemDetail(Integer it_no) {
		
		logger.debug("itemDetail(Integer it_no) 호출 ");
		
		// 디비동작(DAO)중에서 회원정보 조회
		return idao.itemDetail(it_no);
		
	}
	
	// 찜 여부 확인
	public int itemLove(ItemVO itemLove) {
		
		logger.debug("itemLove() 호출");
		return idao.itemLove(itemLove);
	}
	
	// 찜 등록 
	public int itemLoveInsert(LoveVO loveVO) {
		
		logger.debug("itemLoveInsert(LoveVO loveVO) 호출");
		return idao.itemLoveInsert(loveVO);
		
	}
	
	// 찜 삭제
	public int itemLoveDelete(LoveVO loveVO) {
		
		logger.debug("itemLoveDelete(LoveVO loveVO) 호출");
		return idao.itemLoveDelete(loveVO);
		
	}
	
	// 판매물품글 검색 조회 
	public List<ItemVO> itemSearch(String it_title) {
		
		logger.debug("itemSearch(String it_title) 호출");
		return idao.itemSearch(it_title);
		
	}
	
	// 판매물품글 카테고리 조회 
	public List<ItemVO> itemCate(String it_cate) {
		
		logger.debug("itemCate(String it_cate) 호출");
		return idao.itemCate(it_cate);
		
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
	
	
	// 판매자 프로필
	public UserVO yourInfo(String us_id) {
		logger.debug("Service : yourInfo(String us_id) 호출");
		return idao.yourInfo(us_id);
	}

	
	// 판매자 판매 물품 목록
	public List<ItemVO> yourItem(String us_id) {
		logger.debug("Service : yourItem(String us_id) 호출");
		return idao.yourItem(us_id);
	}
	
	
	
	
	

	
	
	
	
	
	
	

}
