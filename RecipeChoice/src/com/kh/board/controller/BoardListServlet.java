package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;

/**
 * 게시판 리스트를 가져오는 서블릿
 */
@WebServlet("/board.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String regex = "^[0-9]*$";
		String page = request.getParameter("p");
		
		
		// 넘겨받은 p값이 널인지 0인지 또는 숫자가 아닌값이 들어왔는지 확인
		if(page == null || !Pattern.matches(regex, page) || page.equals("0")) {
			page = "1";
		}
		
		PageInfo pi = new PageInfo(Integer.parseInt(page));
		
		new BoardService().getMaxPage(pi);

		ArrayList<Board> boardList = new BoardService().selectBoardList(pi.getCurrentPage());
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("pageInfo", pi);
	
		request.getRequestDispatcher("/views/board/boardListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
