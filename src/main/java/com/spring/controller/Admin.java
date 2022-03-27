package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.AdminService;
import com.spring.dto.*;

@Controller
public class Admin {

	@Autowired
	AdminService service;
	
	@GetMapping(value = {"/main", "/"})
	public String boardbest(Model m) {

	    Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	    String toDay = date.format(today);

	    Calendar mon = Calendar.getInstance();
	    mon.add(Calendar.MONTH , -1);
	    String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());

		List<BoardDto> bbdto = service.boardbest(toDay, beforeMonth);
		List<FleaDto> ffdto = service.fleabest();

		if(bbdto.size() == 0) {
			m.addAttribute("bbdto", "none");
		} else {
			m.addAttribute("bbdto", bbdto);
		}
		System.out.println(ffdto.size());		
		System.out.println(ffdto);
		if(ffdto.size() == 0) {
			System.out.println("null");
			m.addAttribute("ffdto", "none");
		} else {			
			m.addAttribute("ffdto", ffdto);
		}
		
		return "index";
	}
	
	
	@GetMapping("/admin/office")
	public String admin(Model m) {
		int b = service.c_board();
		if(b != 0) {
			List<Map<String, Object>> r_board = service.r_board();			
			m.addAttribute("r_board", r_board);
		} else {
			m.addAttribute("r_board", "none");
		}
		
		int f = service.c_fboard();
		if(f != 0) {
			List<Map<String, Object>> r_fboard = service.r_fboard();			
			m.addAttribute("r_fboard", r_fboard);
		} else {
			m.addAttribute("r_fboard", "none");
		}
		
		int p = service.c_pic();
		if(p != 0) {
			List<Map<String, Object>> r_pic = service.r_pic();			
			m.addAttribute("r_pic", r_pic);
		} else {
			m.addAttribute("r_pic", "none");
		}
		
		int r = service.c_reply();
		if(r != 0) {
			List<Map<String, Object>> r_reply = service.r_reply();			
			m.addAttribute("r_reply", r_reply);
		} else {
			m.addAttribute("r_reply", "none");
		}
		
		int fr = service.c_freply();
		if(fr != 0) {
			List<Map<String, Object>> r_freply = service.r_freply();			
			m.addAttribute("r_freply", r_freply);
		} else {
			m.addAttribute("r_freply", "none");
		}
		
		
		return "admin/office";
	}
	
	@PostMapping("/admin/report")
	@ResponseBody
	public String report(ReportDto dto, String userid) {
		
		int reportid = service.checkReports(dto);
		
		String type = "";
		int no = 0;
		
		if(dto.getPostid() != 0) {
			type = "Board";
			no = dto.getPostid();
		} else if(dto.getF_postno() != 0) {
			type = "FBoard";
			no = dto.getF_postno();
		} else if(dto.getPictureid() != 0) {
			type = "Picture";
			no = dto.getPictureid();
		} else if(dto.getReplyid() != 0) {
			type = "Reply";
			no = dto.getReplyid();
		} else if(dto.getF_cno() != 0) {
			type = "FReply";
			no = dto.getF_cno();
		}
		
		return service.report(dto, type, no, userid, reportid);
	}
	
	@PostMapping("/admin/reporters")
	@ResponseBody
	public String reporters(String path) {
		return service.checkreporters2(path);
	}
	
	@PostMapping("/admin/findCon")
	@ResponseBody
	public int findCon(int replyid) {
		return service.findCon(replyid);
	}
	
	@PostMapping("/admin/done")
	@ResponseBody
	public String done(int reportid, String type, int typeid, String judge, String userid) {
		if(judge.equals("j1")) {
			service.innocence(reportid);
		} else if(judge.equals("j2")) {
			service.erase(reportid, type, typeid);
		} else if(judge.equals("j3")) {
			service.warn(reportid, type, typeid, userid);
		} else {
			service.purge(reportid, type, typeid, userid);
		}
		return "처리 완료";
	}
	
	@GetMapping("/admin/members")
	public String members(@RequestParam(name="p", defaultValue="1") int page, 
						  @RequestParam(name="o", defaultValue="0") int order, Model m) {
		int count = service.count();
		if(count != 0) {
			int perPage = 10;
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			
			List<UsersDto> list = service.members(startRow, endRow, order);
			m.addAttribute("list", list);
			
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
		//List<UsersDto> list = service.members();
		//m.addAttribute("list", list);
		return "admin/member";
	}
	
	@PostMapping("/admin/warn")
	@ResponseBody
	public String warn(String userid) {
		service.warn(userid);
		return "경고 누적을 1회 늘렸습니다.";
	}
	
	@PostMapping("/admin/purge")
	@ResponseBody
	public String purge(String userid) {
		service.purge(userid);
		return "강퇴되었습니다.";
	}
	
}
