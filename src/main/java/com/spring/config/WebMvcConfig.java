package com.spring.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.spring.interceptor.Admininterceptor;
import com.spring.interceptor.Logininterceptor;
import com.spring.interceptor.Logininterceptor2;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		Logininterceptor loginInterceptor = new Logininterceptor();
		registry.addInterceptor(loginInterceptor).addPathPatterns(loginInterceptor.loginEssential);
		// .excludePathPatterns(loginIntercepter.loginInessential);
		Logininterceptor2 loginInterceptor2 = new Logininterceptor2();
		registry.addInterceptor(loginInterceptor2).addPathPatterns(loginInterceptor2.loginEssential);
		Admininterceptor admininterceptor = new Admininterceptor();
		registry.addInterceptor(admininterceptor).addPathPatterns(admininterceptor.adminEssential);
	}
}
