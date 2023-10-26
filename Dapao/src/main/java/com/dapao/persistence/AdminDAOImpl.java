package com.dapao.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;

@Service
public class AdminDAOImpl implements AdminDAO {
	// 디비연결객체 정보를 주입

		private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
		
		@Inject
		private SqlSessionFactory sqlFactory;
		// => 디비연결정보만 가지고 있음(연결 수동)
		
		@Inject
		private SqlSession sqlSession;
		// => 디비연결정보 있음(연결,해제 자동)
		
		private static final String NAMESPACE 
			="com.dapao.mapper.AdminMapper";

		@Override
		public List<EntVO> ownerList() throws Exception{
			logger.debug(" DAOImpl : ownerList() 호출");
			
			return sqlSession.selectList(NAMESPACE+".ownerList");
		}
		
		@Override
		public List<UserVO> getAllUser() throws Exception {
			logger.debug("Service의호출로 DAO호출");
			return sqlSession.selectList(NAMESPACE+".getAllUser");
		}
		
		@Override
		public UserVO userInfo(String us_id) throws Exception {
			logger.debug("Service의호출로 DAO호출");
			return sqlSession.selectOne(NAMESPACE+".userInfo", us_id);
		}
		
}
