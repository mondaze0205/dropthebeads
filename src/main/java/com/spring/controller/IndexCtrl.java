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
	
	@RequestMapping("/index")
	public String boardbest(Model m) {
		List<BoardDto> bbdto = service.boardbest();
		m.addAttribute("bbdto",bbdto);
		
		return "index";
	}
}
