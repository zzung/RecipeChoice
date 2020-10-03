package com.kh.admin.faq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.faq.model.service.FaqService;
import com.kh.admin.faq.model.vo.Faq;

/**
 * Servlet implementation class FaqInsertServlet
 */
@WebServlet("/insert.mf")
public class FaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("content");
		
		Faq f = new Faq();
		f.setFaqTitle(faqTitle);
		f.setFaqContent(faqContent);
		
		int result = new FaqService().insertFaq(f);
		
		if(result > 0) { // 성공
			
			request.getSession().setAttribute("alertMsg", "성공적으로 faq 등록되었습니다."); 
			
			response.sendRedirect(request.getContextPath() + "/faqList.mf");
			
		}else { //실패 => 에러페이지
			
			request.setAttribute("errorMsg", "등록 실패 !");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);

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
