package com.spring.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UsersDto {
	private String userid;
	private String pw;
	private String nickname;
	private String address;
	private String email;
	@DateTimeFormat(pattern= "yyyyMMdd")
	private Date birth;
}
