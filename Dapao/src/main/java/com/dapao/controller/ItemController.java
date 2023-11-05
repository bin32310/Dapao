package com.dapao.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dapao.domain.ItemVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.UserVO;
import com.dapao.service.ItemServiceImpl;
import com.dapao.service.UserService;

//http://localhost:8088/user/userMain

//@RequestMapping(value = "/board/*")
//~.bo 끝나는 주소를 설정한 것처럼
///board/~ 주로소 설정


@Controller
@RequestMapping(value = "/item/*")
public class ItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Inject
	private ItemServiceImpl iService;
	
	@Inject
	private UserService uService;
	
	
	// http://localhost:8088/item/chat
	// 채팅GET - 미완성 
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public void chatGET() throws Exception {
		logger.debug("chatGET() 호출");
		
		logger.debug("연결된 뷰페이지(views/item/chat.jsp)를 출력");
		
	}
	
	// http://localhost:8088/item/itemWrite
	// 판매글 작성GET - 판매글 작성 페이지로 이동
	@RequestMapping(value = "/itemWrite", method = RequestMethod.GET)
	public void itemWriteGET() throws Exception {
		logger.debug("itemWriteGET() 호출");
		
		logger.debug("연결된 뷰페이지(views/item/itemWrite.jsp)를 출력");
		
	}
	
	
	// 판매글 작성POST - 작성한 판매글 등록
	@RequestMapping(value = "/itemWrite", method = RequestMethod.POST)
	public String itemWritePOST(HttpSession session, ItemVO itemVO) throws Exception {
		logger.debug("itemWritePOST() 호출");
		int it_no=0;
		// 세션 - 아이디
		String us_id = (String) session.getAttribute("us_id");
		itemVO.setUs_id(us_id);
		logger.debug("itemVO : " + itemVO);
		
		// 서비스 -> DAO 호출 : 판매글  작성 등록
		int result = iService.itemWrite(itemVO);
		if(result == 1) { // 성공적으로 글 등록시
			
			it_no = iService.itemWriteCheck(us_id);
			
		}
		
		logger.debug("@@판매글 정보 : " + itemVO);
		
		if(result != 1) {
			logger.debug("판매글 등록 실패");
			return "redirect:/user/userMain";
		}
		
		logger.debug("판매글 등록 성공");
		logger.debug("연결된 뷰페이지(views/item/itemDetail.jsp)를 출력");
		
		//return "redirect:/mypage/userSell";
		return "redirect:/item/itemDetail?it_no="+it_no;
		
	}

	
	
	
	// http://localhost:8088/item/it0emDetail
	// 판매글상세 GET - 글 정보를 입력
	@RequestMapping(value = "/itemDetail", method = RequestMethod.GET)
	public String itemDetailGET(Integer it_no, Model model) throws Exception {
		logger.debug("itemDetailGET() 호출");
		
		// 파라메터 자동수집
		logger.debug("@@판매글 번호 : " + it_no);
		
		// 판매글 조회
		TotalVO itemVO = iService.itemDetail(it_no);
		logger.debug("@@판매글 정보 : " + itemVO);
		model.addAttribute("itemVO", itemVO);
		model.addAttribute("itemVO", itemVO);
		
		// 판매자 다른 물품
		List<ItemVO> sellerItemVO = iService.sellerItem(itemVO);
		logger.debug("@@비슷한 물품 정보 : " + sellerItemVO);
		model.addAttribute("sellerItemVO", sellerItemVO);

		// 비슷한 상품 조회(같은 카테고리)
		List<ItemVO> sameCateVO = iService.sameCate(itemVO);
		logger.debug("@@비슷한 물품 정보 : " + sameCateVO);
		model.addAttribute("sameCateVO", sameCateVO);
		
		
		logger.debug("연결된 뷰페이지(views/item/itemDetail.jsp)를 출력");
		return "/item/itemDetail";
		
	}
	
	// http://localhost:8088/item/itemDetail	
	// 판매글상세 POST (받은 정보 + DB에서 정보 들고오기 => 결제 페이지로 이동)
	@RequestMapping(value="/itemDetail", method = RequestMethod.POST )
	public String itemDetailPOST(ItemVO itemVO,HttpSession session, Model model) {
		
		logger.debug("itemDetailPOST() 호출");
		
		// 전달정보 확인
		logger.debug("@@판매글 정보 확인 itemVO : " + itemVO);
		
		// 사용자의 아이디 정보 => 세션영역에 있는 정보 가져오기
		String us_id = (String) session.getAttribute("us_id");
		logger.debug("@@세션 아이디 확인 us_id : " + us_id);
		
		// 서비스 -> DAO
		// 결제에 필요한 정보 불러오기 매서드 실행
		//UserVO userVO = uService.userInfo(us_id);
		//logger.debug("@@회원정보 확인 userVO : " + userVO);

		// 정보 이동
		model.addAttribute("itemVO", itemVO);
		model.addAttribute("userVO", uService.userInfo(us_id));
		
		// 정보를 가지고 결제 창으로 이동
		return "redirect:/item/itemPay";
	}
	
	
	// http://localhost:8088/item/coinCharge
	// 대나무페이 충전 GET - 충전페이지로 이동 
	@RequestMapping(value = "/coinCharge", method = RequestMethod.GET)
	public void coinChargeGET() throws Exception {
		logger.debug("coinChargeGET() 호출");
		
		
	}

	// 대나무페이 충전 POST - 충전금액 입력
	@RequestMapping(value = "/coinCharge", method = RequestMethod.POST)
	public String coinChargePOST(HttpSession session, Model model, @ModelAttribute Integer coinCharge) throws Exception {
		logger.debug("coinChargePOST() 호출");
		
		// 세션 아이디, 코인 금액, url
		String us_id = (String)session.getAttribute("us_id");
		Integer us_coin = (Integer)session.getAttribute("us_coin");
		String url = (String)session.getAttribute("URL");
		logger.debug("@@회원 아이디 확인 : " + us_id);
		logger.debug("@@코인금액 확인 : " + us_coin);
		logger.debug("@@충전금액 확인 : " + coinCharge);
		
		Integer total_price = us_coin + coinCharge;
		logger.debug("@@코인 총금액 확인 : " + total_price);
		
		// 서비스 -> DAO 호출 : 판매글 조회
		//ItemVO itemVO = iService.itemDetail(it_bno);
		//logger.debug("@@판매글 정보 : " + itemVO);
		
		// 연결된 뷰페이지에 출력 => 컨트롤러의 정보를 view 페이지로 전달
		// Model 객체를 사용
		// model.addAttribute("itemVO", itemVO);
		
		
		logger.debug("연결된 뷰페이지(views/item/itemDetail.jsp)를 출력");
		return "redirect:/item/url";
		
	}
	


	
	
}
