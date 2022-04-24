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
	
	@NotBlank(message = "�̸��� �Է����ּ���.")
	@Pattern(regexp="[a-z0-9]{6,12}", message = "���̵�� ����� ���ڷθ� �Է����ֽð� �ּ� 6�ڸ����� 15�ڸ����� �����մϴ�.")
	private String userid;
	
	@NotBlank(message = "��й�ȣ�� �ʼ� �Է� ���Դϴ�.")
    @Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}",
            message = "��й�ȣ�� ���� ��,�ҹ��ڿ� ����, Ư����ȣ�� ��� 1�� �̻� ���Ե� 8�� ~ 16���� ��й�ȣ���� �մϴ�.")
	private String pw;
	
	@NotBlank(message = "�г����� �Է����ּ���.")
	private String nickname;

	private String address;
	
    @Email(message = "�̸��� ���Ŀ� ���� �ʽ��ϴ�.")
	private String email;
	
	@DateTimeFormat(pattern= "yyyyMMdd")
	private Date birth;
	
	private int warning;
	private int gscore;
}
