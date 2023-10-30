package com.dapao.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.EntVO;

@Repository
public class EntDAOImpl implements EntDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(EntDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;
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
	@Override
	public void entUpdate(EntVO vo) {
		logger.debug(" DAO -> EntUpdate(EntVO vo) 호출 ");
		sqlSession.update(NAMESPACE+".entUpdate",vo );
	}
	@Override
	public List<EntVO> listEnt(EntVO vo) {
		logger.debug(" DAO listEnt(String own_id) 호출 ");
		return sqlSession.selectList(NAMESPACE+".listEnt", vo);
	}
	
}
