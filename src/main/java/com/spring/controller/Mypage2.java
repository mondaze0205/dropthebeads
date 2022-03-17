package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

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
			return "mypage/picture";
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
			return "mypage/fboard";
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
			return "mypage/freply";
		} else {
			return "mypage/none";
		}
	}
	
	@GetMapping("/mypage2/checkpost")
	@ResponseBody
	public int checkpost(int postid) {
		return service.checkpost(postid);
	}
	
	@GetMapping("/mypage2/checkpost2")
	@ResponseBody
	public int checkpost2(int f_postno) {
		return service.checkpost2(f_postno);
	}
	
	@GetMapping("/mypage/{userid}/myinfo")
	public String myinfo(@PathVariable String userid, Model m) {
		m.addAttribute("userid", userid);
		return "mypage/info";
	}
	
	@PostMapping("/mypage2/pwCheck")
	@ResponseBody
	public String pwCheck(String pw, String userid) {
		String checkpw = service.pwCheck(userid);
		if (checkpw.equals(pw)) {
			return "o";
		}else {
			return "x";
		}
	}
	
	@GetMapping("/mypage2/nnCheck")
	@ResponseBody
	public String nnCheck(String nickname) {
		String checknn = service.nnCheck(nickname);
		return checknn;
	}
	
	@GetMapping("/mypage2/nnCheck2")
	@ResponseBody
	public String nnCheck2(String nickname, String userid) {
		String checknn2 = service.nnCheck2(userid);
		if (checknn2.equals(nickname)) {
			return "1";
		}else {
			return checknn2;
		}
	}
	
	@GetMapping("/mypage2/mailCheck")
	@ResponseBody
	public String mailCheck(String userid, String email) {
		String mailcheck = service.mailCheck(userid);
		if (mailcheck.equals(email)) {
			return "2";
		}else {
			return mailcheck;
		}
	}
	
	@PostMapping("/mypage2/update")
	public String update(UsersDto dto) {
		service.update(dto);
		return "redirect:/logout";
	}
	
	
	@GetMapping("/bye")
	public String exit() {
		return "mypage/exit";
	}
	
	@PostMapping("/mypage2/withdraw")
	@ResponseBody
	public String withdraw(UsersDto dto, SessionStatus status) {
		if(service.pwCheck(dto.getUserid()).equals(dto.getPw())) {
			service.withdraw(dto.getUserid());
			status.setComplete();
			
			return "O";
		} else {
			return "X";
		}
	}
}
