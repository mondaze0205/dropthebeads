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
public class Logininterceptor2 implements HandlerInterceptor {
	public List<String> loginEssential = Arrays.asList("/login", "/join");
	//public List<String> loginInessential= Arrays.asList("/**");
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UsersDto dto = (UsersDto) request.getSession().getAttribute("user");

		if (dto != null && dto.getUserid() != null) {
			System.out.println(dto);
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter printwriter = response.getWriter();
			printwriter.print("<script>alert('이미 로그인되어있습니다.');history.back()</script>");
			printwriter.flush();
			printwriter.close();
			return false;
		} else {
			return true;
		}
	}

}
