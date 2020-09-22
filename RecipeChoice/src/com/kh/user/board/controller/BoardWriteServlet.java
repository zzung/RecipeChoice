package com.kh.user.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.model.service.BoardService;
import com.kh.user.board.model.vo.Board;

/**
 * 게시글 등록 서블릿
 * Servlet implementation class boardWriteServlet
 */
@WebServlet("/boardWrite.bo")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Board writed = new Board();
		writed.setUserNo(userNo);
		writed.setCategory(category);
		writed.setBoardTitle(title);
		writed.setBoardContent(content);
		
		int result = new BoardService().insertBoardContent(writed);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "작성하신 글이 성공적으로 등록되었습니다.");
		} else {
			request.getSession().setAttribute("alertMsg", "작성글 등록에 실패하였습니다.");
		}
		
		response.sendRedirect(request.getContextPath() + "/board.bo?p=1");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
