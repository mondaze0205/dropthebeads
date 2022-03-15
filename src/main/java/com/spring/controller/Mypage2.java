package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.dto.*;
import com.spring.service.Mypage2S;

@Controller
public class Mypage2 {

	@Autowired
	Mypage2S service;
	
	@GetMapping(value = {"/mypage/{userid}", "/mypage/{userid}/board"})
	public String myboard(@PathVariable String userid, Model m) {
		
		if(service.beforecheck(userid) == 1) {
		
			m.addAttribute("userid", userid);

			if(service.count_b(userid) != 0) {
				List<BoardDto> blist = service.mine_b(userid);
				m.addAttribute("blist", blist);
			} else {
				m.addAttribute("blist", "none");
			}
			return "mypage/board";
		} else {
			return "mypage/none";
		}	
	}
	
	@GetMapping("/mypage/{userid}/reply")
	public String myreply(@PathVariable String userid, Model m) {
		
		if(service.beforecheck(userid) == 1) {
			
			m.addAttribute("userid", userid);
			
			if(service.count_r(userid) != 0) {
				List<ReplyDto> rlist = service.mine_r(userid);
				m.addAttribute("rlist", rlist);
			} else {
				m.addAttribute("rlist", "none");
			}
			
			return "mypage/reply";
			
		} else {
			return "mypage/none";
		}
		
		
	}
	
	@GetMapping("/mypage/{userid}/picture")
	public String mypicture(@PathVariable String userid, Model m) {
		
		if(service.beforecheck(userid) == 1) {
			
			m.addAttribute("userid", userid);
			
			if(service.count_p(userid) != 0) {
				List<PicDto> plist = service.mine_p(userid);
				m.addAttribute("plist", plist);
			} else {
				m.addAttribute("plist", "none");
			}
			
			return "mypage/mine";
			
		} else {
			return "mypage/none";
		}
		
		
	}
	
	@GetMapping("/mypage/{userid}/fboard")
	public String myfboard(@PathVariable String userid, Model m) {
		
		if(service.beforecheck(userid) == 1) {
			
			m.addAttribute("userid", userid);
			
			if(service.count_fb(userid) != 0) {
				List<FleaDto> fblist = service.mine_fb(userid);
				m.addAttribute("fblist", fblist);
			} else {
				m.addAttribute("fblist", "none");
			}
			
			return "mypage/mine";
			
		} else {
			return "mypage/none";
		}
		
		
	}
	
	@GetMapping("/mypage/{userid}/freply")
	public String myfreply(@PathVariable String userid, Model m) {
		
		if(service.beforecheck(userid) == 1) {
			
			m.addAttribute("userid", userid);
			
			if(service.count_fr(userid) != 0) {
				List<FleaCommDto> frlist = service.mine_fr(userid);
				m.addAttribute("frlist", frlist);
			} else {
				m.addAttribute("frlist", "none");
			}
			
			return "mypage/mine";
			
		} else {
			return "mypage/none";
		}
		
		
	}
}
