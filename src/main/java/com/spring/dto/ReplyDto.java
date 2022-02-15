package com.spring.dto;
import java.util.Date;
import lombok.Data;

@Data
public class ReplyDto {
	int replyid;
	int postid;
	String repcon;
	Date replydate;
	String userid;
	String nickname;
}
