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
import com.spring.dto.UsersDto;

@Service
public class Mypage2S {
	
	@Autowired
	Mypage2D dao;
	
	public int beforecheck(String userid) {
		return dao.beforecheck(userid);
	}
	
	public int count_b(String userid) {
		return dao.count_b(userid);
	}
	
	public List<BoardDto> mine_b(String userid) {
		return dao.mine_b(userid);
	}
	
	public int count_r(String userid) {
		return dao.count_r(userid);
	}
	
	public List<ReplyDto> mine_r(String userid){
		return dao.mine_r(userid);
	}
	
	public int count_p(String userid) {
		return dao.count_p(userid);
	}
	
	public List<PicDto> mine_p(String userid){
		return dao.mine_p(userid);
	}
	
	public int count_fb(String userid) {
		return dao.count_fb(userid);
	}
	
	public List<FleaDto> mine_fb(String userid){
		return dao.mine_fb(userid);
	}
	
	public int count_fr(String userid) {
		return dao.count_fr(userid);
	}
	
	public List<FleaCommDto> mine_fr(String userid){
		return dao.mine_fr(userid);
	}
	
	public int checkpost(int postid){
		return dao.checkpost(postid);
	}
	
	public int checkpost2(int f_postno){
		return dao.checkpost2(f_postno);
	}
	
	public String pwCheck(String userid) {
		return dao.pwCheck(userid);
	}
	
	public String nnCheck(String nickname) {
		return dao.nnCheck(nickname);
	}
	
	public String nnCheck2(String userid) {
		return dao.nnCheck2(userid);
	}
	
	public String mailCheck(String userid) {
		return dao.mailCheck(userid);
	}
	
	public int update(UsersDto dto){
		return dao.update(dto);
	}
	
	public int pwedit(UsersDto dto) {
		return dao.pwedit(dto);
	}
	
	public int withdraw(String userid) {
		return dao.withdraw(userid);
	}
}
