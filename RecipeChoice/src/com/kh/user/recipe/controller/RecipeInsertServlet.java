package com.kh.user.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.user.common.MyFileRenamePolicy;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.Recipe;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RecipeEnrollFormServlet
 */
@WebServlet("/enrollForm.rp")
public class RecipeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/recipe_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//1.
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo")); //"1"
			String rcpTitle = multiRequest.getParameter("rcpTitle");
			String rcpDishType = multiRequest.getParameter("rcpDishType");
			String[] rcpTags = multiRequest.getParameterValues("rcpTag");
			String rcpTag = "";
			if(rcpTags != null) {
				rcpTag = String.join(",", rcpTags);
			}
			
			int rcpTime = Integer.parseInt(multiRequest.getParameter("rcpTime"));
			String rcpContent = multiRequest.getParameter("rcpContent");
			String rcpPic = multiRequest.getFilesystemName("upfile"); // 대표이미지

			
			Recipe r = new Recipe(userNo,rcpTitle,rcpDishType,rcpTag,rcpTime,rcpContent,rcpPic);
			
			//2.
			String ingDish = multiRequest.getParameter("ingDish");
			String ingMetering = multiRequest.getParameter("ingMetering");
			
			IngredientList ingredient = new IngredientList();
			ingredient.setIngDish(ingDish);
			ingredient.setIngMetering(ingMetering);
			
			//3.
			
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
