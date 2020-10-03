package com.kh.admin.tip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/knowledgeList.mn")
public class KnowledgeListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KnowledgeListViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Tip> knowledgeList = new TipService().selectKnowledgeList();
		
		request.setAttribute("knowledgeList", knowledgeList);
		request.getRequestDispatcher("views/tip/knowledgeList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
