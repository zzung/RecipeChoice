package com.kh.user.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.board.model.service.BoardService;
import com.kh.user.board.model.vo.Board;
import com.kh.user.board.model.vo.PageInfo;
import com.kh.user.member.model.vo.Member;
import com.kh.user.recipe.model.service.RecipeService;
import com.kh.user.recipe.model.vo.Recipe;

/**
 * Servlet implementation class MypageMain
 */
@WebServlet("/mypage.me")
public class MypageMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String regex = "^[0-9]*$";
		String page = request.getParameter("p");
		String category = request.getParameter("category");
		String order = request.getParameter("order");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		// 넘겨받은 p값이 널인지 0인지 또는 숫자가 아닌값이 들어왔는지 확인
		if(page == null || !Pattern.matches(regex, page) || page.equals("0")) {
			page = "1";
		}
		
		PageInfo pi = new PageInfo(Integer.parseInt(page), category, order, searchType, keyword);
		
		new BoardService().getMaxPage(pi);

		ArrayList<Board> boardList = new BoardService().selectBoardList(pi);
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
				
		ArrayList<Recipe> list = new RecipeService().myPage(userNo);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pi);
		
		 ArrayList<Recipe> cookieList = new  ArrayList<Recipe>();
		 
		//[쿠키 정보 꺼내오기]
		// request객체에서 전체 쿠키들을 가져온다.
		Cookie[] cookies = request.getCookies();
		for (int i =0; i < cookies.length; i++) {
		    if (cookies[i].getName().contains("rcpnum")) {
		        String rcpNo = cookies[i].getValue();
		        System.out.println(rcpNo);
		       Recipe m = new RecipeService().myPage2(rcpNo);
		       cookieList.add(m);
		    }
		  
		}
		request.setAttribute("cookieList", cookieList);
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/mypage.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
