package com.dapao.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dapao.domain.ItemVO;
import com.dapao.domain.UserVO;
import com.dapao.service.ItemService;
import com.dapao.service.UserService;



//@RequestMapping(value = "/board/*")
//~.bo 끝나는 주소를 설정한 것처럼
///board/~ 주로소 설정


@Controller
@RequestMapping(value = "/item/*")
public class ItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Inject
	private ItemService iService;
	
	@Inject
	private UserService uService;

	
	// http://localhost:8088/item/it0emDetail
	// 판매글상세 GET - 글 정보를 입력
	@RequestMapping(value = "/itemDetail", method = RequestMethod.GET)
	public String itemDetailGET(Integer it_bno, Model model) throws Exception {
		logger.debug("itemDetailGET() 호출");
		
		// 파라메터 자동수집
		logger.debug("@@판매글 번호 : " + it_bno);
		
		// 서비스 -> DAO 호출 : 판매글 조회
		ItemVO itemVO = iService.itemDetail(it_bno);
		logger.debug("@@판매글 정보 : " + itemVO);
		
		// 연결된 뷰페이지에 출력 => 컨트롤러의 정보를 view 페이지로 전달
		// Model 객체를 사용
		model.addAttribute("itemVO", itemVO);
		
		
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
	
	
	


	
	
}
