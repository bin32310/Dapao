package com.dapao.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dapao.domain.ReviewVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ProdVO;
import com.dapao.service.EntService;
import com.dapao.service.ProdService;

@Controller
@RequestMapping("/ent/*")
public class EntController {

	private static final Logger logger = LoggerFactory.getLogger(EntController.class);

	@Autowired
	private EntService eService;

	@Autowired
	private ProdService pService;

	// http://localhost:8088/ent/entJoin
	@RequestMapping(value = "/entJoin", method = RequestMethod.GET)
	public void entJoinGET() {
		logger.debug("GET() 호출");

		logger.debug("연결된 view 페이지 호출 (/views/etn/etnJoin.jsp)");

	}

	@RequestMapping(value = "/entJoin", method = RequestMethod.POST)
	public String entJoinPOST(/* @ModelAttribute */ EntVO vo) throws Exception {
		logger.debug("entJoinPOST() 호출");
		// 전달정보 저장(회원가입 정보)
		logger.debug("vo : " + vo);

		// DAOImpl -> DB에 정보 저장
		// mdao.insertMember(vo);
		eService.entJoin(vo);

		logger.debug("회원가입 완료!");

		// 로그인 페이지로 이동(redirect)
		return "redirect:/ent/entLogin";
	}

	// http://localhost:8088/ent/entLogin
	@RequestMapping(value = "/entLogin", method = RequestMethod.GET)
	public void entLoginGET() throws Exception {
		logger.debug("entLoginGET() 호출");
		logger.debug("연결된 view 페이지 호출 (/views/etn/entLogin.jsp)");
	}

	@RequestMapping(value = "/entLogin", method = RequestMethod.POST)
	public String entLoginPOST(EntVO vo, HttpSession session) throws Exception {
		logger.debug("entLoginPOST() 호출");
		logger.debug("vo : " + vo);

		EntVO resultVO = eService.entLogin(vo);
		logger.debug("resultVO : " + resultVO);

		// 로그인 실패
		if (resultVO == null) {
			return "redirect:/member/login";
		}
		// 로그인 성공 아이디 세션에 저장
		session.setAttribute("own_id", resultVO.getOwn_id());

		return "redirect:/ent/entMain";
	}

	// http://localhost:8088/ent/entMain
	@RequestMapping(value = "/entMain", method = RequestMethod.GET)
	public void entMainGET(HttpSession session) throws Exception {
		logger.debug("entMainGET() 호출");
		logger.debug("연결된 view 페이지 호출 (/views/etn/entMain.jsp)");
	}

	@RequestMapping(value = "/entLogout", method = { RequestMethod.GET, RequestMethod.POST })
	public String entLogoutGET(HttpSession session) {
		logger.debug("logoutGET() 호출");

		// 로그아웃 처리 => 세션정보 초기화
		session.invalidate();
		// 메인페이지로 이동

		return "redirect:/ent/entMain";
	}

	// http://localhost:8088/ent/shopMain
	@RequestMapping(value = "/shopMain", method = RequestMethod.GET)
	public void shopMainGET(EntVO eVo, ReviewVO rVo, Model model) throws Exception {
		logger.debug(" shopMainGET(EntVO eVO, ProdVO pVO, ReviewVO rVO, Model model) 호출 ");
		String own_id = "6";
		eVo.setOwn_id(own_id);
		logger.debug("eService.listEnt(eVo): " + eService.listEnt(eVo));
		List<ProdVO> plist = pService.listProd(eVo);
		logger.debug(" plist : " + plist);

		model.addAttribute("ent", eService.listEnt(eVo));
		model.addAttribute("plist", plist);

		logger.debug(" 연결된 뷰페이지(/views/ent/shopMain.jsp) 출력 ");
	}

	// http://localhost:8088/ent/shopMainManage
	@RequestMapping(value = "/shopMainManage", method = RequestMethod.GET)
	public void shopMainManageGET(EntVO eVo, Model model) {
		logger.debug(" shopMainManageGET(EntVO eVo, Model model) 호출 ");
		String own_id = "6";
		eVo.setOwn_id(own_id);
		logger.debug(" eVO: " + eVo);
		logger.debug("eService.listEnt(eVo): " + eService.listEnt(eVo));
		model.addAttribute("ent", eService.listEnt(eVo));

		logger.debug(" 연결된 뷰페이지(/views/ent/shopMain.jsp) 출력 ");
	}

	// http://localhost:8088/ent/shopMainManage
	@RequestMapping(value = "/shopMainManage", method = RequestMethod.POST)
	public void shopMainManagePOST(EntVO eVo, Model model) {
		logger.debug(" shopMainManagePOST(EntVO eVo, Model model) 호출 ");
		String id = "6";
		eVo.setOwn_id(id);
		logger.debug(" eVo : " + eVo);
		eService.entUpdate(eVo);
		logger.debug("eService.listEnt(eVo): " + eService.listEnt(eVo));
		model.addAttribute("ent", eService.listEnt(eVo));

		logger.debug(" 연결된 뷰페이지(/views/ent/shopMainManage.jsp) 출력 ");
	}

	// http://localhost:8088/ent/productManage
	@RequestMapping(value = "/productManage", method = RequestMethod.GET)
	public void productManageGET(HttpSession session) {
		logger.debug(" productManageGET()");
		logger.debug(" 연결된 뷰페이지(/views/ent/productManage.jsp)출력 ");
		Integer modal_cate = 0;
		session.setAttribute("modal_cate", modal_cate);
		session.setAttribute("own_id", 6);
	}

	// http://localhost:8088/ent/productManage
	@RequestMapping(value = "/productManage", method = RequestMethod.POST)
	public void productManagePOST(ProdVO vo, EntVO eVO, Model model) throws Exception {
		logger.debug(" productManagerPOST() ");
		logger.debug(" vo : " + vo);
		List<ProdVO> plist = pService.searchProd(vo);
		Integer modal_cate = 0;
		eVO.setOwn_id("6");
		model.addAttribute("ent", eVO);
		model.addAttribute("plist", plist);
		model.addAttribute("modal_cate", modal_cate);

		logger.debug(" 연결된 뷰페이지(/views/ent/productManage.jsp)출력 ");
	}

	// http://localhost:8088/ent/entOrder
	@RequestMapping(value = "/entOrder", method = RequestMethod.GET)
	public void orderGET() {
		logger.debug(" entOrderGET() ");
		logger.debug(" 연결된 뷰페이지(/views/entOrder.jsp)출력 ");
	}

	@RequestMapping(value = "/productUpdate", method = RequestMethod.POST)
	public String productUpdatePOST(ProdVO vo, Integer modal_cate) throws Exception {
		logger.debug(" productUpdatePOST() 호출 ");
		logger.debug(" vo : " + vo);
		logger.debug(" modal_cate : " + modal_cate);
		if (modal_cate == 1) {
			pService.updateProd(vo);
			logger.debug(" update ");
		} else {
			pService.insertProd(vo);
			logger.debug(" insert ");
		}
		return "redirect:/ent/productManage";
	}

}
