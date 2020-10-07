package com.kh.user.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
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
		
		 Properties props = System.getProperties();
		   props.put("mail.smtp.user","recipechoice5");
	       props.put("mail.smtp.host", "smtp.gmail.com");
	       props.put("mail.smtp.port", "465");
	       props.put("mail.smtp.starttls.enable","true");
	       props.put("mail.smtp.auth", "true");
	       props.put("mail.smtp.socketFactory.port", "465");
	       props.put("mail.smtp.socketFactory.class",
	               "javax.net.ssl.SSLSocketFactory");
	       props.put("mail.smtp.socketFactory.fallback","false");
	    
	       
	       Authenticator auth = new MyAuthentication();
	       
	       Session session = Session.getDefaultInstance(props, auth);
	       MimeMessage msg = new MimeMessage(session);
	       
	       try {

	    	   msg.setSentDate(new Date());
	    	   InternetAddress from = new InternetAddress("recipechoice5@gmail.com");
	    	   
	    	   msg.setFrom(from);
	    	   
	    	   String email = request.getParameter("userEmail");
	    	   InternetAddress to = new InternetAddress(email);
	    	   msg.setRecipient(Message.RecipientType.TO,to);
	    	   
	    	   msg.setSubject("비밀번호 인증번호","UTF-8");
	    	   
	    	   String code = request.getParameter("code_check");
	    	   request.setAttribute("code", code);
	    	   msg.setText(code,"UTF-8");

	    	   msg.setHeader("content-Type", "text/html");
	    	   
	    	   javax.mail.Transport.send(msg);
	    	   System.out.println("보냄!");
	       }catch (AddressException addr_e) {
	    	   addr_e.printStackTrace();
	       }catch(MessagingException msg_e) {
	    	   msg_e.printStackTrace();
	       }
	       RequestDispatcher rd = request.getRequestDispatcher("views/member/test.jsp");
	       rd.forward(request, response);
	}	
}

	class MyAuthentication extends Authenticator {
		
		PasswordAuthentication pa;
		
		public MyAuthentication() {
			String id = "recipechoice5";
			String pw ="recipe55";
			
			pa = new PasswordAuthentication(id, pw);
		}
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
	