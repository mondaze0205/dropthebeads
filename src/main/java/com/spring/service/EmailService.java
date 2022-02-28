package com.spring.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.dto.EmailVo;

@Service("emailService")
public class EmailService {
	

	@Autowired
	protected JavaMailSender mailSender;

	public boolean sendMail(EmailVo email) throws Exception {

		try {

			MimeMessage msg = mailSender.createMimeMessage();

			msg.setSubject(email.getSubject());

			msg.setText(email.getContent());

			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));

			mailSender.send(msg);

			return true;

		} catch (Exception ex) {

			ex.printStackTrace();

		}

		return false;

		
		//¼öÁ¤
	}
	
	public boolean sendMail1(EmailVo email1) throws Exception {

		try {

			MimeMessage msg = mailSender.createMimeMessage();

			msg.setSubject(email1.getSubject());

			msg.setText(email1.getContent());

			msg.setRecipient(RecipientType.TO, new InternetAddress(email1.getReceiver()));

			mailSender.send(msg);

			return true;

		} catch (Exception ex) {

			ex.printStackTrace();

		}

		return false;

	}
	
	
	
}
