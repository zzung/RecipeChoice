package com.kh.user.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/send.me")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 Properties props = new Properties();
	       props.put("mail.smtp.host", "smtp.gmail.com");
	       props.put("mail.smtp.socketFactory.port", "465");
	       props.put("mail.smtp.socketFactory.class",
	               "javax.net.ssl.SSLSocketFactory");
	       props.put("mail.smtp.auth", "true");
	       props.put("mail.smtp.port", "465");

	       Session session = Session.getDefaultInstance(props,
	           new javax.mail.Authenticator() {
	               protected PasswordAuthentication getPasswordAuthentication() {
	                   return new PasswordAuthentication("recipechoice5","recipe55");
	               }
	           });

	       try {

	           Message message = new MimeMessage(session);
	           message.setFrom(new InternetAddress("recipechoice5@gmail.com"));
	           message.setRecipients(Message.RecipientType.TO,
	                   InternetAddress.parse("jieun076311@gmail.com"));
	           message.setSubject("Testing Subject");
	           message.setText("mail text");

	           Transport.send(message);

	           System.out.println("OK");

	       } catch (MessagingException e) {
	           throw new RuntimeException(e);
	       }
	}	
		
		
	
	
}

	