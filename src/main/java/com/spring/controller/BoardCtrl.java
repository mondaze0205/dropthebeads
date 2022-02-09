package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.service.BoardService;
import com.spring.dto.*;

@Controller
public class BoardCtrl {
	
	@Autowired 
	BoardService service;
	
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
	
	@RequestMapping("/board/list")
	public String postList(@RequestParam(name="h", defaultValue="0") int head, 
			@RequestParam(name="p", defaultValue="1") int page, 
			@RequestParam(name="r", defaultValue="0") int rec, 
			@RequestParam(name="t", defaultValue="0") int searchType,
			@RequestParam(name="w", defaultValue="") String searchWord, Model m) {
		
		int count = service.count();
		if(count > 0) {
			int perPage = 10;
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			
			List<BoardDto> postList = service.postList(startRow, endRow, head, rec, searchType, searchWord);
			m.addAttribute("postList", postList);
			
			int pageNum = 5;
			int totalPages = count/perPage + (count%perPage > 0? 1:0);
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			
			if(end > totalPages) {
				end = totalPages;
			}
			
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("count", count);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		
		return "board/list";
	}
	
	
	
}
