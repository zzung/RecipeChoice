package com.kh.admin.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.notice.model.service.NoticeService;
import com.kh.admin.notice.model.vo.Notice;

@WebServlet("/Detail.mn")
public class NoticeDetailManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDetailManagementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		Notice n = new NoticeService().selectNotice(nno);
		
		request.setAttribute("n", n);
		request.getRequestDispatcher("views/notice/noticeDetailManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
