package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.BoardDto;
import com.spring.service.IndexService;

@Controller
public class IndexCtrl {
	@Autowired
	IndexService service;
	
	@RequestMapping(value = {"/index", "/main", "/"})
	public String boardbest(Model m) {
		List<BoardDto> bbdto = service.boardbest();
		BoardDto bb1 = bbdto.get(0);
		BoardDto bb2 = bbdto.get(1);
		BoardDto bb3 = bbdto.get(2);
		m.addAttribute("bb1",bb1);
		m.addAttribute("bb2",bb2);
		m.addAttribute("bb3",bb3);
		
		return "index";
	}
}
