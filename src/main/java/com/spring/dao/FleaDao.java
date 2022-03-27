package com.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.FleaCommDto;
import com.spring.dto.FleaDto;
import com.spring.dto.ImgDto;

@Mapper
public interface FleaDao {

	int fInsert(FleaDto dto);
	List<FleaDto> fList(Map<String, Object> m); 
	int count(); 
	FleaDto fBoard(int f_postno); 
	ImgDto iBoard(int imgid);
	int updateFboard(FleaDto dto);
	int updateImg(ImgDto dto);
	int deleteFboard(int f_postno);
	List<FleaDto> boardListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);
	int fViewCount(int f_postno);
	int imgInsert (ImgDto dto); 
	int laImg();
	List<FleaCommDto> selectComm(int f_postno);
	int insertComm(FleaCommDto dto); 
	int deleteComm(int f_cno);
	int commCount(int f_postno);
	int updateComm(FleaCommDto dto);
	int cLike(FleaCommDto dto);	
	int updateReplyCount(int f_postno);
	String selectMap(int f_postno);
	List<FleaDto> selectMaps();
	String match2(String imgid);
}

