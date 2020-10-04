package com.kh.user.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.model.service.BoardService;
import com.kh.user.board.model.vo.Board;
import com.kh.user.board.model.vo.PageInfo;

/**
 * Servlet implementation class WrittenBoardServlet
 */
@WebServlet("/writtenBoard.me")
public class WrittenBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WrittenBoardServlet() {
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
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("pageInfo", pi);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/writtenBoard.jsp");
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
