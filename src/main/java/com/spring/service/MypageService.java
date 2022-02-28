package com.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MypageDao;
import com.spring.dto.MypageDto;

@Service
public class MypageService {

	@Autowired
	MypageDao dao;
	
	public int updateMy(MypageDto dto){
		return dao.updateMy(dto);
		//dao의 mypage메서드 호출
	}
	public String nnCheck(String nickname) {
		return dao.nnCheck(nickname);
	}
	public int deletemy(String formpw, MypageDto dto) {
		String pw = dto.getPw();
		if(pw.equals(formpw)) {
			return dao.deletemy(dto.getUserid());
		}else {
			return 0;
		}
	}
	

	
}
