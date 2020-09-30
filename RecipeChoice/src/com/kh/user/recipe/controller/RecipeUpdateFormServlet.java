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
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeUpdateFormServlet
 */
@WebServlet("/updateForm.rp")
public class RecipeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rcpNo = Integer.parseInt(request.getParameter("rcpNo"));
		
		Recipe r = new RecipeService().selectDetailRecipeList(rcpNo);
		ArrayList<IngredientList> ingredient = new RecipeService().selectDetailIngList(rcpNo);
		ArrayList<Cook> cook = new RecipeService().selectDetailCookList(rcpNo);
		
		request.setAttribute("r", r);
		request.setAttribute("ingredient", ingredient);
		request.setAttribute("cook", cook);
		
		request.getRequestDispatcher("view/recipe/recipeUpdateForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
