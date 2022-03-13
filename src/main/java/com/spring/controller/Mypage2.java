package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.spring.dto.*;
import com.spring.service.Mypage2S;

@Controller
public class Mypage2 {

	@Autowired
	Mypage2S service;
	
	@GetMapping("/temp2")
	public String temp2(HttpServletRequest request, Model m) {
		
		HttpSession session = request.getSession();
		UsersDto dto = (UsersDto)session.getAttribute("user");
		String userid = dto.getUserid();
		
		if(service.count_b(userid) != 0) {
			List<BoardDto> blist = service.mine_b(dto.getUserid());
			m.addAttribute("blist", blist);
		} else {
			m.addAttribute("blist", "none");
		}
		
		if(service.count_r(userid) != 0) {
			List<ReplyDto> rlist = service.mine_r(dto.getUserid());
			m.addAttribute("rlist", rlist);
		} else {
			m.addAttribute("rlist", "none");
		}
		
		if(service.count_p(userid) != 0) {
			List<PicDto> plist = service.mine_p(dto.getUserid());
			m.addAttribute("plist", plist);
		} else {
			m.addAttribute("plist", "none");
		}
		
		if(service.count_fb(userid) != 0) {
			List<FleaDto> fblist = service.mine_fb(dto.getUserid());
			m.addAttribute("fblist", fblist);
		} else {
			m.addAttribute("fblist", "none");
		}
		
		if(service.count_fr(userid) != 0) {
			List<FleaCommDto> frlist = service.mine_fr(dto.getUserid());
			m.addAttribute("frlist", frlist);
		} else {
			m.addAttribute("frlist", "none");
		}
		
		return "mypage/mine";
	}
}
