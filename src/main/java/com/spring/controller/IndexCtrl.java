package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.BoardDto;
import com.spring.dto.FleaDto;
import com.spring.dto.ImgDto;
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
		
		List<FleaDto> ffdto = service.fleabest();
		FleaDto ff1 = ffdto.get(0);
		FleaDto ff2 = ffdto.get(1);
		FleaDto ff3 = ffdto.get(2);
		m.addAttribute("ff1",ff1);
		m.addAttribute("ff2",ff2);
		m.addAttribute("ff3",ff3);
		
		ImgDto fi1 = service.getImg(ff1.getImgid());
		ImgDto fi2 = service.getImg(ff2.getImgid());
		ImgDto fi3 = service.getImg(ff3.getImgid());
		m.addAttribute("fi1",fi1);
		m.addAttribute("fi2",fi2);
		m.addAttribute("fi3",fi3);
		return "index";
	}
	
	
}
