package com.kh.admin.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.notice.model.service.NoticeService;
import com.kh.admin.notice.model.vo.Notice;

@WebServlet("/update.mn")
public class NoticeUpdateManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeUpdateManagementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		String noticeImportant = request.getParameter("noticeImportant");
		
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeImportant(noticeImportant);
		
		System.out.println(n);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) { //수정성공
			request.getSession().setAttribute("alertMsg", "공지사항 수정 성공 ! ");
			response.sendRedirect(request.getContextPath() + "/detail.mn?nno=" + noticeNo);
		}else { //수정실패
			request.getSession().setAttribute("alertMsg", "공지사항 수정 실패 ");
			request.getRequestDispatcher("views/notice/notice.mn").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
