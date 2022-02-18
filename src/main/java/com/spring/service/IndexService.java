package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.IndexDao;
import com.spring.dto.BoardDto;

@Service
public class IndexService {
	@Autowired
	IndexDao dao;
	
	public List<BoardDto> boardbest(){
		return dao.boardbest();
	}
}
