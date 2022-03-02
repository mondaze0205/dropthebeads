package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.IndexDao;
import com.spring.dto.BoardDto;
import com.spring.dto.FleaDto;
import com.spring.dto.ImgDto;

@Service
public class IndexService {
	@Autowired
	IndexDao dao;
	
	public List<BoardDto> boardbest(){
		return dao.boardbest();
	}
	
	public List<FleaDto> fleabest(){
		return dao.fleabest();
	}
	
	public ImgDto getImg(int imgid) {
		return dao.getImg(imgid);
	}
}
