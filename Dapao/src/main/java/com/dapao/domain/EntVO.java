package com.dapao.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EntVO {
	
	private String own_id; // 아이디
	private String own_name; // 이름
	private String own_pw; // 비밀번호
	private String own_tel; //전화번호
	private String own_email; //이메일
	private Integer own_state; // 사업자 상태 
	private String ent_name; // 가게 상호명
	private String ent_cate; // 가게 업종
	private String ent_addr; // 가게 주소
	private String ent_mo; // 통신판매업
	private String ent_file; // 사업자등록증
	private String ent_of; // 기타서류
	private String ent_notice; // 공지사항
	private String ent_info; // 가게소개
	private String ent_img; // 가게 이미지
	private String ent_time; // 가게 운영시간
	private Integer ent_account; // 신고 누적 횟수
	private Integer ent_stop; // 정지 횟수
	
	private List<AdVO> adList;

}
