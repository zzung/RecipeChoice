package com.kh.admin.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.management.model.service.ManagementService;
import com.kh.user.board.model.vo.Board;
import com.kh.user.member.model.vo.Member;

@WebServlet("/memberDetail.mn")
public class MemberDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDetailViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("uno"));
		Member m = new ManagementService().selectMember(userNo);
		ArrayList<Board> boardList = new ManagementService().selectBoardList(userNo);
		
		System.out.println(boardList);
		
		request.setAttribute("m", m);
		request.setAttribute("boardList", boardList);
		request.getRequestDispatcher("views/management/memberDetailView.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
