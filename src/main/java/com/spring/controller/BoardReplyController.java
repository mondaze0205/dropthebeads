package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.BoardDto;
import com.spring.dto.BoardReplyDto;
import com.spring.service.BoardReplyService;

@Controller
public class BoardReplyController {
	@Autowired
	BoardReplyService service;
	
	
	@GetMapping("/reply/insert")
	@ResponseBody
	public String insertReply(BoardReplyDto dto){
		int i = service.insertReply(dto);
		return i+"";
	}
	
	@GetMapping("/reply/delete/{replyid}")
	@ResponseBody
	public String deleteReply(int replyid) {
		int i = service.deleteReply(replyid);
		return i+"";
	}
	
	
	@GetMapping("/board/write")
	public String boardwrite() {
		return "board/write";
	}
	
	
	@GetMapping("/board/content")
	public String content() {
		return "board/content";
	}
	
	
	@PostMapping("/board/boardwrite")
	public String boardwrite(BoardDto dto) {
		service.boardwrite(dto);
		return "redirect:/board/list";
	}
	
	
	@GetMapping("board/content/{postno}")
	public String boardcontent(@PathVariable int postno, Model m) {
		
		
		List<BoardReplyDto> rlist = service.selectReply(postno);
		m.addAttribute("rlist",rlist);
		return "board/content";
	}
	
}
