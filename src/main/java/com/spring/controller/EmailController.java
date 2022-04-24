package com.spring.controller;


import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dto.EmailVo;
import com.spring.service.EmailService;
import com.spring.service.UsersService;



@RestController
public class EmailController {

	@Autowired
	private EmailService emailService;
	
	@Autowired
	UsersService service;

	@RequestMapping("/send")
	@ResponseBody
	public String[] sendMail(String emailAddress) throws Exception {
		
		System.out.println(emailAddress);
		
		EmailVo email = new EmailVo();
		String receiver = emailAddress; // Receiver.
		String subject = "Email 제목";
		String number = makeRandom();
		String content = "인증 번호는 "+number+"입니다.";
		
		email.setReceiver(receiver);
		email.setSubject(subject);
		email.setContent(content);

		Boolean result = emailService.sendMail(email);
		return new String[] {number, result.toString()};

	}
	
	private String makeRandom() {
		Random r = new Random();
		String number = "";
		for(int i = 0;i < 6; i++) {
			number += r.nextInt(10);
		}
		System.out.println("number:"+number);
		return number;
	}
	
	//아래 수정
	@RequestMapping("/findpwaction")
	@ResponseBody
	public String[] findpwaction(String userid, String emailid )throws Exception {
		
		EmailVo email1 = new EmailVo();
		String receiver = emailid; // Receiver.		
		String pw =  randomPw();
		String name = userid;
		String subject = name + "님 임시 비밀번호 안내입니다. ";
		String content = name+"님안녕하세요"+"임시비빌번호는는 "+pw+"입니다.";
		
		email1.setReceiver(receiver);
		email1.setSubject(subject);
		email1.setContent(content);

		Boolean result = emailService.sendMail1(email1);
		service.findpw(name, receiver, pw);

		return new String[] {receiver, result.toString()};
	}
	
	
	public static String randomPw(){
		  char pwCollectionAll[] = new char[] {'1','2','3','4','5','6','7','8','9','0',
		            'A','B','C','D','E','F','G','H','I','J','K','L','M',
		            'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
		            'a','b','c','d','e','f','g','h','i','j','k','l','m',
		            'n','o','p','q','r','s','t','u','v','w','x','y','z',
		            '!','@','#','$','%','^','&','*','(',')'};
		  char pwCollectionSpCha[] = new char[] {'!','@','#','$','%','^','&','*','(',')'};
		  char pwCollectionNum[] = new char[] {'1','2','3','4','5','6','7','8','9','0',};
		  String ranPw = "";
		  String ranPwNum = "";
		  String ranPwSpCha = "";
		  for (int i = 0; i < 1; i++) {
		   int selectRandomPw = (int)(Math.random()*(pwCollectionNum.length));
		   ranPwNum += pwCollectionNum[selectRandomPw];
		  }
		  for (int i = 0; i < 1; i++) {
		   int selectRandomPw = (int)(Math.random()*(pwCollectionSpCha.length));
		   ranPwSpCha += pwCollectionSpCha[selectRandomPw];
		  }
		  for (int i = 0; i < 8; i++) {
		   int selectRandomPw = (int)(Math.random()*(pwCollectionAll.length));
		   ranPw += pwCollectionAll[selectRandomPw];
		  }
		  return ranPwSpCha+ranPw+ranPwNum;
		 }
		
	}

		
	

	
	





