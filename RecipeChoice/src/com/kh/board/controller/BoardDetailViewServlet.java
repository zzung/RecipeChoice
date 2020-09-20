package com.kh.board.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class BoardDetailViewServlet
 */
@WebServlet("/boardView.bo")
public class BoardDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailViewServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String regex = "^[0-9]*$";
		String checkNum = request.getParameter("bno");
		
		// 넘겨받은 p값이 널 또는 숫자가 아닌값이 들어왔는지 확인
		if(checkNum == null || !Pattern.matches(regex, checkNum)) {
			notExistError(request, response, session);	// 잘못된 요청임으로 게시글 목록으로 돌아감
			return;
		}
		
		int bno = Integer.parseInt(checkNum);
		
		int countResult = new BoardService().updateBoardCount(bno);
		
		if(countResult <= 0) {
			notExistError(request, response, session);
			return;

		}
		
		Board b = new BoardService().selectBoardDetail(bno);
		
		if(b == null) {
			notExistError(request, response, session);
		} else {
			request.setAttribute("boardDetail", b);
			request.getRequestDispatcher("/views/board/boardDetailView.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void notExistError(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		session.setAttribute("alertMsg", "존재하지않는 게시글번호입니다.");
		response.sendRedirect(request.getContextPath() + "/board.bo?p=1");
	}

}
