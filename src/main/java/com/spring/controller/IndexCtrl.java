package com.spring.controller;

import java.util.Iterator;
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
		int size = bbdto.size();
		BoardDto bb1 = new BoardDto();
		BoardDto bb2 = new BoardDto();
		BoardDto bb3 = new BoardDto();
		
		if(size>=1) {
			bb1 = bbdto.get(0);
		}
		if(size>=2) {
			bb2 = bbdto.get(1);
		}
		if(size>=3) {
			bb3 = bbdto.get(2);
		}
		m.addAttribute("bb1",bb1);
		m.addAttribute("bb2",bb2);
		m.addAttribute("bb3",bb3);

		
		List<FleaDto> ffdto = service.fleabest();
		int fsize = ffdto.size();
		FleaDto ff1 = new FleaDto();
		FleaDto ff2 = new FleaDto();
		FleaDto ff3 = new FleaDto();
		ImgDto fi1 = new ImgDto();
		ImgDto fi2 = new ImgDto();
		ImgDto fi3 = new ImgDto();
		
		if(fsize>=1) {
			ff1 = ffdto.get(0);
			fi1 = service.getImg(ff1.getImgid());
		}
		if(fsize>=2) {
			ff2 = ffdto.get(1);
			fi2 = service.getImg(ff2.getImgid());
		}
		if(fsize>=3) {
			ff3 = ffdto.get(2);
			fi3 = service.getImg(ff3.getImgid());
		}
			m.addAttribute("ff1",ff1);
			m.addAttribute("ff2",ff2);
			m.addAttribute("ff3",ff3);
			
			m.addAttribute("fi1",fi1);
			m.addAttribute("fi2",fi2);
			m.addAttribute("fi3",fi3);
		
		return "index";
	}
	
	
//	
//	BoardDto bb1 = bbdto.get(0);
//	BoardDto bb2 = bbdto.get(1);
//	BoardDto bb3 = bbdto.get(2);
//	m.addAttribute("bb1",bb1);
//	m.addAttribute("bb2",bb2);
//	m.addAttribute("bb3",bb3);
}
