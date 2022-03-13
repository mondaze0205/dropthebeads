package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.*;

@Mapper
public interface Mypage2D {
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
}
