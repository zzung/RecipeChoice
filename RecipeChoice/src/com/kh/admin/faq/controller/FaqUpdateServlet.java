package com.kh.admin.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.faq.model.service.FaqService;
import com.kh.admin.faq.model.vo.Faq;

/**
 * Servlet implementation class FaqUpdateServlet
 */
@WebServlet("/update.mf")
public class FaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int  fno = Integer.parseInt(request.getParameter("fno"));
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("content");
		
		Faq f = new Faq();
		f.setFaqNo(fno);
		f.setFaqTitle(faqTitle);
		f.setFaqContent(faqContent);
		
		int result = new FaqService().updateFaq(f);
		
		if(result > 0) { //성공 => 재요청 
			
			request.getSession().setAttribute("alertMsg", "게시글 수정 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/faqList.mf");
			
		}else { //실패
			
			request.setAttribute("errorMsg", "게시글 수정 실패");
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
