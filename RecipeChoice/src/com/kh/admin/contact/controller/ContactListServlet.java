package com.kh.admin.contact.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.contact.model.service.ContactService;
import com.kh.admin.contact.model.vo.Contact;

/**
 * Servlet implementation class InquiryListServlet
 */
@WebServlet("/list.co")
public class ContactListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징
				int listCount; //현재 게시글 갯수
				int currentPage; //현재 페이지 (요청 페이지)
				int pageLimit; //한 페이지 하단에 보여질 페이지 최대 갯수
				int boardLimit; // 한 페이지내에 보여질 게시글 최대갯수

		
		ArrayList<Contact> list = new ContactService().selectContactList();
		
		request.setAttribute("list", list);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/contact/contactList.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
