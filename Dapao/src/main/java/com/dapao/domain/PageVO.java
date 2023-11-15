package com.dapao.domain;

import com.dapao.domain.ProdVO;
import com.dapao.domain.TradeVO;

import lombok.Data;


/*
 * 페이징처리 (+페이지 블럭)
 * 
 * ex) 총 : 122글 / 페이지당 10개씩 출력
 * 		-> 페이지수 13	/ 페이지블럭개수 10
 * 
 *    		startPage   endPage	    prev    next
 * 	(3ㅍㅇㅈ)	    1		 10			 x	     0
 * 	(10ㅍㅇㅈ)	1		 10			 x	     0
 * 	(12ㅍㅇㅈ)	11		 20->13 	 0	     x	
 * 
 *	endPage = (int)(Math.ceil(page/(double)displayPageNum)*displayPageNum);		Math.cell - 올림	| int - 나머지버림
 *
 *	만약 endPage / 필요한 총페이지수를 비교하여 endPage가 더 클 때
 *	필요한 총 페이지수를 endPage로 설정
 *
 *	startPage = (endPage-displayPageNum)+1;
 *
 *	boolean prev = startPage != 1;  					-> startPage=1이아닐때 true
 *	boolean next = endPage * pageSize < totalCount		
 *
 *	totalCount = db조회 select count()
 * 
 */
@Data
public class PageVO {
	

	private int totalCount;	// 총 글의 수
	private int startPage;	// 페이지 블럭 시작 번호
	private int endPage;	// 페이지 블럭 끝 번호
	private boolean prev;	// 이전
	private boolean next;	// 다음
	
	private int displayPageNum = 10;	// 페이지블럭의 크기(개수)
		
	private Criteria cri;	// 페이지 정보, 페이지 사이즈 저장객체
	
	private ProdVO p_vo; // 상품
	private TradeVO t_vo; // 주문
	
	// get/set
	
	
	// 페이징처리에 필요한 정보를 계산하는 메서드
	public void calcPageData() {
		System.out.println("@@@@@@@@@@@@@@@@@@@@cri : "+cri);
		endPage = (int)( Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum );
		startPage = (endPage-displayPageNum)+1;	
		int tmpEndPage = (int)(Math.ceil(totalCount/(double)cri.getPageSize()));
		
		if(endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}
		
		prev = startPage != 1;
		next = endPage * cri.getPageSize() < totalCount;
		
	} // calcPageData()
	
	

	public boolean isPrev() {
		return prev;
	}

	
	public boolean isNext() {
		return next;
	}
	
	
	
}

