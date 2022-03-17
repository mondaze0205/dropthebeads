package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.*;

@Mapper
public interface Mypage2D {
	int beforecheck(String userid);
	int count_b(String userid);
	List<BoardDto> mine_b(String userid);
	int count_r(String userid);
	List<ReplyDto> mine_r(String userid);
	int count_p(String userid);
	List<PicDto> mine_p(String userid);
	int count_fb(String userid);
	List<FleaDto> mine_fb(String userid);
	int count_fr(String userid);
	List<FleaCommDto> mine_fr(String userid);
	int checkpost(int postid);
	int checkpost2(int f_postno);
	String pwCheck(String pw);
	String nnCheck(String nickname);
	String nnCheck2(String userid);
	String mailCheck(String userid);
	int update(UsersDto dto);
	int withdraw(String userid);
}
