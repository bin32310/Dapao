package com.dapao.domain;



import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
@Data
public class UserVO {/*UserDTO*/

	    
		//  회원
		
		private String us_id;   
		private String us_pw;
		private String us_name;
		private String us_nickname;
		private String us_img;
		private String us_tel;  
		private String us_email;
		private String us_addr;
		private Integer us_coin;
		private String us_blog;
		private String us_instar;
		private Date regdate;    
		private Date outdate;
		private Integer us_state;
		private String us_stopdate;
		private Integer us_account;
		private Integer us_stop;
		
		
		
		// 회원판매글
		
		
		
	
	
}
