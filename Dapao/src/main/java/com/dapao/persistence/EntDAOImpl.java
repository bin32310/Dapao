package com.dapao.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.TradeVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class EntDAOImpl implements EntDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(EntDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.dapao.mapper.EntMapper";
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
	@Override
	public List<TradeVO> searchTrade(PageVO vo) {
		logger.debug("DAO listTrade(String own_id) 호출 ");
		return sqlSession.selectList(NAMESPACE+".searchTrade", vo);
	}
	@Override
	public int searchTradeCount(PageVO vo) {
		logger.debug(" DAO searchTradeCount(PageVO vo) 호출 ");
		return sqlSession.selectOne(NAMESPACE+".searchTradeCount", vo);
	}
	@Override
	public void refund(TradeVO vo) {
		logger.debug(" DAO refund(TradeVO vo) 호출 ");
		sqlSession.delete(NAMESPACE+".refund", vo);
	}
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
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception {
		String api_key = "NCSGDCUBZEFNPZLV";
	    String api_secret = "I17GY2WCK9VFSXGOIWUIHIA55VTEHNLS";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "010-3186-8926");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[Dapao] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
		
	}
	@Override
	public Integer checkId(String own_id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".checkId", own_id);
	}
	
	@Override
	public EntVO ownInfo(String own_id) throws Exception {
		logger.debug("DAOImpl ownInfo() 실행"); 
		
		return sqlSession.selectOne(NAMESPACE+".ownInfo",own_id);
	}
	
}
