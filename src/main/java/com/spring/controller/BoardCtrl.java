package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.BoardService;
import com.google.gson.Gson;
import com.spring.dto.*;

@Controller
public class BoardCtrl {
	
	@Autowired 
	BoardService service;
	
	@RequestMapping("/board")
	public String board() {
		return "redirect:/board/list";
	}
	
	@RequestMapping("/board/list")
	public String postList(@RequestParam(name="h", defaultValue="0") int head, 
			@RequestParam(name="p", defaultValue="1") int page, 
			@RequestParam(name="r", defaultValue="0") int rec, 
			@RequestParam(name="t", defaultValue="0") int searchType,
			@RequestParam(name="w", defaultValue="") String searchWord, Model m) {
		
		int count = service.count();
		if(count > 0) {
			int perPage = 10;
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			
			List<BoardDto> postList = service.postList(startRow, endRow, head, rec, searchType, searchWord);
			m.addAttribute("postList", postList);
			
			int pageNum = 5;
			int totalPages = count/perPage + (count%perPage > 0? 1:0);
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			
			if(end > totalPages) {
				end = totalPages;
			}
			
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("count", count);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		
		List<UsersDto> rank = service.descscore();
		m.addAttribute("rank", rank);
		
		return "board/list";
	}
	
	@GetMapping("/board/writeform")
	public String writeform() {
		return "board/write";
	}
	
	@GetMapping("/board/paintLoadAtWrite")
	public String paintLoadAtWrite() {
		return "board/loader";
	}
	
	@PostMapping("/board/write")
	public String boardwrite(BoardDto dto) {
		service.boardwrite(dto);
		return "redirect:/board/list";
	}
	
	@GetMapping("board/content/{postid}")
	public String boardcontent(@PathVariable int postid, Model m) {
		service.readcountplus(postid);
		BoardDto dto = service.dtobypostid(postid);
		List<ReplyDto> rlist = service.selectReply(postid);
		int countReply = service.countReply(postid);
		m.addAttribute("rlist", rlist);
		m.addAttribute("dto", dto);
		m.addAttribute("countReply", countReply);
		return "board/content";
	}
	
	@PostMapping("/board/updateform")
	public String updateform(int postid, Model m) {
		BoardDto dto = service.dtobypostid(postid);
		m.addAttribute("dto", dto);
		return "board/update";
	}
	
	@PostMapping("/board/update")
	public String update(BoardDto dto) {
		service.boardupdate(dto);
		return "redirect:/board/list";
	}
	
	@PostMapping("/board/delete")
	public String boarddelete(int postid) {
		service.boarddelete(postid);
		return "redirect:/board/list";
	}
	
	@GetMapping("/reply/refresh")
	@ResponseBody
	public String replyRefresh(int postid) {
		List<ReplyDto> rlist = service.selectReply(postid);
		Gson g = new Gson();
		return g.toJson(rlist);
	}

	@GetMapping("/reply/recommend")
	@ResponseBody
	public String recommend(int postid, String userid) {
		String temp = service.recplus(postid, userid);
		return temp;
	}
	
	@PostMapping("/reply/insert")
	@ResponseBody
	public String insertReply(ReplyDto dto){
		service.insertReply(dto);
		return "";
	}
	
	@PostMapping("/reply/delete")
	@ResponseBody
	public String deleteReply(int replyid) {
		service.deleteReply(replyid);
		return "";
	}
	
	
}
