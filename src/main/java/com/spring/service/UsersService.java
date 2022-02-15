package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.UsersDao;
import com.spring.dto.UsersDto;

@Service
public class UsersService {

	
	@Autowired
	UsersDao dao;
	public boolean online = false;
	
	public int insertUsers(UsersDto dto) {
		return dao.insertUsers(dto);
	}
	public UsersDto login(UsersDto dto) {
		return dao.login(dto);
		
	}	
	public boolean checkUser(UsersDto dto) {
		int n = dao.checkUser(dto);
		if (n==1) {
			return true;
		}else {
			return false;
		}
	}
	public List<UsersDto> findid(UsersDto dto) {
			return dao.findid(dto);
		}
	public String idCheck(String userid) {
		return dao.idCheck(userid);
	}
	public String nickCheck(String nickname) {
		return dao.nickCheck(nickname);
	}
}
