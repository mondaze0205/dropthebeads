package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.UsersDto;

@Mapper
public interface UsersDao {
 
	 int insertUsers(UsersDto dto);
	 UsersDto login(UsersDto dto);
	 List<UsersDto> findid(UsersDto dto);
	 String idCheck(String userid);
	 String nickCheck(String nickname);
	 int checkUser(UsersDto dto);
	 
	 
}
