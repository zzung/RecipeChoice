package com.kh.admin.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.notice.model.service.NoticeService;
import com.kh.admin.notice.model.vo.Notice;

@WebServlet("/insert.mn")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeImportant = request.getParameter("noticeImportant");
		String noticeContent = request.getParameter("noticeContent");
		
		System.out.println(noticeTitle);
		System.out.println(noticeImportant);
		System.out.println(noticeContent);
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeImportant(noticeImportant);
		n.setNoticeContent(noticeContent);
		
		int result = new NoticeService().insertNotice(n);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "공지사항 등록 성공 !");
		}else { 
			request.getSession().setAttribute("alertMsg", "공지사항 등록 실패 !");
		}

		response.sendRedirect(request.getContextPath()+"/notice.mn");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
