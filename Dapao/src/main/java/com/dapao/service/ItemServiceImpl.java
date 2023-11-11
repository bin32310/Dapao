package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.AlarmVO;
import com.dapao.domain.FileVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.TradeVO;
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
		return 	idao.itemWrite(itemVO);
		
	}
	
	// 판매글 등록 확인
	public int itemWriteCheck(String us_id) {
		logger.debug("itemWriteCheck(String us_id) 호출 ");
		return idao.itemWriteCheck(us_id);
	}
	
	// 파일 업로드
	public void insertFile(FileVO fileVO) {
		logger.debug("insertFile(FileVO fileVO) 호출 ");
		idao.insertFile(fileVO);
		
	}

	// 판매자 정보 조회 
	public UserVO sellerInfo(String sellerId) {
		logger.debug("sellerInfo(String sellerId) 호출");
		return idao.sellerInfo(sellerId);
		
	}

	
	// 판매자 리뷰 조회 
	public List<ReviewVO> sellerRv(ItemVO itemVO) {
		logger.debug("sellerRv(ItemVO itemVO) 호출");
		return idao.sellerRv(itemVO);
		
	}

	// 판매물품글 사진 조회 
	public List<FileVO> itemFile(Integer it_no) {
		
		logger.debug("itemFile(Integer it_no) 호출 ");
		return idao.itemFile(it_no);
		
	}
	
	
	// 판매물품글 대표사진 조회 
	public FileVO itemFileMain(Integer it_no) {
		
		logger.debug("itemFileMain(Integer it_no) 호출 ");
		return idao.itemFileMain(it_no);
		
	}
	
	// 판매물품글 대표사진 입력
	public int itemFileMainInsert(FileVO vo) {
		logger.debug("DAOImpl : itemFileMainInsert(FileVO vo) 호출");
		return idao.itemFileMainInsert(vo);
	}
	
	
	// 판매물건글 상세 
	public ItemVO itemDetail(Integer it_no) {
		
		logger.debug("itemDetail(Integer it_no) 호출 ");
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
	public List<ItemVO> sellerItem(ItemVO itemVO) {
		logger.debug("sellerItem(ItemVO itemVO) 호출 ");
		return idao.sellerItem(itemVO);
	}

	// 비슷한 물건 조회(같은 카테고리)
	public List<ItemVO> sameCate(ItemVO item) {

		logger.debug("sameCate(ItemVO item) 호출 ");
		
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
	
	// 코인충전
	public int coinCharge(PayVO payVO) {
		logger.debug("Service : coinCharge(PayVO payVO) 호출");
		return idao.coinCharge(payVO);
		
	}
	
	// 코인충전 결제 내역
	public int coinChargePay(PayVO payVO) {
		logger.debug("Service : coinChargePay(PayVO payVO) 호출");
		return idao.coinChargePay(payVO);
		
	}
	
	// 코인충전 결제 내역
	public int userCoin(String us_id) {
		logger.debug("Service : userCoin(String us_id) 호출");
		return idao.userCoin(us_id);
	}
	
	
	// 아이템 구매시(코인 - 구매가격)
	public int purchase(UserVO purchaseVO) {
		logger.debug("Service : purchase(UserVO purchaseVO) 호출");
		return idao.purchase(purchaseVO);
		
	}
	
	// 글상태 변경 (판매중(0) -> 예약중(1))
	public int itStateChange(Integer it_no) {
		logger.debug("Service : itStateChange(Integer in_no) 호출");
		return idao.itStateChange(it_no);
		
	}
	
	// 알람보내기 
	public int alarmSend(AlarmVO alarmVO) {
		logger.debug("Service : alarmSend(AlarmVO alarmVO) 호출");
		return idao.alarmSend(alarmVO);
		
	}
	
	// 알람리스트 출력 
	public List<AlarmVO> alarmList(String us_id) {
		logger.debug("Service : alarmList(String us_id) 호출");
		return idao.alarmList(us_id);
		
	}
	
	// 구매여부 확인 
	public TradeVO checkPur(ItemVO purVO) {
		logger.debug("Service : checkPur(ItemVO purVO) 호출");
		return idao.checkPur(purVO);
		
	}
	
	// 안전결제 후 거래 테이블에 입력
	public int itemTrade(TradeVO tradeVO) {
		logger.debug("Service : itemTrade(TradeVO tradeVO) 호출");
		return idao.itemTrade(tradeVO);
		
	}
	

	
	
	

}
