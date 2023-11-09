package com.dapao.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.FileVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.ReviewVO;
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
	
	
	// 조회수 증가 
	public int viewCnt(Integer it_no) {
		logger.debug("DAOImpl : viewCnt(Integer it_no) 호출");
		
		return sqlSession.insert(NAMESPACE + ".viewCnt", it_no);
	}
	
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

	// 파일 업로드
	public void insertFile(FileVO fileVO) {
		logger.debug("DAOImpl : insertFile(ItemVO itemVO) 호출");
		
		sqlSession.insert(NAMESPACE + ".insertFile", fileVO);
	}
	
	// 판매자 정보 조회 
	public UserVO sellerInfo(String sellerId) {
		logger.debug("DAOImpl : sellerInfo(String sellerId) 호출");
		return sqlSession.selectOne(NAMESPACE + ".sellerInfo", sellerId);
		
	}
	
	// 판매자 리뷰 조회 
	public List<ReviewVO> sellerRv(ItemVO itemVO) {
		logger.debug("DAOImpl : sellerRv(ItemVO itemVO) 호출");
		return sqlSession.selectList(NAMESPACE + ".sellerRv", itemVO);
		
	}
	
	// 판매물품글 사진 조회 
	public List<FileVO> itemFile(Integer it_no) {
		logger.debug("DAOImpl : itemFile(Integer it_no) 호출");
		return sqlSession.selectList(NAMESPACE + ".itemFile", it_no);
		
	}
	
	// 판매물품글 대표사진 조회 
	public FileVO itemFileMain(Integer it_no) {
		logger.debug("DAOImpl : itemFileMain(Integer it_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".itemFileMain", it_no);
		
	}
	
	// 판매물품글 대표사진 입력
	public int itemFileMainInsert(FileVO vo) {
		logger.debug("DAOImpl : itemFileMainInsert(FileVO vo) 호출");
		return sqlSession.update(NAMESPACE + ".itemFileMainInsert", vo);
	}
	
	// 판매물품글 조회 
	public ItemVO itemDetail(Integer it_no) {
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
	public List<ItemVO> sellerItem(ItemVO itemVO) {
		logger.debug("DAOImpl : sellerItem(ItemVO itemVO) 호출");
		return sqlSession.selectList(NAMESPACE + ".sellerItem", itemVO);
	}

	// 비슷한 물품 조회(같은 카테고리)
	public List<ItemVO> sameCate(ItemVO itemVO) {
		logger.debug("DAOImpl : sameCate(ItemVO itemVO) 호출");
		return sqlSession.selectList(NAMESPACE + ".sameCate", itemVO);
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
