package com.spring.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/")
    public String main() {
        return "index";
    }
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
	@GetMapping("/board/test")
	public String boardTest() {
		return "board/test2";
	}
	
	@GetMapping("/shop/test")
	public String shopTest() {
		return "shop/test3";
	}
	
	
	
	
}
