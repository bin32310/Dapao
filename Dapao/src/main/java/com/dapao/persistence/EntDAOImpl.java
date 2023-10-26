package com.dapao.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.EntVO;

@Repository
public class EntDAOImpl implements EntDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(EntDAOImpl.class);
	
	// 디비 접속(Mybatis, mapper, 자원해제)
	@Autowired
	private SqlSession sqlSession;
	// 사용하는 mapper의 이름
	private static final String NAMESPACE = "com.dapao.mapper.EntMapper";
	@Override
	public void entJoin(EntVO vo) throws Exception {
		logger.debug("DAOImpl entJoin() 실행 ");
		sqlSession.insert(NAMESPACE+".entJoin",vo);
		
	}
	@Override
	public EntVO entLogin(EntVO vo) throws Exception {
		logger.debug("DAOImpl entLogin() 실행");
		
		return sqlSession.selectOne(NAMESPACE+".entLogin",vo);
	}
		
}
