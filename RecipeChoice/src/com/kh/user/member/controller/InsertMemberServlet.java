package com.kh.user.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		

		// 객체 뽑아서 담아두기 
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request. getParameter("userName");
		String email = request.getParameter("email");
		
		Member m = new Member(userId,userPwd,userName,email);
	
		// m 전달 및 요청
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			
			// session 영역에 alert 띄워줄 메세지 담기
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원가입되었습니다.");
			
			response.sendRedirect(request.getContextPath()+"/views/member/memberEnrollForm3.jsp");
			
		}else {
			
			request.setAttribute("errorMsg","회원가입에 실패했습니다."); 
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
