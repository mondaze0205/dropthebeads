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

	}

}
