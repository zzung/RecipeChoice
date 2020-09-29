package com.kh.admin.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;

@WebServlet("/memberList.mn")
public class MemberListManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListManagementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Member> memberList = new MemberService().selectMemberList();
		System.out.println(memberList);
		
		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher("views/management/memberListManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
