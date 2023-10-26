package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.ItemVO;
import com.dapao.persistence.ItemDAO;


@Service
public class ItemServiceImpl implements ItemService {
	
	

	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Inject
	private ItemDAO idao;

	@Override
	public ItemVO itemDetail(Integer it_bno) {
		
		logger.debug("itemDetail(String id) 호출 ");
		
		// 디비동작(DAO)중에서 회원정보 조회
		ItemVO itemVO = idao.itemDetail(it_bno);

		return itemVO;
	}
	
	
	
	
	

	
	
	
	
	
	
	

}
