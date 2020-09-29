package com.kh.admin.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;

@WebServlet("/memberDetail.mn")
public class MemberDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDetailViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("uno"));
		Member m = new MemberService().selectMember(userNo);
		
		request.setAttribute("m", m);
		request.getRequestDispatcher("views/management/memberDetailView.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
