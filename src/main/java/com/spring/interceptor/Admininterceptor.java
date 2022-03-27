package com.spring.interceptor;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.dto.UsersDto;

@Component
public class Admininterceptor implements HandlerInterceptor {
	public List<String> adminEssential = Arrays.asList("/admin/**");
	public List<String> adminInessentail = Arrays.asList("/admin/report");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UsersDto dto = (UsersDto) request.getSession().getAttribute("user");

		if (dto == null || dto.getUserid() == null) {
			response.sendRedirect("/login");
			return false;
		} else if(dto.getUserid().equals("dulgi")) {
			return true;	
		} else {
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter printwriter = response.getWriter();
			printwriter.print("<script>alert('권한이 없습니다.');history.back()</script>");
			printwriter.flush();
			printwriter.close();
			//response.sendRedirect("/");
			return false;
		}
	}

}
