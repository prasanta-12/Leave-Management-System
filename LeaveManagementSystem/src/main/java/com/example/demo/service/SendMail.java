package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendMail {

	@Autowired
	 private JavaMailSender mailSender;
		
		public void sendMail( String toMail, String subject, String textBody,String fromMail) {
			SimpleMailMessage massage=new SimpleMailMessage();
			massage.setFrom("prasantamajhi549@gmail.com");
			massage.setTo(toMail);
			massage.setText(textBody);
			
			massage.setSubject(subject);
			mailSender.send(massage);
			
			System.out.println("Mail sent");
			
			
		}
}
