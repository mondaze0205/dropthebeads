package com.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.*;

@Mapper
public interface BoardDao {
	List<BoardDto> postList(Map<String, Object> m);
	int count();
	int checkPic(int pictureid);
	int savePicNew(PicDto dto);
	int savePicOld(PicDto dto);
	int lastNum();
	PicDto paintLoad(int pictureid);
}
