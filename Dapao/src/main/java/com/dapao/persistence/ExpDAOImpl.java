package com.dapao.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.ExpVO;

@Repository(value="expDAO")
public class ExpDAOImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(ExpDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.dapao.mapper.ExpMapper";
	
	// 사업자 - 체험단 신청처리
	public int ownExp(ExpVO vo) throws Exception{
		return sqlSession.insert(NAMESPACE+".ownExp", vo);
	}

}
