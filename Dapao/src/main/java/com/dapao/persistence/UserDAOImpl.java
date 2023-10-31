package com.dapao.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.AdVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.UserVO;


@Repository
public class UserDAOImpl implements UserDAO {
	
	

	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	@Inject
	private SqlSessionFactory sqlFactroy;
	
	@Inject
	private SqlSession sqlSession;
	
	//==> 디비연결정보 있음(연결 , 해제 자동)
	
	private static final String NAMESPACE
	= "com.dapao.mapper.UserMapper";
	
	
	
	@Override
	public String getTime() {
		//디비연결
		SqlSession sqlSession 
		     = sqlFactroy.openSession();
		
		//SQL작성 & pstmt객체
		//SQL실행
		String time 
		 = sqlSession.selectOne("com.dapao.mapper.userMapper.getTime");
		
		return time;
	}


	@Override
	public void userJoin(UserVO joinVO) {
		// 디비연결-O		
		// SQL작성(Mapper)-O		
		//SQL실행(Mapper 호출)
		//sqlSession.insert(SQL구문);
		//sqlSession.insert(SQL구문,SQL전달할 정보);
		
		sqlSession.insert(NAMESPACE + ".userJoin", joinVO);
		
		
	}


	@Override
	public UserVO userLogin(UserVO loginVO) {
		System.out.println(" DAOImpl : userLogin() 실행 ");
		System.out.println(" DAOImpl : 해당 SQL구문 실행 ");
		
		UserVO resultVO
		   =sqlSession.selectOne(NAMESPACE + ".userLogin",loginVO);	
		
		System.out.println(" DAOImpl : 결과 "+resultVO);
		
		return resultVO;
	}
	


	@Override
	public UserVO userInfo(String sessionUs_id) {
		System.out.println(" DAOImpl : getUser(String sessionUserid) 호출 ");
		
		return sqlSession.selectOne(NAMESPACE + ".userInfo",sessionUs_id);
	}


	@Override
	public void userUpdate(UserVO updateVO) {
		System.out.println(" DAOImpl : userUpdate(UserVO updateVO) 호출");
		
		// SQL구문 호출
		sqlSession.update(NAMESPACE + ".userUpdate", updateVO);
		
		System.out.println(" DAOImpl : 수정완료! ");
		
	}


	@Override
	public int userDelete(UserVO delVO) {
		System.out.println(" DAOImpl : 탈퇴 ");
		
		// 정상   -  0  /   정지 -  1   /  탈퇴  - 2
		// SQL구문 호출		
		return sqlSession.delete(NAMESPACE + ".userDelete",delVO);
	}


//	@Override
//	public AdVO adList() {
//		logger.debug("adList() 호출");
//		
//		return sqlSession.selectOne(NAMESPACE + ".adList");
//	}
//	
//	@Override
//	public ItemVO itemList() {
//		logger.debug("itemList() 호출");
//		
//		return sqlSession.selectOne(NAMESPACE + ".itemList");
//	}
//	
//	@Override
//	public LoveVO loveList(String us_id) {
//		logger.debug("loveList(String us_id) 호출");
//		
//		return sqlSession.selectOne(NAMESPACE + ".loveList",us_id);
//	}

	
	
	
	
	
	
}
