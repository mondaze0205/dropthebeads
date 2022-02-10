package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.service.FleaService;

@Controller
public class FleaController {

	@Autowired
	FleaService service;
	
	@GetMapping("/flea/flist")
	public String fleaList() {
		return "flea/flist";
	}
}
