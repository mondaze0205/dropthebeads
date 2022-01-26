package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.BoardDao;
import com.spring.dto.BoardDto;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;
	
	public List<BoardDto> postList(int start, int end) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		return dao.postList(m);
	}
	
	public int count() {
		return dao.count();
	}
}
