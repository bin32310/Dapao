package com.dapao.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.UserVO;

@Repository(value = "itemDAO")
public class ItemDAOImpl{

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
	public int itemWrite(ItemVO itemVO) {
		logger.debug("DAOImpl : itemWrite(ItemVO itemVO) 호출");
		
		return sqlSession.insert(NAMESPACE + ".itemWrite", itemVO);
	}
	
	//판매글 작성 후 확인
	public int itemWriteCheck(String us_id) {
		logger.debug("DAOImpl : itemWriteCheck(String us_id) 호출");
		
		return sqlSession.selectOne(NAMESPACE + ".itemWriteCheck", us_id);
	}
	
	// 판매물품글 조회 
	public TotalVO itemDetail(Integer it_no) {
		logger.debug("DAOImpl : itemDetail(Integer it_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".itemDetail", it_no);
		
	}
	

	// 찜 여부 확인
	public int itemLove(ItemVO itemLove) {
		logger.debug("itemLove(ItemVO itemLove) 호출");
		return sqlSession.selectOne(NAMESPACE + ".itemLove", itemLove );
	}
	
	// 찜 등록
	public int itemLoveInsert(LoveVO loveVO) {
		
		logger.debug("itemLoveInsert(LoveVO loveVO) 호출");
		return sqlSession.insert(NAMESPACE + ".itemLoveInsert", loveVO );
		
	}
	
	// 찜 삭제
	public int itemLoveDelete(LoveVO loveVO) {
		
		logger.debug("itemLoveDelete(LoveVO loveVO) 호출");
		return sqlSession.delete(NAMESPACE + ".itemLoveDelete", loveVO );
		
	}
	
	// 판매물품글 검색 조회 
	public List<ItemVO> itemSearch(String it_title) {
		logger.debug("DAOImpl : itemSearch(String search) 호출");
		return sqlSession.selectList(NAMESPACE + ".itemSearch", it_title);
		
	}
	
	// 판매물품글 카테고리 조회 
	public List<ItemVO> itemCate(String it_cate) {
		logger.debug("DAOImpl : itemCate(String it_cate) 호출");
		return sqlSession.selectList(NAMESPACE + ".itemCate", it_cate);
		
	}
	
	// 판매자 다른 물품
	public List<ItemVO> sellerItem(TotalVO seller) {
		logger.debug("DAOImpl : sellerItem(ItemVO seller) 호출");
		return sqlSession.selectList(NAMESPACE + ".sellerItem", seller);
	}

	// 비슷한 물품 조회(같은 카테고리)
	public List<ItemVO> sameCate(TotalVO item) {
		logger.debug("DAOImpl : sameCate(String it_cate) 호출");
		return sqlSession.selectList(NAMESPACE + ".sameCate", item);
	}
	
	// 판매자 프로필
	public UserVO yourInfo(String us_id) {
		logger.debug("DAOImpl : yourInfo(String us_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".yourInfo", us_id);
	}

	
	// 판매자 판매 물품 목록
	public List<ItemVO> yourItem(String us_id) {
		logger.debug("DAOImpl : yourItem(String us_id) 호출");
		return sqlSession.selectList(NAMESPACE + ".yourItem", us_id);
	}

	
	
	
	

}
