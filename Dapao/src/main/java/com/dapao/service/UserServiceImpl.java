package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.AdVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.UserVO;
import com.dapao.persistence.UserDAO;




@Service
public class UserServiceImpl implements UserService {

		private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	// BoardDAO 객체 주입
	@Inject
	private UserDAO udao;
		
	
	
	
	
	@Override
	public UserVO userLogin(UserVO loginVO) {
		logger.debug("컨트롤러 호출로 DAO 메서드를 호출하겠다.");
		UserVO resultVO = udao.userLogin(loginVO);
		
		logger.debug("DAO의 처리 결과를 컨트롤러로 전달하겠다.");		
		return resultVO;
	}

	@Override
	public UserVO userInfo(String id) {
		logger.debug("userInfo(String id)  호출");   //4번
	//디비동착 (DAO)에서 회원정보 조회
	UserVO resultVO =	udao.userInfo(id); // 위에서 받은 정보를 여기로 전달 5번
		
		// return udao.getUser(id);;
		return resultVO;
	}

	@Override
	public void userupdate(UserVO updateVO) {
		logger.debug("userUpdate(updateVo) 호출");
		
		udao.userUpdate(updateVO);
		
	}

	@Override
	public int userDelete(UserVO deleteVO) {
		logger.debug("userDelete(deleteVO) 호출");
		int result = 	udao.userDelete(deleteVO);
		
		return result;
	}

	@Override
	public void userJoin(UserVO joinVO) {
		logger.debug("userJoin(joinVO) 호출"); 
		
		udao.userJoin(joinVO);
		
	}


	@Override
	public AdVO adList() {
		logger.debug("adList() 호출");
		
		return udao.adList();
	}
	
	@Override
	public ItemVO itemList() {
		logger.debug("itemList() 호출");
		
		return udao.itemList();
	}
	
	@Override
	public LoveVO loveList(String us_id) {
		logger.debug("loveList(String us_id) 호출");
		
		return udao.loveList(us_id);
	}
	
	

	
 

}
