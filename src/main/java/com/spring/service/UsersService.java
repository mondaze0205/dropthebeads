package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.spring.dao.UsersDao;
import com.spring.dto.UsersDto;

@Service
public class UsersService {

	@Autowired
	UsersDao dao;
	
	public String match(String userid) {
		Gson g = new Gson();
		JsonObject j = new JsonObject();
		j.addProperty("nickname", dao.match(userid));
		return g.toJson(j);
	}

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
	
	public int findpw(String userid, String email, String pw) {
		return dao.findpw(userid, email, pw);
	}
	public UsersDto userlist(UsersDto dto) {
		return dao.userlist(dto);
	}
	

	public UsersDto showscore(String dto) {
		return dao.showscore(dto);
	}
	public List<UsersDto> descscore(){
		return dao.descscore();
	}
	public int upscore(int gscore, String userid) {
		Map<String, Object> mapm = new HashMap<>();
		mapm.put("gscore", gscore);
		mapm.put("userid", userid);
		return dao.upscore(mapm);
	}
}
