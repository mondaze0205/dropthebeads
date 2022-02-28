package com.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MypageDto {

	String userid;
	String pw;
	String nickname;
	String address;
	String email;
	Date birth;
}
