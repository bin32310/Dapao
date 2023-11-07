package com.dapao.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;

@Repository(value="csDAO")
public class CsDAOImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(CsDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.dapao.mapper.CsMapper";
	
	// 회원이보는 공지사항리스트 수
	public int userNoticeCount() throws Exception{
		logger.debug("userNticeCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".userNoticeCount");
	}
	
	// 회원이보는 공지사항리스트
	public List<CsVO> userNoticeList(Criteria cri) throws Exception{
		logger.debug("userNoticeList() 호출");
		return sqlSession.selectList(NAMESPACE+".userNoticeList", cri);
	}
	
}
