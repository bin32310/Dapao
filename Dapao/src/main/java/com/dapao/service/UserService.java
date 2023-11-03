package com.dapao.service;

import java.util.List;

import com.dapao.domain.AdVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.UserVO;


public interface UserService {

		
// 메인 시작 
	// 인기가게(광고) 목록
	public List<TotalVO> adList();
			
	// 중고거래 목록
	public List<ItemVO> itemList();
	
	// 찜 목록 조회
	public List<TotalVO> loveList(String us_id);
// 메인 끝

	// 회원가입 및 로그인
	// 회원가입 동작 실행
	public void userJoin(UserVO joinVO);
	
	// 로그인 체크 동작
	public UserVO userLogin(UserVO loginVO);
	
	// 회원정보 조회 동작 
	public UserVO userInfo(String us_id); 
	
	
	// 회원가입 아이디 중복확인
	public UserVO userCheckId(String us_id);
	
	
	//회원정보 조회 전 비밀번호 체크
//	public String userInfoCheck(String us_id)throws Exception;
	
	
	// 회원정보 수정
    public void userupdate(UserVO updateVO);
    
    // 회원정보 삭제
    public int userDelete(UserVO deleteVO);

    // 마이페이지 내판매글 조회
    public List<ItemVO> userSellList(String us_id);
	
	
	
}
