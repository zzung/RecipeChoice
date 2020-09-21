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
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/boardUpdate.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board update = new Board();
		update.setBoardNo(bno);
		update.setCategory(category);
		update.setBoardTitle(title);
		update.setBoardContent(content);
		
		int result = new BoardService().updateBoardContent(update);
		
		if(result > 0) {
			
			response.sendRedirect(request.getContextPath() + "/boardView.bo?bno=" + bno);
			
		} else {
			request.getSession().setAttribute("alertMsg", "작성글 수정에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/board.bo?p=1");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
