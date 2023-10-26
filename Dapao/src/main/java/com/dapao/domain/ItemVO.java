package com.dapao.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Data
public class ItemVO { /* itemDTO */
	
	private Integer it_no; // 가지고 다니기 때문에 Integer 추천
	private String us_id;
	
	private String it_title;
	private Integer it_price;
	private String it_content;
	private Integer it_view;
	private String it_state;
	private String it_cate;
	private String it_addr;
	private String it_botime;
	private Integer it_love;
	
	private String it_img;
	

	
	
	
	
	
	
	
	

}
