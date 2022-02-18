package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.BoardDto;

@Mapper
public interface IndexDao {
	List<BoardDto> boardbest();
}
