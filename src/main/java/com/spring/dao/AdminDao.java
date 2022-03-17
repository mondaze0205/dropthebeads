package com.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.*;

@Mapper
public interface AdminDao {

	int checkReports(ReportDto dto);
	int checkReportid(ReportDto dto);
	String checkReporters(int reportid);
	int stack(int reportid);
	int report(ReportDto dto);
	
	int c_board();
	List<Map<String, Object>> r_board();
	int c_fboard();
	List<Map<String, Object>> r_fboard();
	int c_pic();
	List<Map<String, Object>> r_pic();
	int c_reply();
	List<Map<String, Object>> r_reply();
	int c_freply();
	List<Map<String, Object>> r_freply();
	
	int findCon(int replyid);
	
	String findDir(int reportid);
	int innocence(int reportid);
	int erase(Map<String, Object> map);
	int warn(String userid);
	int purge(String userid);
	int count();
	List<UsersDto> members(Map<String, Object> m);

}
