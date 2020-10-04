package com.kh.user.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.recipe.model.service.RecipeService;
import com.kh.user.recipe.model.vo.Cook;
import com.kh.user.recipe.model.vo.Count;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeContentServlet
 */
@WebServlet("/detail.rp")
public class RecipeContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//레시피작성 메인 부분
		int rcpNo = Integer.parseInt(request.getParameter("rcpNo"));
		//String dishType = request.getParameter("dishType");
	
		Recipe r = new RecipeService().selectDetailRecipeList(rcpNo);
		String dishType = r.getRcpDishType();
		ArrayList<Recipe> relation = new RecipeService().relationRecipe(dishType);
	
		//재료리스트
		ArrayList<IngredientList> ingredient = new RecipeService().selectDetailIngList(rcpNo); 
		
		//조리
		ArrayList<Cook> cook = new RecipeService().selectDetailCookList(rcpNo); 
		
	
		
		
		request.setAttribute("r", r );
		request.setAttribute("ingredient", ingredient);
		request.setAttribute("cook", cook);
		request.setAttribute("relation", relation);
		request.getRequestDispatcher("views/recipe/recipeContent.jsp").forward(request, response); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
