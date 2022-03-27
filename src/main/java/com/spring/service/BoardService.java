package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.spring.dao.BoardDao;
import com.spring.dto.*;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;
	
	public List<BoardDto> postList(int start, int end, int head, int rec, int searchType, String searchWord) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		m.put("head", head);
		m.put("rec", rec);
		m.put("searchtype", searchType);
		m.put("searchword", searchWord);
		return dao.postList(m);
	}
	
	public int count() {
		return dao.count();
	}
	
	public int boardwrite(BoardDto dto) {
		return dao.boardwrite(dto);
	}
	
	public BoardDto dtobypostid(int postid) {
		return dao.dtobypostid(postid);
	}
	
	public int readcountplus(int postid) {
		return dao.readcountplus(postid);
	}
	
	public String recplus(int postid, String userid) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("postid", postid);
		m.put("userid", userid);
		
		Gson g = new Gson();
		JsonObject j = new JsonObject();
		
		if(dao.reccheck(m) == 0) {
			dao.recplus(postid);
			dao.recregist(m);
			j.addProperty("result", "추천했습니다.");
		} else {
			j.addProperty("result", "이미 추천하셨습니다.");
		}
		
		return g.toJson(j);
	}
	
	
	public int boardupdate(BoardDto dto) {
		return dao.boardupdate(dto);
	}
	
	public int boarddelete(int postid) {
		return dao.boarddelete(postid);
	}
	
	public List<ReplyDto> selectReply(int postid){
		return dao.selectReply(postid);
	}
	
	public int countReply(int postid) {
		return  dao.countReply(postid);
	}
	
	public int insertReply(ReplyDto dto){
		return dao.insertReply(dto);
	}
	
	public int deleteReply(int replyid) {
		return dao.deleteReply(replyid);
	}
	
	public List<UsersDto> descscore(){
		return dao.descscore();
	}
}
