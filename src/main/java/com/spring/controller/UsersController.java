package com.spring.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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

	@GetMapping("/join")
	public String joinform(Model m) {
		UsersDto dto = new UsersDto();
		m.addAttribute("insertDto", dto);
		return "user/join";
	}
	
	@PostMapping("/insert")
	public String insert(@Valid @ModelAttribute("insertDto")UsersDto dto, BindingResult errors) {
		  if (errors.hasErrors()) {
			  List<ObjectError> list = errors.getAllErrors();
			  for(ObjectError e : list) {
				  System.out.println(e.getDefaultMessage());
			  }
			  return "user/join";
		  }
		  System.out.println(dto.getEmail());
		  service.insertUsers(dto);
		  return "redirect:/ ";
	}
	
	@GetMapping("/login")
	public String logincheck(Model m) {
		UsersDto dto = new UsersDto();
		m.addAttribute("login", dto);
		return "user/login";
	}
	
	@PostMapping("/trylogin")
	public String login(@ModelAttribute("login") UsersDto dto, Model m) {
		UsersDto resultDto = service.login(dto);
		if(resultDto == null) {
			String e = "아이디나 비밀번호가 틀립니다.";
			m.addAttribute("e", e);
			return "user/login";
		} else {
			m.addAttribute("user", resultDto);
		}			
		return "redirect:/"; 
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
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/findid")
	public String findid() {
		return "user/findid";
	}
	
	@PostMapping("/findidaction")
	public String findidaction(UsersDto dto, Model m ) {
		List<UsersDto> ulist = service.findid(dto);
		m.addAttribute("ulist",ulist);
		m.addAttribute("dto",dto);
		m.addAttribute("size",ulist.size());
		
		return "user/findresult";
	}
	
	@ResponseBody
	@PostMapping("/VerifyRecaptcha")
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptcha.setSecretKey("6Lco2XweAAAAAIhUAAePZ4nvgAYOwnJpjf3BDOzf");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse))
	          return 0; // 성공
	       else return 1; // 실패
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}
	
	@GetMapping("/findpw")
	public String findpw1(Model m) {
		UsersDto dto = new UsersDto();
		m.addAttribute("dto", dto);
		return "user/findpw";
	}
		
	@GetMapping("/findsearchpw")
	@ResponseBody
	public int findpw2(UsersDto dto) {
		UsersDto dto1 = service.userlist(dto);	
		if (dto1 == null) {
			return 0;
		}
		return 1;
	}
	
	@GetMapping("user/match")
	@ResponseBody
	public String match(String userid) {
		return service.match(userid);
	}
	
}
