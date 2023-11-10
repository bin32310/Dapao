package com.dapao.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.AcVO;
import com.dapao.domain.AdVO;
import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ExpVO;
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
		logger.debug("DAO : reviewList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE + ".reviewList", cri);
	}

	@Override
	public int reviewCount(Integer rv_no) throws Exception {
		logger.debug("DAO : reviewCount(Integer rv_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".reviewCount", rv_no);
	}

	@Override
	public ReviewVO reviewInfo(Integer rv_no) throws Exception {
		logger.debug("DAO : reviewInfo(Integer rv_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".reviewInfo", rv_no);
	}

	@Override
	public int reviewDelete(Integer rv_no) throws Exception {
		logger.debug("DAO : reviewDelete(Integer rv_no) 호출");
		return sqlSession.update(NAMESPACE + ".reviewDelete", rv_no);
	}
	
	@Override
	public List<AcVO> acList(Criteria cri) throws Exception {
		logger.debug("DAO : acList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".acList", cri);
	}
	
	@Override
	public int acCount(Integer ac_no) throws Exception {
		logger.debug("DAO : acCount(Integer ac_no) 호출");
		return sqlSession.selectOne(NAMESPACE+".acCount", ac_no);
	}
	
	@Override
	public AcVO acInfo(Integer ac_no) throws Exception {
		logger.debug("DAO : acInfo(Integer ac_no) 호출");
		return sqlSession.selectOne(NAMESPACE+".acInfo", ac_no);
	}
	
	// 신고관리 - 접수 처리
	@Override
	public int acHandling(Integer ac_no) throws Exception {
		logger.debug("DAO : acHandling(Integer ac_no) 호출");
		return sqlSession.update(NAMESPACE+".acHandling", ac_no);
	}

	// 신고관리 - 신고 처리상태 업뎃(user 조회)
	@Override
	public String acResultSelectUserId(AcVO vo) throws Exception {
		logger.debug("DAO : acResultSelectUserId(AcVO vo) 호출");
		return sqlSession.selectOne(NAMESPACE+".acResultSelectUserId", vo);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(owner 조회)
	@Override
	public String acResultSelectOwnerId(AcVO vo) throws Exception {
		logger.debug("DAO : acResultSelectOwnerId(AcVO vo) 호출");
		return sqlSession.selectOne(NAMESPACE+".acResultSelectOwnerId", vo);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(user)
	@Override
	public int acResultUserUpdate(AcVO acVo,String stop) throws Exception {
		logger.debug("DAO : acResultOwnerUpdate(AcVO acVo,String stop) 호출");
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("acVo", acVo);
		vo.put("stop", stop);
		return sqlSession.update(NAMESPACE+".acResultUserUpdate", vo);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(owner)
	@Override
	public int acResultOwnerUpdate(AcVO acVo,String stop) throws Exception {
		logger.debug("DAO : acResultOwnerUpdate(AcVO acVo,String stop) 호출");
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("acVo", acVo);
		vo.put("stop", stop);
		logger.debug("allvo"+vo);
		return sqlSession.update(NAMESPACE+".acResultOwnerUpdate", vo);
	}
	
	//신고관리 - 신고 글 쓰기
	@Override
	public int acWrite(AcVO vo) throws Exception {
		logger.debug("DAO :  acWrite(AcVO vo) 호출");
		return sqlSession.insert(NAMESPACE+".acWrite",vo);
	}
	
	// 체험단관리 - 체험단 리스트
	@Override
	public List<ExpVO> expList(Criteria cri) throws Exception {
		logger.debug("DAO :  expList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".expList", cri);
	}
	
	// 체험단관리 - 체험단 글개수 조회
	@Override
	public int expCount(Integer exp_no) throws Exception {
		logger.debug("DAO :  expCount(Integer exp_no) 호출");
		return sqlSession.selectOne(NAMESPACE+".expCount", exp_no);
	}
	
	// 체험단관리 - 체험단 글 1개 정보
	@Override
	public ExpVO expInfo(Integer exp_no) throws Exception {
		logger.debug("DAO :  expInfo(Integer exp_no) 호출");
		return sqlSession.selectOne(NAMESPACE+".expInfo", exp_no);
	}
	
	// 체험단관리 - 상태 업데이트
	@Override
	public void expStateUpdate(Integer exp_no) throws Exception {
		logger.debug("DAO :  expStateUpdate(Integer exp_no) 호출");
		sqlSession.update(NAMESPACE+".expStateUpdate", exp_no);
	}
	
	// 체험단관리 - 광고테이블 insert
	@Override
	public int expAdInsert(String own_id, String ad_date) throws Exception {
		logger.debug("DAO :  expAdInsert(String own_id, String ad_date)호출"+own_id+ad_date);
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("own_id", own_id);
		vo.put("ad_date", ad_date);
		logger.debug("vo"+vo);
		return sqlSession.insert(NAMESPACE+".expAdInsert", vo);
	}
	
	// 체험단관리 - 반려 상태 업뎃
	@Override
	public int expReturn(ExpVO vo) throws Exception {
		logger.debug("DAO :  expReturn(ExpVO vo) 호출");
		return sqlSession.update(NAMESPACE+".expReturn", vo);
	}

}
