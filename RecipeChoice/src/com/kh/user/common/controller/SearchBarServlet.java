package com.kh.user.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.recipe.model.service.RecipeService;
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
		
		String rcpTags[] = request.getParameterValues("tag"); 
		String rcpTag = "";
		if(rcpTags != null) {
			rcpTag = String.join(",",rcpTags); 
		}
		
		System.out.println("rcpTag:" + rcpTag);
		String rcpDishType = request.getParameter("dishType"); 
		System.out.println("dishType:"+ rcpDishType);
		
		ArrayList<Recipe> search = new RecipeService().searchAll(rcpTag,rcpDishType); 
		
		request.setAttribute("search", search);
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
