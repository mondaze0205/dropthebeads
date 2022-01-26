package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.service.BoardService;
import com.spring.dto.BoardDto;

@Controller
public class BoardCtrl {
	
	@Autowired 
	BoardService service;
	
	@RequestMapping("/board/list")
	public String postList(@RequestParam(name="p", defaultValue="1") int page, Model m) {
		
		int count = service.count();
		if(count > 0) {
			int perPage = 5;
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			
			List<BoardDto> postList = service.postList(startRow, endRow);
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
		
		return "board/list";
	}
	
}
