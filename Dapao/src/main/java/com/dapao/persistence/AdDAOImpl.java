package com.dapao.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository(value = "AdDAO")
public class AdDAOImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(AdDAOImpl.class);
	
	@Inject
	private SqlSessionFactory sqlFactory;

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.dapao.mapper.AdMapper";
	
	
	public String modalShow() throws Exception{
		logger.debug("DAO : modalShow() 호출");
		return sqlSession.selectOne(NAMESPACE+".modalShow");
	}
}
