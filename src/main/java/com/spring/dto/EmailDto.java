package com.spring.dto;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EmailDto {
	private String address;
	private String title;
    private String message;

	
}
