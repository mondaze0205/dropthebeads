package com.spring.service;


import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.spring.dao.AdminDao;
import com.spring.dto.*;

@Service
public class AdminService {

	@Autowired
	AdminDao dao;
	
	public List<BoardDto> boardbest(String today, String beforemonth){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("today", today);
		map.put("beforemonth", beforemonth);
		return dao.boardbest(map);
	}
	
	public List<FleaDto> fleabest(){
		return dao.fleabest();
	}
	
	public ImgDto getImg(int imgid) {
		return dao.getImg(imgid);
	}
	
	public int checkReports(ReportDto dto) {
		if(dao.checkReports(dto) != 0) {
			return dao.checkReportid(dto);
		} else {
			return 0;
		}
	}
	
	public String makeReports(String type, int no, String reporter) {
		
		String path = "";
		String dir = "C:/project5031/reports/";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        Calendar c1 = Calendar.getInstance();
        String today = sdf.format(c1.getTime());
		
		String filename = today + "_Report_" + type + no + ".txt";
		
		Gson g = new Gson();
		
		List<String> reporters = new ArrayList<String>();
		reporters.add(reporter);
		
		ReporterDto rdto = new ReporterDto();
		rdto.setType(type);
		rdto.setNo(no);
		rdto.setReporters(reporters);
		
		try {
			path = dir + filename;
			FileWriter fw = new FileWriter(path);
			g.toJson(rdto, fw);
			fw.close();	
			
		} catch (Exception e) {
		}
		
		return filename;
	}
	
	public String report(ReportDto rdto, String type, int no, String userid, int reportid) {
		if(reportid == 0) {
			String path = makeReports(type, no, userid);
			rdto.setReporters(path);
			dao.report(rdto);
			return "최초 신고자입니다. 활동에 감사드립니다.";
		} else {
			return checkReporters(reportid, userid);
		}
	}
	
	public String checkReporters(int reportid, String userid) {

		String dir = "C:/project5031/reports/";
		String filename = dao.checkReporters(reportid);
		String path = dir + filename;
		
		String a = "error code 666S";
		
		Gson g = new Gson();
		ReporterDto rdto = new ReporterDto();
		
		try {
			FileReader f = new FileReader(path);
			rdto = g.fromJson(f, ReporterDto.class);
			List<String> reporters = rdto.getReporters();
			if(reporters.contains(userid)) {
				a = "이미 신고하셨습니다.";
			} else {
				reporters.add(userid);
				rdto.setReporters(reporters);
				
				FileWriter fw = new FileWriter(path);
				g.toJson(rdto, fw);
				dao.stack(reportid);
				a = "신고가 완료되었습니다.";
				fw.close();
			}

		} catch (Exception e) {
		}

		return a;
	}
	
	public String checkreporters2(String filename) {

		String dir = "C:/project5031/reports/";
		String path = dir + filename;
		String a = "error code 666S";
		Gson g = new Gson();
		ReporterDto rdto = new ReporterDto();
		
		try {
			FileReader f = new FileReader(path);
			rdto = g.fromJson(f, ReporterDto.class);
			
			List<String> reporters = rdto.getReporters();
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < reporters.size(); i++) {
				sb.append(reporters.get(i));
				sb.append("\n");
			}
			a = sb.toString();

		} catch (Exception e) {
		}
		
		return a;
	}
	
	public int c_board() {
		return dao.c_board();
	}
	
	public List<Map<String, Object>> r_board() {
		return dao.r_board();
	}
	
	public int c_fboard() {
		return dao.c_fboard();
	}
	
	public List<Map<String, Object>> r_fboard() {
		return dao.r_fboard();
	}
	
	public int c_pic() {
		return dao.c_pic();
	}
	
	public List<Map<String, Object>> r_pic() {
		return dao.r_pic();
	}
	
	public int c_reply() {
		return dao.c_reply();
	}
	
	public List<Map<String, Object>> r_reply() {
		return dao.r_reply();
	}
	
	public int c_freply() {
		return dao.c_freply();
	}
	
	public List<Map<String, Object>> r_freply() {
		return dao.r_freply();
	}
	
	public int findCon(int replyid) {
		return dao.findCon(replyid);
	}
	
	public String innocence(int reportid) {
		
		String dir = "C:/project5031/reports/";
		String filename = dao.findDir(reportid);
		String path = dir + filename;
		
		try {
			
			File f = new File(path);
			f.delete();
			
		} catch (Exception e) {
		}
		
		dao.innocence(reportid);
		return path;
	}
	
	public void erase(int reportid, String type, int typeid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(type.equals("board")) {
			map.put("type", 0);		
		} else if(type.equals("fboard")) {
			map.put("type", 1);
		} else if(type.equals("picture")) {
			map.put("type", 2);
		} else if(type.equals("reply")) {
			map.put("type", 3);
		} else if(type.equals("freply")) {
			map.put("type", 4);
		}
	
		map.put("typeid", typeid);
		dao.erase(map);
		innocence(reportid);
	}
	
	public void warn(int reportid, String type, int typeid, String userid) {
		erase(reportid, type, typeid);
		dao.warn(userid);
	}
	
	public void purge(int reportid, String type, int typeid, String userid) {
		erase(reportid, type, typeid);
		dao.purge(userid);
	}

	public int count() {
		return dao.count();
	}
	
	public List<UsersDto> members(int start, int end, int order) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		m.put("order", order);
		return dao.members(m);
	}
	
	public void warn(String userid) {
		dao.warn(userid);
	}
	
	public void purge(String userid) {
		dao.purge(userid);
	}
}
