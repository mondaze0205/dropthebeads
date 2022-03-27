package com.spring.dao;

import java.util.List;
import java.util.Map;

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
	 
	 public String match(String userid);
	 
	 UsersDto userlist(UsersDto dto);
	 int findpw(String userid, String email, String pw);

	 UsersDto showscore(String dto);
	 List<UsersDto> descscore();
	 int upscore(Map<String, Object> mapm);
}
