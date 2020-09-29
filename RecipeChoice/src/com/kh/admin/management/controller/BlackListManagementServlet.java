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

@WebServlet("/blackList.mn")
public class BlackListManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlackListManagementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Member> blackList = new MemberService().selectBlackList();
		System.out.println(blackList);
		
		request.setAttribute("blackList", blackList);
		request.getRequestDispatcher("views/management/blackListManagement.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
