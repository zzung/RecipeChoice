package com.kh.admin.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.report.model.service.ReportService;
import com.kh.admin.report.model.vo.PageInfo;
import com.kh.admin.report.model.vo.Report;


/**
 * Servlet implementation class ReportListViewServlet
 */
@WebServlet("/reportList.mr")
public class ReportListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//페이징
		int listCount; //현재 게시글 갯수
		int currentPage; //현재 페이지 (요청 페이지)
		int pageLimit; //한 페이지 하단에 보여질 페이지 최대 갯수
		int boardLimit; // 한 페이지내에 보여질 게시글 최대갯수
		
		int maxPage;  // 전체 페이지들 중 가장 마지막 페이지
		int startPage; // 현재 페이지에 하단에 보여질 페이징 바의 시작 수
		int endPage; // 현재 페이지에 하단에 보여질 페이징 바의 끝 수
		
		listCount = new ReportService().selectListCount(); //총 게시글 갯수
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이징 정보 한 공간 담아서 보냄 ,,1.페이징 객체 2.페이지 당 보여질 게시글리스트조회
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//2
		ArrayList<Report> list = new ReportService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/report/reportList.jsp");
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
