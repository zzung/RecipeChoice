package com.kh.user.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.model.service.BoardService;
import com.kh.user.board.model.vo.Report;

/**
 * Servlet implementation class ReportContentServlet
 */
@WebServlet("/reportContent.re")
public class ReportContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportContentServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reporterNo = Integer.parseInt(request.getParameter("reporterNo"));
		int reportedMemNo = Integer.parseInt(request.getParameter("reportedMemNo"));
		String reason = request.getParameter("reason");
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		String replyNoTmp = request.getParameter("replyNo");
		
		System.out.println(replyNoTmp.equals(""));
		
		Report report = new Report(reporterNo, reportedMemNo, reason, boardType, bno, replyNoTmp);
		
		int result = new BoardService().reportInsert(report);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
