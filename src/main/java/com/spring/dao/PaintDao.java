package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.PicDto;

@Mapper
public interface PaintDao {
	int savePicNew(PicDto dto);
	int savePicOld(PicDto dto);
	int lastNum();
	int checkPic(int pictureid);
	PicDto paintLoad(int pictureid);
	List<PicDto> mypaints(String userid);
}
