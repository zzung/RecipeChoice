package com.kh.user.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.recipe.model.service.RecipeService;
import com.kh.user.recipe.model.vo.Cook;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.Recipe;
import com.kh.user.reply.model.vo.ReplyCount;

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
	
		// 쿠키 
		// 1. 쿠키를 생성한다.(생성하며 key,value를 지정한다.)
        Cookie cookie =new Cookie("rcpnum", Integer.toString(rcpNo));
        // 2. 유효시간을 설정한다. 쿠키가 유지되는 기간이다.(브라우저가 종료되도 해당 유효시간 동안은 유지된다.)
        cookie.setMaxAge(60 *60 *60);// 초단위
        // 쿠키가 적용될 경로를 지정하는데 / 해놓으면 컨텍스트패스 아래의 모든 페이지에 적용된다.
        cookie.setPath("/");
        // 3. response.addCookie()를 이용해 쿠키 정보를 반영한다.
        response.addCookie(cookie);
        // 쿠키 전달완료


		Recipe r = new RecipeService().selectDetailRecipeList(rcpNo);
		String dishType = r.getRcpDishType();
		int userNo = r.getUserNo(); 

		ArrayList<Recipe> relation = new RecipeService().relationRecipe(dishType);
		ArrayList<Recipe> myPage = new RecipeService().myPage(userNo);

		//재료리스트
		ArrayList<IngredientList> ingredient = new RecipeService().selectDetailIngList(rcpNo); 
		
		//조리
		ArrayList<Cook> cook = new RecipeService().selectDetailCookList(rcpNo); 
		
		int replyCount = new RecipeService().replyCount(rcpNo); 
		ReplyCount cr = new ReplyCount(replyCount); 

		request.setAttribute("r", r );
		request.setAttribute("ingredient", ingredient);
		request.setAttribute("cook", cook);
		request.setAttribute("relation", relation);
		request.setAttribute("myPage", myPage);
		request.setAttribute("cr", cr);
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
