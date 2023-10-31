package com.dapao.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.CsVO;
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
			logger.debug(" DAO : ownerList() 호출");
			
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
		
		@Override
		public EntVO ownerInfo(String own_id) throws Exception {
			logger.debug("DAO : ownerInfo(String own_id) 호출");
			return sqlSession.selectOne(NAMESPACE+".ownerInfo",own_id);
		}
		
		@Override
		public void ownerInfoDelete(String own_id) throws Exception {
			logger.debug("DAO : ownerInfoDelete(String own_id) 호출");
			sqlSession.update(NAMESPACE+".ownerInfoDelete",own_id);
		}
		
		@Override
		public List<CsVO> FAQList() throws Exception {
			logger.debug("DAO : FAQList() 호출");
			return sqlSession.selectList(NAMESPACE+".FAQList");
		}
		
		@Override
		public CsVO FAQInfo(Integer cs_no) throws Exception {
			logger.debug("DAO : FAQInfo(Integer cs_no)  호출");
			return sqlSession.selectOne(NAMESPACE+".FAQInfo", cs_no);
		}
		
		@Override
		public void FAQWrite() throws Exception {
			logger.debug("DAO : FAQWrite()  호출");	
			sqlSession.insert(NAMESPACE+".FAQWrite");
		}
		
		@Override
		public int FAQInfoUpdate(CsVO vo) throws Exception {
			logger.debug("DAO : FAQInfoUpdate(CsVO vo)  호출");
			return sqlSession.update(NAMESPACE+".FAQInfoUpdate", vo);
		}
}
