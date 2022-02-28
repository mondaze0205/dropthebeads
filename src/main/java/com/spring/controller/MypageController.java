package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.dto.MypageDto;
import com.spring.service.MypageService;


@Controller
public class MypageController {
	
	@Autowired
	MypageService ser;
	
	@RequestMapping("/Mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@GetMapping("/updateform")
	public String updateform(@ModelAttribute("user") MypageDto dto){
		return "mypage/updateform";		
		}
	
	@GetMapping("/nnCheck")
	@ResponseBody
	public String nnCheck(String nickname) {
		String checknn = ser.nnCheck(nickname);
		return checknn;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("user") MypageDto dto) {
		ser.updateMy(dto);
		return "redirect:user/login";
	}

	@RequestMapping("/DeleteForm")
	public String deleteForm() {
		return "mypage/deleteForm";
	}
	
	@PostMapping("/delete")
	public String delete(String formpw, @ModelAttribute("user") MypageDto dto, SessionStatus status) {
		int i = ser.deletemy(formpw, dto);
		if(i == 0) {
			return "mypage/deleteForm";
		}else {
			status.setComplete();
			return "redirect:/";
		}
	}

	
	
	
}
















