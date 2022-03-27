package com.spring.dto;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UsersDto {
	
	@NotBlank(message = "이름을 입력해주세요.")
	@Pattern(regexp="[a-z0-9]{6,12}", message = "아이디는 영어와 숫자로만 입력해주시고 최소 6자리에서 15자리까지 가능합니다.")
	private String userid;
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
    @Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}",
            message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 16자의 비밀번호여야 합니다.")
	private String pw;
	
	@NotBlank(message = "닉네임을 입력해주세요.")
	private String nickname;

	private String address;
	
    @Email(message = "이메일 형식에 맞지 않습니다.")
	private String email;
	
	@DateTimeFormat(pattern= "yyyyMMdd")
	private Date birth;
	
	private int warning;
	private int gscore;
}
