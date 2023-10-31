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
	@RequestMapping(value = "/entJoin",method = RequestMethod.GET)
	public void entJoinGET() {
		logger.debug("GET() 호출");
		
		logger.debug("연결된 view 페이지 호출 (/views/etn/etnJoin.jsp)");
			
	}
	
	@RequestMapping(value = "/entJoin", method = RequestMethod.POST)
	public String entJoinPOST(/* @ModelAttribute */ EntVO vo) throws Exception{
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
	@RequestMapping(value = "/entLogin",method = RequestMethod.GET)
	public void entLoginGET() throws Exception {
		logger.debug("entLoginGET() 호출");
		logger.debug("연결된 view 페이지 호출 (/views/etn/entLogin.jsp)");
	}
	
	@RequestMapping(value = "/entLogin",method = RequestMethod.POST)
	public String entLoginPOST(EntVO vo,HttpSession session) throws Exception {
		logger.debug("entLoginPOST() 호출");
		logger.debug("vo : "+vo);
		
		EntVO resultVO = eService.entLogin(vo);
		logger.debug("resultVO : "+resultVO);
		
		//로그인 실패
		if(resultVO == null) {
			return "redirect:/member/login";
		}
		//로그인 성공 아이디 세션에 저장
		session.setAttribute("own_id", resultVO.getOwn_id());
		
		return "redirect:/ent/entMain";
	}
	
	// http://localhost:8088/ent/entMain
	@RequestMapping(value = "/entMain",method = RequestMethod.GET)
	public void entMainGET(HttpSession session) throws Exception {
		logger.debug("entMainGET() 호출");
		logger.debug("연결된 view 페이지 호출 (/views/etn/entMain.jsp)");
	}
	
	@RequestMapping(value = "/entLogout", method = {RequestMethod.GET, RequestMethod.POST})
	public String entLogoutGET(HttpSession session) {
		logger.debug("logoutGET() 호출");
		
		// 로그아웃 처리 => 세션정보 초기화
		session.invalidate();
		// 메인페이지로 이동
		
		return "redirect:/ent/entMain";
	}
	
    // http://localhost:8088/ent/shopMain
    @RequestMapping(value = "/shopMain", method = RequestMethod.GET)
    public void entMainGET() {
        logger.debug(" shopMainGET() ");
        logger.debug(" 연결된 뷰페이지(/views/ent/shopMain.jsp) 출력 ");
    }

    // http://localhost:8088/ent/productManage
    @RequestMapping(value = "/productManage", method = RequestMethod.GET)
    public void productManageGET() {
        logger.debug(" productManageGET()");
        logger.debug(" 연결된 뷰페이지(/views/ent/productManage.jsp)출력 ");
    }
    // http://localhost:8088/ent/productManage
    @RequestMapping(value = "/productManage", method = RequestMethod.POST)
    public void productManagePOST(ProdVO vo, Model model) throws Exception {
        logger.debug(" productManagerPOST() ");
        logger.debug(" 연결된 뷰페이지(/views/ent/productManage.jsp)출력 ");
        List<ProdVO> plist = pService.searchProd(vo);
        model.addAttribute("plist", plist);

    }

    // http://localhost:8088/ent/order
    @RequestMapping(value = "/entOrder", method = RequestMethod.GET)
    public void orderGET() {
        logger.debug(" entOrderGET() ");
        logger.debug(" 연결된 뷰페이지(/views/entOrder.jsp)출력 ");
    }
	
}
