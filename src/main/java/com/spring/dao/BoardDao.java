package com.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.BoardDto;

@Mapper
public interface BoardDao {
	List<BoardDto> postList(Map<String, Object> m);
	int count();
}
