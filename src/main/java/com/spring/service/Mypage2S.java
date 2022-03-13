package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.Mypage2D;
import com.spring.dto.BoardDto;
import com.spring.dto.FleaCommDto;
import com.spring.dto.FleaDto;
import com.spring.dto.PicDto;
import com.spring.dto.ReplyDto;

@Service
public class Mypage2S {
	
	@Autowired
	Mypage2D dao;
	
	public int count_b(String userid) {
		return dao.count_b(userid);
	}
	
	public List<BoardDto> mine_b(String userid) {
		return dao.mine_b(userid);
	}
	
	public int count_r(String userid) {
		return dao.count_b(userid);
	}
	
	public List<ReplyDto> mine_r(String userid){
		return dao.mine_r(userid);
	}
	
	public int count_p(String userid) {
		return dao.count_b(userid);
	}
	
	public List<PicDto> mine_p(String userid){
		return dao.mine_p(userid);
	}
	
	public int count_fb(String userid) {
		return dao.count_b(userid);
	}
	
	public List<FleaDto> mine_fb(String userid){
		return dao.mine_fb(userid);
	}
	
	public int count_fr(String userid) {
		return dao.count_b(userid);
	}
	
	public List<FleaCommDto> mine_fr(String userid){
		return dao.mine_fr(userid);
	}
}
