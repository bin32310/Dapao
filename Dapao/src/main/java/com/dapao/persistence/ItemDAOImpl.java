package com.dapao.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO{
	
	// 디비연결객체 정보를 주입
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Inject
	private SqlSession sqlSession;
	// => 디비연결정보 있음(연결, 해제 자동)
	
	private static final String NAMESPACE
	= "com.dapao.mapper.itemMapper";

	@Override
	public ItemVO itemDetail(Integer it_bno) {
		
		System.out.println("DAOImpl : itemDetail(Integer it_bno) 호출");
		
		return sqlSession.selectOne(NAMESPACE + ".itemDetail", it_bno);
	
	}
	
	
	

}
