package com.spring.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {
	private int postid;
	private String userid;
	private String title;
	private String postcon;
	private String pictureid;
	private Date postdate;
	private String readcount;
	private int rec;
	private String head;
}
