package com.spring.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.service.PaintService;

@Controller
public class PaintCtrl {
	@Autowired
	PaintService service;
	
	@GetMapping("/painter/painter")
	public String paintBoard() {
		return "painter/painter";
	}
	
	@PostMapping("/painter/paintSave")
	public String paintSave(String code, String pic_id, String pic_name, RedirectAttributes ra) {
		
		int n = 0;
		if(pic_id.equals("new")) {
			n = service.savePicNew(code, pic_name);
			ra.addFlashAttribute("n", n);
		} else {
			n = service.savePicOld(code, pic_id, pic_name);
			ra.addFlashAttribute("n", n);
		}
		
		return "redirect:/painter/picsaved";
	}
	
	@RequestMapping("/painter/picsaved")
	public String test1(HttpServletRequest request, Model m) {
		String n = "";
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		if(map != null) {
			n = Integer.toString((int)map.get("n"));			
		}
		m.addAttribute("n", n);
		return "painter/picsaved";
	}
	
	@GetMapping("/painter/paintName")
	public String paintName() {
		return "painter/paintName";
	}
	
	@GetMapping("/painter/paintLoad")
	public String paintLoad() {
		return "painter/paintLoad";
	}
	
	@GetMapping("/painter/paintLoad2")
	@ResponseBody
	public String paintLoad2(String pictureid) {
		int pictureidint = Integer.parseInt(pictureid);
		String temp = service.paintLoad(pictureidint);
		return temp;
	}
	
}
