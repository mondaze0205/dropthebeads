package com.spring.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class FleaDto {
	
	private int f_postno;
	private String f_title;
	private String f_content;
	private int f_viewcount;
	private Date f_date;
	private int imgid;
	private String f_category;
	private int f_price;
	private String f_addr;
	private String userid;
	private int commcnt;
	private int likecnt;
}

