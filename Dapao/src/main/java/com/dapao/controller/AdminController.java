package com.dapao.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.UserVO;
import com.dapao.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService aService;
	
	// http://localhost:8088/admin/userList
		// 모든회원정보출력
		@RequestMapping(value ="/userList", method = RequestMethod.GET)
		public void allUserGET(Model model) throws Exception {
			logger.debug("모든 회원정보 조회 Service호출");
			model.addAttribute("userList", aService.getAllUser());
			logger.debug("userList 페이지 이동");
			
		}
		
	// 회원개인정보출력
   @RequestMapping(value="/userInfo",method = RequestMethod.GET)
   @ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
   public UserVO userInfo(@RequestParam("us_id") String us_id) throws Exception{
      
      // 전달정보저장 - userid
      logger.debug("us_id : "+us_id);
      
      logger.debug("개인회원정보@@@@@@@@@@@@@@ : "+aService.userInfo(us_id));
      
      // 개인정보출력
      return aService.userInfo(us_id);
   }
	
	//http://localhost:8088/admin/ownerList
	// 사업자 리스트 출력	
	@RequestMapping("/ownerList")
	public void ownerListGET(Criteria cri,Model model, Integer own_id) throws Exception{
		logger.debug("ownerListGET() 호출");
		
		// 페이징 처리( 페이지 블럭 처리 객체 )
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(aService.ownerCount(own_id));
		
		// 페이징처리 정보도 뷰페이지로 전달
		logger.debug("pageVO : "+pageVO);
		model.addAttribute("pageVO", pageVO);
		
		//페이지 이동시 받아온 페이지 번호
		if(cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보 입력
			cri.setPage(pageVO.getEndPage());
		}
		
		List<EntVO> ownerList = aService.ownerList(cri);
		
		model.addAttribute("vo", ownerList);
	}
	
	// 사업자 1명의 정보 출력
	@RequestMapping("/ownerInfo")
	@ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
	public EntVO ownerInfoGET(@RequestParam("own_id") String own_id) throws Exception{
		logger.debug("ownerInfoGET() 호출");
		return aService.ownerInfo(own_id);
	}
	
	// 사업자 승인
	@RequestMapping("/ownerApprove")
	@ResponseBody
	public int ownerApprove(String own_id) throws Exception{
		logger.debug("ownerApprove() 호출");
		return aService.ownerApprove(own_id);
	}
	
	//사업자 탈퇴
	@RequestMapping("/ownerInfoDelete")
	public int ownerInfoDeleteGET(String own_id) throws Exception{
		logger.debug("ownerInfoDeleteGET() 호출");
		return aService.ownerInfoDelete(own_id);
	}
	
	//http://localhost:8088/admin/FAQList
	// FAQ 리스트
	@RequestMapping("/FAQList")
	public void FAQList(Criteria cri,Model model) throws Exception{
		logger.debug("FAQList() 호출");
		
		// 페이징 처리( 페이지 블럭 처리 객체 )
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(aService.FAQCount());
		
		// 페이징처리 정보도 뷰페이지로 전달
		logger.debug("pageVO : "+pageVO);
		model.addAttribute("pageVO", pageVO);
		
		//페이지 이동시 받아온 페이지 번호
		if(cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보 입력
			cri.setPage(pageVO.getEndPage());
		}
		
		List<CsVO> FAQList = aService.FAQList(cri);
		
		model.addAttribute("vo", FAQList);
		
	}
	
	//FAQ 1개정보
	@RequestMapping("/FAQInfo")
	@ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
	public CsVO FAQInfo(@RequestParam("cs_no") Integer cs_no) throws Exception{
		logger.debug("FAQInfo() 호출"+cs_no);
		logger.debug("cs_no@@"+cs_no);
		return aService.FAQInfo(cs_no);
	}
	
	// FAQ 글쓰기 폼
	@RequestMapping(value = "/FAQWriteForm",method = RequestMethod.GET)
	public void FAQWriteForm() throws Exception{
		logger.debug(" FAQWriteForm() 호출 ");
		
	}
	
	//FAQ 글쓰기
	@RequestMapping("/FAQWrite")
	public String FAQWrite(CsVO vo) throws Exception{
		logger.debug("FAQWrite() 호출");
		aService.FAQWrite(vo);
		return "redirect:/admin/FAQList";
	}
	
	//FAQ 수정하기
	@RequestMapping("/FAQInfoUpdate")
	@ResponseBody //ajax(JSON 데이터 넘겨줄때 사용)
	public int FAQInfoUpdate(CsVO vo) throws Exception{
		logger.debug("FAQInfoUpdate() 호출");
		logger.debug("vo@@" + vo);
		
		return aService.FAQInfoUpdate(vo);
	}

}
