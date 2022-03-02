package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.BoardDto;
import com.spring.dto.FleaDto;
import com.spring.dto.ImgDto;

@Mapper
public interface IndexDao {
	List<BoardDto> boardbest();
	List<FleaDto> fleabest();
	ImgDto getImg(int imgid);
}
