package com.dapao.persistence;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.ProdVO;
import com.dapao.domain.ReviewVO;
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

	private static final String NAMESPACE = "com.dapao.mapper.AdminMapper";

	@Override
	public UserVO userInfo(String us_id) throws Exception {
		logger.debug("DAO : userInfo(us_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".userInfo", us_id);
	}

	@Override
	public int userStop(UserVO vo) throws Exception {
		logger.debug("DAO : userStop(String us_id, String us_stopdate) 호출");
		return sqlSession.update(NAMESPACE + ".userStop", vo);
	}

	@Override
	public void userStateUpdate(String us_id) throws Exception {
		logger.debug("DAO : userStateUpdate(String us_id) 호출");
		sqlSession.update(NAMESPACE + ".userStateUpdate", us_id);
	}

	@Override
	public int userDelete(String us_id) throws Exception {
		logger.debug("DAO : userDelete(String us_id) 호출");
		return sqlSession.update(NAMESPACE + ".userDelete", us_id);
	}

	@Override
	public List<UserVO> getUserList(Criteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".userListCri", cri);
	}

	@Override
	public int getUserCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".userCount");
	}

	@Override
	public List<EntVO> ownerList(Criteria cri) throws Exception {
		logger.debug(" DAO : ownerList() 호출");

		return sqlSession.selectList(NAMESPACE + ".ownerList", cri);
	}

	@Override
	public EntVO ownerInfo(String own_id) throws Exception {
		logger.debug("DAO : ownerInfo(String own_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".ownerInfo", own_id);
	}

	@Override
	public int ownerApprove(String own_id) throws Exception {
		logger.debug("DAO : ownerApprove(String own_id) 호출");
		return sqlSession.update(NAMESPACE + ".ownerApprove", own_id);
	}

	@Override
	public int ownerInfoDelete(String own_id) throws Exception {
		logger.debug("DAO : ownerInfoDelete(String own_id) 호출");
		return sqlSession.update(NAMESPACE + ".ownerInfoDelete", own_id);
	}

	@Override
	public int noticeCount() throws Exception {
		logger.debug("DAO : noticeCount() 호출");
		return sqlSession.selectOne(NAMESPACE + ".noticeCount");
	}

	@Override
	public List<CsVO> noticeList(Criteria cri) throws Exception {
		logger.debug("DAO : noticeList() 호출");
		return sqlSession.selectList(NAMESPACE + ".noticeList", cri);
	}

	@Override
	public int csUpload(Integer cs_no) throws Exception {
		logger.debug("DAO : csUpload(Integer cs_no) 호출");
		return sqlSession.update(NAMESPACE + ".csUpload", cs_no);
	}

	@Override
	public int csRemove(Integer cs_no) throws Exception {
		logger.debug("DAO : csRemove(Integer cs_no) 호출");
		return sqlSession.update(NAMESPACE + ".csRemove", cs_no);
	}

	@Override
	public void noticeWrite(CsVO vo) throws Exception {
		logger.debug("DAO : noticeWrite()  호출");
		sqlSession.insert(NAMESPACE + ".noticeWrite", vo);
	}

	@Override
	public int csDelete(Integer cs_no) throws Exception {
		logger.debug("DAO : csDelete(Integer cs_no)  호출");
		return sqlSession.delete(NAMESPACE + ".csDelete", cs_no);
	}

	@Override
	public int ownerCount(String own_id) throws Exception {
		logger.debug(" DAO : ownerList() 호출");
		return sqlSession.selectOne(NAMESPACE + ".ownerCount");
	}

	@Override
	public int ownerStop(EntVO vo) throws Exception {
		logger.debug("DAO : ownerStop(EntVO vo) 호출");
		return sqlSession.update(NAMESPACE + ".ownerStop", vo);
	}

	@Override
	public List<CsVO> FAQList(Criteria cri) throws Exception {
		logger.debug("DAO : FAQList() 호출");
		return sqlSession.selectList(NAMESPACE + ".FAQList", cri);
	}

	@Override
	public CsVO csInfo(Integer cs_no) throws Exception {
		logger.debug("DAO : csInfo(Integer cs_no)  호출");
		return sqlSession.selectOne(NAMESPACE + ".csInfo", cs_no);
	}

	@Override
	public void FAQWrite(CsVO vo) throws Exception {
		logger.debug("DAO : FAQWrite()  호출");
		sqlSession.insert(NAMESPACE + ".FAQWrite", vo);
	}

	@Override
	public int csInfoUpdate(CsVO vo) throws Exception {
		logger.debug("DAO : csInfoUpdate(CsVO vo)  호출");
		return sqlSession.update(NAMESPACE + ".csInfoUpdate", vo);
	}

	@Override
	public int FAQCount() throws Exception {
		logger.debug("DAO : FAQCount()  호출");
		return sqlSession.selectOne(NAMESPACE + ".FAQCount");
	}

	@Override
	public List<ReviewVO> reviewList(Criteria cri) throws Exception {
		logger.debug("reviewList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE + ".reviewList", cri);
	}

	@Override
	public int reviewCount(Integer rv_no) throws Exception {
		logger.debug("reviewCount(Integer rv_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".reviewCount", rv_no);
	}

	@Override
	public ReviewVO reviewInfo(Integer rv_no) throws Exception {
		logger.debug("reviewInfo(Integer rv_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".reviewInfo", rv_no);
	}

	@Override
	public int reviewDelete(Integer rv_no) throws Exception {
		logger.debug("reviewDelete(Integer rv_no) 호출");
		return sqlSession.update(NAMESPACE + ".reviewDelete", rv_no);
	}
	
	@Override
	public int itemCount() throws Exception {
		logger.debug("itemCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".itemCount");
	}
	
	@Override
	public List<ItemVO> itemList(Criteria cri) throws Exception {
		logger.debug("itemList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".itemList", cri);
	}
	
	@Override
	public int itemDelete(Integer it_no) throws Exception {
		logger.debug("itemDelete(Integer it_no)");
		return sqlSession.update(NAMESPACE+".itemDelete", it_no);
	}
	
	@Override
	public int prodCount() throws Exception {
		logger.debug("prodCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".prodCount");
	}
	
	@Override
	public List<ProdVO> prodList(Criteria cri) throws Exception {
		logger.debug("prodList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".prodList", cri);
	}
	
	@Override
	public int prodDelete(Integer prod_no) throws Exception {
		logger.debug("prodDelete(Integer prod_no)");
		return sqlSession.update(NAMESPACE+".prodDelete", prod_no);
	}
	
}
