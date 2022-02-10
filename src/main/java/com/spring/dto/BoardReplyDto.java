package com.spring.dto;
import java.util.Date;
import lombok.Data;

@Data
public class BoardReplyDto {
	int replyid;
	int postid;
	String repcon;
	Date replydate;
	String userid;
}
