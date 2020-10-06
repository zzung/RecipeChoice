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
 * Servlet implementation class LoginMemberServlet
 */
@WebServlet("/login.me")
public class LoginMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**	츄레 로그인 서블릿
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				// 1. 전달값에 한글이 있을 경우 인코딩 처리해야됨 (POST방식일 경우)
				request.setCharacterEncoding("UTF-8");
				
				// 2. 요청시 전달값(request parameter영역) 꺼내서 변수 또는 객체에 기록하기 
			
				String userId = request.getParameter("userId"); // "사용자가 입력한 아이디"
				String userPwd = request.getParameter("userPwd"); // "사용자가 입력한 비밀번호"
				
				// 3. 해당 요청을 처리하는 서비스 클래스의 메소드 호출 및 결과 받기
				Member loginUser = new MemberService().loginMember(userId, userPwd);
				
				// 4. 처리결과를 가지고 사용자가 보게될 뷰를 지정하고 포워딩 또는 리다이렉트
				if(loginUser !=null) { //로그인 성공 => index페이지
					
					// 세션에 담아두기 
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", loginUser);
					
					if(loginUser.getMemId().equals("admin")) {
						response.sendRedirect(request.getContextPath()+"/admin.mn");
					}else {
						
					// sendRedirect 방식으로 url재요청
					response.sendRedirect(request.getContextPath());
					}
					
				}else { // 로그인 실패 => 에러페이지
					
					// 응답할 뷰에 필요한 데이터 request의 attribute에 담기
					request.setAttribute("errorMsg", "로그인에 실패했습니다.");
					
					
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
