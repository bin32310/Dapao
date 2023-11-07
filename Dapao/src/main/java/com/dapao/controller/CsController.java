package com.dapao.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.UserVO;
import com.dapao.service.CsServiceImpl;

@Controller
@RequestMapping(value="/cs/*")
public class CsController {

	private static final Logger logger = LoggerFactory.getLogger(CsController.class);
	
	@Autowired
	private CsServiceImpl cService;
	
	// 회원이보는 공지사항페이지
	// http://localhost:8088/cs/userNoticeList
	@RequestMapping(value="/userNoticeList")
	public void userNotice(Criteria cri, Model model, HttpSession session) throws Exception{
		logger.debug("userNotice() 호출");
		// 페이징처리(페이지 블럭 처리 객체)
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(cService.userNoticeCount());

		model.addAttribute("pageVO", pageVO);

		// 페이지이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보를 입력받음. 글이없음.
			cri.setPage(pageVO.getEndPage());
		}
		List<CsVO> noticeList = cService.userNoticeList(cri);
		// 리스트사이즈확인
		logger.debug(" 글개수 : " + noticeList.size());

		// 페이지정보 view페이지전달
		model.addAttribute("noticeList", noticeList);
		session.setAttribute("viewcntck", "on");

	}
	
		

}
