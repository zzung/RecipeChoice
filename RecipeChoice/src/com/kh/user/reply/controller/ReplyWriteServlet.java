package com.kh.user.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.reply.model.service.ReplyService;

/**
 * Servlet implementation class ReplyWriteServlet
 */
@WebServlet("/replyWrite.re")
public class ReplyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyWriteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		String memName = request.getParameter("memName");
		String content = request.getParameter("replyContent");
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		
		int result = new ReplyService().replyWrite(userNo, bno, memName, content, boardType);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
