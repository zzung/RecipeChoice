package com.kh.user.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.recipe.model.service.RecipeService;
import com.kh.user.recipe.model.vo.Count;
import com.kh.user.recipe.model.vo.PageInfo;
import com.kh.user.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipePageListServlet
 */
@WebServlet("/pageList.rp")
public class RecipePageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipePageListServlet() {
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
		
		//ArrayList<Recipe> lists = new RecipeService().selectList(pi); 
		ArrayList<Recipe> list = new RecipeService().selectRecipeList(pi);
		
		int totalCount = new RecipeService().totalCount();
		Count ct = new Count(totalCount);

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("ct", ct); 
		
		request.getRequestDispatcher("views/recipe/recipeMainView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
