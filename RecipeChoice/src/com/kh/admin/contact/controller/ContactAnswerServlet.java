package com.kh.admin.contact.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.contact.model.service.ContactService;
import com.kh.admin.contact.model.vo.Contact;

/**
 * Servlet implementation class ContactAnswerServlet
 */
@WebServlet("/answer.mc")
public class ContactAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String userNo = request.getParameter("userNo"); 
		String conTitle = request.getParameter("title");
		String conContent = request.getParameter("content");
		int conNo = Integer.parseInt(request.getParameter("conNo")); 
		
		Contact c = new Contact(); //매개변수 대신 기본생성자로
		c.setUserNo(userNo);
		c.setConTitle(conTitle);
		c.setConContent(conContent);
		c.setConNo(conNo);
		
		int result = new ContactService().insertContact(c);//처리된 행 수 받아냄
		
		if(result > 0) {//성공 ==> 1:1문의 리스트 페이지
			
			request.getSession().setAttribute("alertMsg", "성공적으로 답변이 등록되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/contactList.mc");
			
		}else { // 실패 ==> 에러페이지
			
			request.setAttribute("errorMsg","답변 등록이 실패하였습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request,response);
		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
