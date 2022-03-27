package com.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.*;

@Mapper
public interface BoardDao {
	//°Ô½ÃÆÇ crud
	List<BoardDto> postList(Map<String, Object> m);
	int count();
	int boardwrite(BoardDto dto);
	BoardDto dtobypostid(int postid);
	int readcountplus(int postid);
	int recplus(int postid);
	int recregist(Map<String, Object> m);
	int reccheck(Map<String, Object> m);
	int boardupdate(BoardDto dto);
	int boarddelete(int postid);
	//´ñ±Û crud
	List<ReplyDto> selectReply(int postid);
	int countReply(int postid);
	int insertReply(ReplyDto dto);
	int deleteReply(int replyid);
	List<UsersDto> descscore();
}
