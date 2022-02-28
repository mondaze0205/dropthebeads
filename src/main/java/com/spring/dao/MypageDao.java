package com.spring.dao;


import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.MypageDto;

@Mapper
public interface MypageDao {
	
	int updateMy(MypageDto dto);
	String nnCheck(String nickname);
	int deletemy(String id);
}
