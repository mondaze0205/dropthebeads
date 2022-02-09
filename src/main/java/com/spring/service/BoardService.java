package com.spring.service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.spring.dao.BoardDao;
import com.spring.dto.*;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;
	
	public List<BoardDto> postList(int start, int end, int head, int rec, int searchType, String searchWord) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		m.put("head", head);
		m.put("rec", rec);
		m.put("searchtype", searchType);
		m.put("searchword", searchWord);
		return dao.postList(m);
	}
	
	public int count() {
		return dao.count();
	}
	
	public int savePicOld(String code, String pic_id, String pic_name) {
		String path = "";
		
		try {
			String dir = "C:/project5031/";
			Random r = new Random();
			String filename = pic_name + "_" + System.currentTimeMillis() + r.nextInt(99)+".txt";
			path = dir + filename;
			FileWriter fw = new FileWriter(path);
			fw.write(code);
			fw.close();	
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		PicDto dto = new PicDto();
		dto.setPictureid(Integer.parseInt(pic_id));
		dto.setPicname(pic_name);
		dto.setPicpath(path);
		dao.savePicOld(dto);
		return dto.getPictureid();
	}
	
	public int savePicNew(String code, String pic_name) {
		
		String path = "";
		
		try {
			String dir = "C:/project5031/";
			Random r = new Random();
			String filename = pic_name + "_" + System.currentTimeMillis() + r.nextInt(99)+".txt";
			path = dir + filename;
			FileWriter fw = new FileWriter(path);
			fw.write(code);
			fw.close();	
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		PicDto dto = new PicDto();
		dto.setPicname(pic_name);
		dto.setPicpath(path);
		dao.savePicNew(dto);
		return (dao.lastNum() - 1);
	}
	
	public String paintLoad(int pictureid) {
		
		int n = dao.checkPic(pictureid);
		Gson g = new Gson();
		JsonObject j = new JsonObject();
		
		if(n != 1) {
			j.addProperty("code", "none");
		} else {
			PicDto dto = dao.paintLoad(pictureid);
			String path = dto.getPicpath();
			String code = "";
			
			try {
				FileReader f = new FileReader(path);
				BufferedReader br = new BufferedReader(f);
				String temp;
				while((temp = br.readLine()) != null) {
					code = code + temp + "\n";
				}
				br.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			j.addProperty("code", code);
			j.addProperty("pictureid", dto.getPictureid());
			j.addProperty("picname", dto.getPicname());	
			
		}
		
		return g.toJson(j);
	}
}
