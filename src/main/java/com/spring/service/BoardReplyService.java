package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.BoardReplyDao;
import com.spring.dto.BoardDto;
import com.spring.dto.BoardReplyDto;

@Service
public class BoardReplyService {
	@Autowired
	BoardReplyDao dao;
	
	public List<BoardReplyDto> selectReply(int postid){
		return dao.selectReply(postid);
	}
	
	public int insertReply(BoardReplyDto dto){
		return dao.insertReply(dto);
	}
	
	public int deleteReply(int replyid) {
		return dao.deleteReply(replyid);
	}
	
	public int boardwrite(BoardDto dto) {
		return dao.boardwrite(dto);
	}
}

