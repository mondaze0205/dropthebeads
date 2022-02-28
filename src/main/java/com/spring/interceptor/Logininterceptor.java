package com.spring.interceptor;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.dto.UsersDto;

@Component
public class Logininterceptor implements HandlerInterceptor {
	public List<String> loginEssential = Arrays.asList("/login");
	//public List<String> loginInessential= Arrays.asList("/**");
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UsersDto dto = (UsersDto) request.getSession().getAttribute("user");

		if (dto != null  && dto.getUserid() != null) {
			response.sendRedirect(" ");
			return false;
		} else {

			return true;	
		}
	}

}
