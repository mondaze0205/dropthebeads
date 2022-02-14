package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.FleaDao;

@Service
public class FleaService {
	
	@Autowired
	FleaDao dao;

}
