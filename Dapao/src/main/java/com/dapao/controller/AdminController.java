package com.dapao.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import com.dapao.domain.ReviewVO;
import com.dapao.domain.UserVO;
import com.dapao.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService aService;

	// 모든회원리스트정보출력 ( 페이징처리 + 페이지블럭처리 )
	// http://localhost:8088/admin/userList
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void listPageGET(Criteria cri, Model model, HttpSession session) throws Exception {
		// 페이징처리(페이지 블럭 처리 객체)
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(aService.getUserCount());

		model.addAttribute("pageVO", pageVO);

		// 페이지이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보를 입력받음. 글이없음.
			cri.setPage(pageVO.getEndPage());
		}

		List<UserVO> userList = aService.getUserList(cri);
		// 리스트사이즈확인
		logger.debug(" 글개수 : " + userList.size());

		// 페이지정보 view페이지전달
		model.addAttribute("userList", userList);
		session.setAttribute("viewcntck", "on");
	}

	// 회원개인정보출력
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	@ResponseBody // ajax(JSON 데이터 넘겨줄때 사용)
	public UserVO userInfo(@RequestParam("us_id") String us_id) throws Exception {

		// 전달정보저장 - userid
		logger.debug("us_id : " + us_id);

		logger.debug("개인회원정보@@@@@@@@@@@@@@ : " + aService.userInfo(us_id));

		// 개인정보출력
		return aService.userInfo(us_id);
	}

	// 회원정지부여
	@ResponseBody
	@RequestMapping(value = "/userStop")
	public int userStop(@RequestParam("us_id") String us_id, @RequestParam("us_stopdate") String us_stopdate)
			throws Exception {
		logger.debug("us_id, us_stopdate : " + us_id + "," + us_stopdate);

		UserVO vo = new UserVO();
		vo.setUs_id(us_id);
		vo.setUs_stopdate(us_stopdate);

		aService.userStateUpdate(us_id);

		return aService.userStop(vo);
	}

	// 회원탈퇴처리
	@ResponseBody
	@RequestMapping(value = "/userDelete")
	public int userDelete(@RequestParam("us_id") String us_id) throws Exception {
		logger.debug("탈퇴처리 us_id : " + us_id);
		return aService.userDelete(us_id);
	}

	// http://localhost:8088/admin/ownerList
	// 사업자 리스트 출력
	@RequestMapping("/ownerList")
	public void ownerListGET(Criteria cri,Model model, String own_id) throws Exception{
		logger.debug("ownerListGET() 호출");

		// 페이징 처리( 페이지 블럭 처리 객체 )
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(aService.ownerCount(own_id));

		// 페이징처리 정보도 뷰페이지로 전달
		logger.debug("pageVO : " + pageVO);
		model.addAttribute("pageVO", pageVO);

		// 페이지 이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보 입력
			cri.setPage(pageVO.getEndPage());
		}

		List<EntVO> ownerList = aService.ownerList(cri);

		model.addAttribute("vo", ownerList);

	}

	// 사업자 1명의 정보 출력
	@RequestMapping("/ownerInfo")
	@ResponseBody // ajax(JSON 데이터 넘겨줄때 사용)
	public EntVO ownerInfoGET(@RequestParam("own_id") String own_id) throws Exception {
		logger.debug("ownerInfoGET() 호출");
		return aService.ownerInfo(own_id);
	}

	// 사업자 정지부여
	@ResponseBody
	@RequestMapping(value = "/ownerStop")
	public int ownerStop(EntVO vo) throws Exception {
		logger.debug("ownerStop() 호출");
		logger.debug("vo : "+vo);
		return aService.ownerStop(vo);
	}
	
	// 사업자 승인
	@RequestMapping("/ownerApprove")
	@ResponseBody
	public int ownerApprove(String own_id) throws Exception {
		logger.debug("ownerApprove() 호출");
		return aService.ownerApprove(own_id);
	}

	// 사업자 탈퇴
	@RequestMapping("/ownerInfoDelete")
	@ResponseBody
	public int ownerInfoDeleteGET(String own_id) throws Exception{
		logger.debug("ownerInfoDeleteGET() 호출");
		logger.debug(""+aService.ownerInfoDelete(own_id));
		return aService.ownerInfoDelete(own_id);
	}

	// cs 1개정보
	@RequestMapping("/csInfo")
	@ResponseBody // ajax(JSON 데이터 넘겨줄때 사용)
	public CsVO csInfo(@RequestParam("cs_no") Integer cs_no) throws Exception {
		logger.debug("csInfo() 호출" + cs_no);
		logger.debug("cs_no@@" + cs_no);
		return aService.csInfo(cs_no);
	}

	// cs 수정하기
	@RequestMapping("/csInfoUpdate")
	@ResponseBody // ajax(JSON 데이터 넘겨줄때 사용)
	public int csInfoUpdate(CsVO vo) throws Exception {
		logger.debug("csInfoUpdate() 호출");
		logger.debug("vo@@" + vo);
		return aService.csInfoUpdate(vo);
	}
	
	// cs 삭제하기
	@ResponseBody
	@RequestMapping(value="/csDelete")
	public int csDelete(@RequestParam("cs_no") Integer cs_no) throws Exception{
		logger.debug("전달받은 cs_no : "+cs_no);		
		return aService.csDelete(cs_no);
	}

	// cs 등록하기
	@RequestMapping("/csUpload")
	@ResponseBody
	public int csUpload(@RequestParam("cs_no") Integer cs_no) throws Exception {
		logger.debug("csUpload() 호출");
		logger.debug("csUpload() 컨트롤러 ajax전달값 : "+cs_no);
		logger.debug("csUpload() 컨트롤러 result : "+aService.csUpload(cs_no));
		return aService.csUpload(cs_no);
	}

	// cs 등록해제
	@RequestMapping("/csRemove")
	@ResponseBody
	public int csRemove(@RequestParam("cs_no") Integer cs_no) throws Exception {
		logger.debug("csRemove() 호출");
		logger.debug("csUpload() 컨트롤러 result : "+aService.csRemove(cs_no));
		return aService.csRemove(cs_no);
	}

	// FAQ 리스트
	// http://localhost:8088/admin/FAQList
	@RequestMapping("/FAQList")
	public void FAQList(Criteria cri, Model model) throws Exception {
		logger.debug("FAQList() 호출");

		// 페이징 처리( 페이지 블럭 처리 객체 )
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(aService.FAQCount());

		// 페이징처리 정보도 뷰페이지로 전달
		logger.debug("pageVO : " + pageVO);
		model.addAttribute("pageVO", pageVO);

		// 페이지 이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보 입력
			cri.setPage(pageVO.getEndPage());
		}

		List<CsVO> FAQList = aService.FAQList(cri);

		model.addAttribute("vo", FAQList);
	}
	
	// FAQ 글쓰기 폼
	@RequestMapping(value = "/FAQWriteForm", method = RequestMethod.GET)
	public void FAQWriteForm() throws Exception {
		logger.debug(" FAQWriteForm() 호출 ");

	}

	// FAQ 글쓰기
	@RequestMapping("/FAQWrite")
	public String FAQWrite(CsVO vo) throws Exception {
		logger.debug("FAQWrite() 호출");
		aService.FAQWrite(vo);
		return "redirect:/admin/FAQList";
	}

	// 공지사항 작성페이지 폼
	// http://localhost:8088/admin/noticeWriteForm
	@RequestMapping(value = "/noticeWriteForm")
	public void noticeWriteForm() throws Exception {
		logger.debug(" FAQWriteForm() 호출 ");
	}
	
	// 공지사항 글쓰기
	@RequestMapping("/noticeWrite")
	public String noticeWrite(CsVO vo) throws Exception {
		logger.debug("FAQWrite() 호출");
		aService.noticeWrite(vo);
		return "redirect:/admin/noticeList";
	}
	
	// 리뷰관리 - 리뷰 리스트
	@RequestMapping("/reviewList")
	public void reviewList(Criteria cri,Model model,Integer rv_no) throws Exception{
		logger.debug("reviewList() 호출");
		
		// 페이징 처리( 페이지 블럭 처리 객체 )
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(aService.reviewCount(rv_no));
		
		// 페이징처리 정보도 뷰페이지로 전달
		logger.debug("pageVO : "+pageVO);
		model.addAttribute("pageVO", pageVO);
		
		//페이지 이동시 받아온 페이지 번호
		if(cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보 입력
			cri.setPage(pageVO.getEndPage());
		}
		
		List<ReviewVO> reviewList = aService.reviewList(cri);
		logger.debug(""+reviewList);
		
		model.addAttribute("vo", reviewList);
	}
	
	// 리뷰관리 - 1개정보
	@RequestMapping("/reviewInfo")
	@ResponseBody // ajax(JSON 데이터 넘겨줄때 사용)
	public ReviewVO reviewInfo(@RequestParam("rv_no") Integer rv_no) throws Exception {
		logger.debug("reviewInfo() 호출" + rv_no);
		logger.debug("rv_no@@" + rv_no);
		return aService.reviewInfo(rv_no);
	}
	
	// 리뷰관리 - 리뷰 삭제
	@RequestMapping("/reviewDelete")
	@ResponseBody
	public int reviewDelete(Integer rv_no) throws Exception{
		logger.debug("reviewDelete()");
		return aService.reviewDelete(rv_no);
	}

	// 공지사항 리스트
	// http://localhost:8088/admin/noticeList
	@RequestMapping(value = "/noticeList")
	public void noticeList(Criteria cri, Model model) throws Exception {

		// 페이징 처리( 페이지 블럭 처리 객체 )
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(aService.noticeCount());

		// 페이징처리 정보도 뷰페이지로 전달
		logger.debug("pageVO : " + pageVO);
		model.addAttribute("pageVO", pageVO);

		// 페이지 이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보 입력
			cri.setPage(pageVO.getEndPage());
		}

		List<CsVO> noticeList = aService.noticeList(cri);

		model.addAttribute("noticeList", noticeList);
    }
}
