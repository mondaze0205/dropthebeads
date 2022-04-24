package com.spring.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String logincheck(Model m, HttpServletRequest request) {
		UsersDto dto = new UsersDto();
		m.addAttribute("login", dto);
		String referer = request.getHeader("Referer");//���� url �޾ƿ��� �ڵ�
		if(referer == null) {
			request.getSession().setAttribute("redirectURI", "/");
		}
		else if(!referer.equals("http://localhost:8087/login")) {
			request.getSession().setAttribute("redirectURI", referer);//url ���� ����							
		}
		/*
		System.out.println(referer);
		System.out.println(request.getSession().getAttribute("redirectURI"));
		*/
		return "user/login";
	}
	
	@PostMapping("/trylogin")
	public String login(@ModelAttribute("login") UsersDto dto, Model m, RedirectAttributes ra, HttpServletRequest request) {
		UsersDto resultDto = service.login(dto);
		HttpSession session = request.getSession();
		String redirectURI = (String) session.getAttribute("redirectURI");
		if(resultDto == null) {
			String e = "���̵� ��й�ȣ�� Ʋ���ϴ�.";
			ra.addFlashAttribute("e", e);
			return "redirect:/login";
		} else {
			m.addAttribute("user", resultDto);
			session.removeAttribute("redirectURI");
		}		
		//���� url��  �������� �ް� �ް� ��� ���� (�����ڵ�)
		return "redirect:"+redirectURI;
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
	          return 0; // ����
	       else return 1; // ����
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //����
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
	
	@GetMapping("game/carrotgame")
	public String carrotgame2(@ModelAttribute("user")UsersDto dto, Model m) {
		
		UsersDto aaa = service.showscore(dto.getUserid());
		m.addAttribute("aaa", aaa);

		List<UsersDto> bbb = service.descscore();
		m.addAttribute("bbb", bbb);
		
		return "game/carrotgame";
	}
	
	@PostMapping("/game/upscore")
	@ResponseBody
	public String scoreupdate(int gscore, String userid, int oldscore) {
		int i = 0;
		if(gscore > oldscore) { //���������� ������������  
			i = service.upscore(gscore, userid);
		}
		return i+"";
	}
	
}
