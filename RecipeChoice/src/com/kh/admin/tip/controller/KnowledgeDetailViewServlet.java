package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/knowledgeDetail.mn")
public class KnowledgeDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KnowledgeDetailViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int tno = Integer.parseInt(request.getParameter("tno"));
		
		int result = new TipService().increaseTipCount(tno);

		if(result > 0) {
			
			Tip t = new TipService().selectKnowledge(tno);
			System.out.println(t);
			
//			// 첨부파일 조회 (없으면 null)
//			Attachment at = new BoardService().selectFile(bno);			

			request.setAttribute("t", t);
			request.getRequestDispatcher("views/tip/knowledgeDetail.jsp").forward(request, response);
			
		}else {
			request.setAttribute("alertMsg", "해당 게시물이 유효하지 않습니다.");
			request.getRequestDispatcher("views/tip/knowledgeList.jsp").forward(request, response);
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
