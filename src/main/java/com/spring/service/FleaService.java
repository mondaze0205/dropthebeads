package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.FleaDao;
import com.spring.dto.*;

@Service
public class FleaService {

	@Autowired
	FleaDao dao;

	public int fInsert(FleaDto dto) {
		return dao.fInsert(dto);
	}

	public List<FleaDto> fList(int start, int end, int f_category) {

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		m.put("f_category",f_category );
		return dao.fList(m);
	}

	public int count() {
		return dao.count();
	}

	public FleaDto fBoard(int f_postno) {
		dao.fViewCount(f_postno);
		return dao.fBoard(f_postno);
	}

	public int updateFboard(FleaDto dto) {
		return dao.updateFboard(dto);
	}

	public int updateImg(ImgDto dto) {
		return dao.updateImg(dto);
	}
	
	public int deleteFboard(int f_postno) {
		return dao.deleteFboard(f_postno);
	}

	public List<FleaDto> boardListSearch(int searchn, String search, int start, int end) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);

		return dao.boardListSearch(m);
	}

	public int countSearch(int searchn, String search) {
		System.out.println(searchn + search);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}

	public int imgInsert(ImgDto dto) {
		dao.imgInsert(dto);
		return (dao.laImg() - 1);
	}

	public ImgDto iBoard(int imgid) {
		return dao.iBoard(imgid);
	}

	public List<FleaCommDto> selectComm(int f_postno) {
		dao.updateReplyCount(f_postno);
		return dao.selectComm(f_postno);
	}

	public int insertComm(FleaCommDto dto) {
		return dao.insertComm(dto);
	}

	public int deleteComm(int f_cno) {
		return dao.deleteComm(f_cno);
	}

	public int commCount(int f_postno) {
		return dao.commCount(f_postno);
	}
	
	public int updateComm(FleaCommDto dto) {
		return dao.updateComm(dto);
	}

	public int cLike(FleaCommDto dto) {
		return dao.cLike(dto);
	}

	public String selectMap(int f_postno) {
	    return dao.selectMap(f_postno);
	}
	
	public List<FleaDto> selectMaps(){
		return dao.selectMaps();
	}
	
	public String match2(String imgid) {
		return dao.match2(imgid);
	}
	
}
