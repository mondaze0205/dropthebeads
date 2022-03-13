package com.spring.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReporterDto {
	private String type;
	private int no;
	private List<String> reporters;
}
