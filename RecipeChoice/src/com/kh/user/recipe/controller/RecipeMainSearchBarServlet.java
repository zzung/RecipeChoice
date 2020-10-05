package com.kh.user.recipe.controller;

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
 * Servlet implementation class RecipeMainSearchBarServlet
 */
@WebServlet("/searchBar.rp")
public class RecipeMainSearchBarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeMainSearchBarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//String[] rcpDishTypes = request.getParameterValues("dishType");
		String[] rcpTags = request.getParameterValues("tag");
		for(String t : rcpTags) {
			System.out.println("servlet tcpTags => " + t);
		}
		
		
		ArrayList<Recipe> tags = new RecipeService().tagSearch(rcpTags);
		
		
		
		//int rcpTime = Integer.parseInt(request.getParameter("time"));
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
