package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;

@WebServlet("/deleteKnowledge.mn")
public class KnowledgeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KnowledgeDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tnos = request.getParameter("tno");
		TipService t = new TipService();
		for(String tno : tnos.split(",")) {
			int tipNo = Integer.parseInt(tno);
			int result = t.deleteKnowledge(tipNo);
			if(!(result > 0)) {
				request.setAttribute("alertMsg", "글 삭제 실패");
				request.getRequestDispatcher(request.getContextPath()+"/knowledgeList.mn").forward(request, response);
				break;
			}
		}
		request.setAttribute("alertMsg", "글 삭제 성공 !");
		response.sendRedirect(request.getContextPath() + "/knowledgeList.mn");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
