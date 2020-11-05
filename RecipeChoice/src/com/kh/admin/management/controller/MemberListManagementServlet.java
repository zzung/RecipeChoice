package com.kh.admin.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.common.PagingManager;
import com.kh.admin.management.model.service.ManagementService;
import com.kh.admin.notice.model.service.NoticeService;
import com.kh.user.member.model.vo.Member;

@WebServlet("/memberList.mn")
public class MemberListManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListManagementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int totalCount = new NoticeService().noticeListCount();
		String pageStr = request.getParameter("page");
		if(pageStr==null) {
			pageStr = "1";
		}
		int page = Integer.parseInt(pageStr);
		
		ArrayList<Member> memberList = new ManagementService().selectMemberList(page);
		System.out.println(memberList);
		
		request.setAttribute("pagingManager", new PagingManager(totalCount, page));
		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher("views/management/memberListManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
