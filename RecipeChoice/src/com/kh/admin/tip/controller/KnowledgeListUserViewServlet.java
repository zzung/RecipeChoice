package com.kh.admin.tip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.common.PagingManager;
import com.kh.admin.notice.model.service.NoticeService;
import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/knowledgeList.tip")
public class KnowledgeListUserViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KnowledgeListUserViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int totalCount = new NoticeService().noticeListCount();
		String pageStr = request.getParameter("page");
		if(pageStr==null) {
			pageStr = "1";
		}
		int page = Integer.parseInt(pageStr);
		
		ArrayList<Tip> knowledgeList = new TipService().selectKnowledgeListUserView(page);
		
		request.setAttribute("pagingManager", new PagingManager(totalCount, page));
		request.setAttribute("knowledgeList", knowledgeList);
		request.getRequestDispatcher("views/tip/knowledgeListUserView.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
