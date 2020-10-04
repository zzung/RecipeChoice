package com.kh.admin.contact.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.contact.model.service.ContactService;

/**
 * Servlet implementation class ContactDeleteListServlet
 */
@WebServlet("/delete.co")
public class ContactDeleteListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactDeleteListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int conNo = Integer.parseInt(request.getParameter("cno"));
				
		int result = new ContactService().deleteContactList(conNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의 삭제 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/contactList.co");
			
		}else {
			request.getSession().setAttribute("alertMsg", "문의 삭제 실패하였습니다.");
			request.getRequestDispatcher(request.getContextPath() + "/contactList.co").forward(request, response);
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
