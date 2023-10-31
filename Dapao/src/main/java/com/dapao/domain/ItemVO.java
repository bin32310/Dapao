package com.dapao.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Data
public class ItemVO { /* itemDTO */
   
   private Integer it_no; //  판매글 번호 : 가지고 다니기 때문에 Integer 추천
   private String us_id; // 회원 아이디
   
   private String it_title; // 글 제목
   private Integer it_price; // 상품 가격
   private String it_content; // 상품 설명
   private Integer it_view; // 글 조회수
   private String it_con; // 상품 상태
   private String it_cate; // 상품 카테고리
   private Integer it_state; // 글 상태
   private Date it_regdate; // 글 등록시간
   private Date it_outdate; // 글 삭제시간
   private Integer it_love; // 상품 찜수
   private String it_img; // 상품 사진
   

   
   
   
   
   
   
   
   

}
