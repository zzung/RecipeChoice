package com.kh.admin.contact.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.contact.model.service.ContactService;
import com.kh.admin.contact.model.vo.Contact;




/**
 * Servlet implementation class ContactUpdateServlet
 */
@WebServlet("/update.co")
public class ContactUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		String conTitle = request.getParameter("title");
		String conType = request.getParameter("category");
		String conContent = request.getParameter("content");
		
		Contact c = new Contact();
		c.setConNo(cno);
		c.setConTitle(conTitle);
		c.setConType(conType);
		c.setConContent(conContent);
		
		int result = new ContactService().updateContactList(c);
		
		if(result > 0) { //성공 => 재요청 
			
			request.getSession().setAttribute("alertMsg", "문의 수정 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/contactList.co?cno=" + cno);
			
		}else { //실패
			
			request.setAttribute("errorMsg", "문의 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
