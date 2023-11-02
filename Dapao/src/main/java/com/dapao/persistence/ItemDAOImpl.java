package com.dapao.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.ItemVO;
import com.dapao.domain.TotalVO;

@Repository
public class ItemDAOImpl implements ItemDAO{

	private static final Logger logger = LoggerFactory.getLogger(ItemDAOImpl.class);
	
	// 디비연결객체 정보를 주입
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Inject
	private SqlSession sqlSession;
	// => 디비연결정보 있음(연결, 해제 자동)
	
	private static final String NAMESPACE
	= "com.dapao.mapper.ItemMapper";
	
	
	// 판매글 작성
	@Override
	public int itemWrite(ItemVO itemVO) {
		logger.debug("DAOImpl : itemWrite(ItemVO itemVO) 호출");
		
		return sqlSession.insert(NAMESPACE + ".itemWrite", itemVO);
	}
	
	//판매글 작성 후 확인
	@Override
	public int itemWriteCheck(String us_id) {
		logger.debug("DAOImpl : itemWriteCheck(String us_id) 호출");
		
		return sqlSession.selectOne(NAMESPACE + ".itemWriteCheck", us_id);
	}
	
	// 판매글 조회 
	@Override
	public TotalVO itemDetail(Integer it_no) {
		System.out.println("DAOImpl : itemDetail(Integer it_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".itemDetail", it_no);
		
	}
	
	// 판매자 다른 물품
	@Override
	public List<ItemVO> sellerItem(TotalVO seller) {
		System.out.println("DAOImpl : sellerItem(ItemVO seller) 호출");
		return sqlSession.selectList(NAMESPACE + ".sellerItem", seller);
	}

	// 비슷한 물품 조회(같은 카테고리)
	@Override
	public List<ItemVO> sameCate(TotalVO item) {
		System.out.println("DAOImpl : sameCate(String it_cate) 호출");
		return sqlSession.selectList(NAMESPACE + ".sameCate", item);
	}
	
	
	
	

}
