package com.kh.user.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.recipe.model.service.RecipeService;
import com.kh.user.recipe.model.vo.PageInfo;
import com.kh.user.recipe.model.vo.Recipe;

/**
 * Servlet implementation class SearchBarServlet
 */
@WebServlet("/searchBar.sh")
public class SearchBarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;	// 총 게시글 갯수 
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		//총 게시글 갯수
		listCount = new RecipeService().selectListCount();
		//현재페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		boardLimit = 4; 
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		
		startPage = (currentPage-1)/pageLimit * pageLimit +1; 
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage<endPage) {
			endPage = maxPage; 
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Recipe> list = new RecipeService().selectRecipeList(pi);
		
		String keyword = request.getParameter("keyword");
		int searchCount = new RecipeService().searchCount(keyword);
		
		ArrayList<Recipe> search = new RecipeService().searchAll(keyword);

		request.setAttribute("pi", pi);
		request.setAttribute("searchCount", searchCount); 
		request.setAttribute("search", search);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/common/searchAll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
