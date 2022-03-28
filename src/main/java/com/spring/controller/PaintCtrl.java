package com.spring.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping("/painter")
	public String board() {
		return "redirect:/painter/painter";
	}
	
	@GetMapping("/painter/painter")
	public String paintBoard() {
		return "painter/painter";
	}
	
	@GetMapping("/painter/save")
	public String paintSave() {
		return "painter/save";
	}
	
	@PostMapping("/painter/paintSave")
	public String paintSave(String code, String pic_id, String pic_name, String pic_user, RedirectAttributes ra) {
		
		int n = 0;
		if(pic_id.equals("new")) {
			n = service.savePicNew(code, pic_name, pic_user);
			ra.addFlashAttribute("n", n);
		} else {
			n = service.savePicOld(code, pic_id, pic_name, pic_user);
			ra.addFlashAttribute("n", n);
		}
		
		return "redirect:/painter/picsaved";
	}
	
	@GetMapping("/painter/picsaved")
	public String paintSave2(HttpServletRequest request, Model m) {
		String n = "";
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		if(map != null) {
			n = Integer.toString((int)map.get("n"));			
		}
		m.addAttribute("n", n);
		return "painter/result";
	}
	
	@GetMapping("/painter/load")
	public String paintLoad() {
		return "painter/load";
	}
	
	@GetMapping("/painter/paintLoad2")
	@ResponseBody
	public String paintLoad2(String pictureid) {
		int pictureidint = Integer.parseInt(pictureid);
		String temp = service.paintLoad(pictureidint);
		return temp;
	}
	
	@GetMapping("/painter/mypaints")
	@ResponseBody
	public String mypaints(String userid){
		return service.mypaints(userid);
	}
	
	@GetMapping("/painter/readonly/{pictureid}")
	public String readonly(@PathVariable int pictureid, Model m) {
		String s = service.paintLoad(pictureid);
		
		m.addAttribute("s", s);
		return "painter/readonly";
	}
	
}
