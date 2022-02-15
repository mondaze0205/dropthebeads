package com.spring.controller;

import org.springframework.stereotype.Controller;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.UsersDto;
import com.spring.service.UsersService;

@Controller
@SessionAttributes("user")
public class UsersController {
	
	@Autowired
	UsersService service;
	
	@ModelAttribute("user")
	public UsersDto getDto() {
		return new UsersDto();
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String userid) {
		String checkid = service.idCheck(userid);
		return checkid;
	}
	@GetMapping("/nickCheck")
	@ResponseBody
	public String nickCh(String nickname) {
		String checknick = service.nickCheck(nickname);
		return checknick;
	}
	
	@GetMapping("/join")
	public String joinform() {
		return "user/join";
	}
	
	@PostMapping("insert")
	public String insert(UsersDto dto, Model m) {
		service.insertUsers(dto);
		m.addAttribute("dto", dto);
		return "/index";
	}
	

	@GetMapping("/login")
		public String logincheck() {
		if(service.online) {
			return "/index";
		} else {
			return "user/login";
		}
	}
	@PostMapping("/trylogin")
	public String login(@ModelAttribute("welcome") @Valid UsersDto dto, BindingResult result, Model m, 
						RedirectAttributes ra) {
		if(service.checkUser(dto)) {
			service.online=true;
			UsersDto resultDto = service.login(dto);
			m.addAttribute("user", resultDto);
			return "/index"; 
		} else {
			result.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");	
			return "user/login";
		}			
		
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		service.online = false;
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("findid")
	public String findid() {
		return "user/findid";
	}
	
	@PostMapping("findidaction")
	public String findidaction(UsersDto dto, Model m ) {
		List<UsersDto> ulist = service.findid(dto);
		m.addAttribute("ulist",ulist);
		m.addAttribute("dto",dto);
		m.addAttribute("size",ulist.size());
		
		return "user/findresult";
	}
	
}
